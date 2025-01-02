# Stage 1: Build Frontend with Deno
FROM denoland/deno:alpine-2.1.4 AS surface
WORKDIR /app
COPY ./surface .
RUN deno task build

# Stage 2: Build Backend with Rust
FROM rust:1.83.0-alpine AS core
WORKDIR /app

# Install build dependencies
RUN apk add --no-cache \
    musl-dev \
    gcc \
    make \
    pkgconfig \
    openssl-dev

# Copy manifests and source code
COPY Cargo.toml Cargo.lock ./
COPY src ./src

# Build the application
RUN cargo build --release && \
    strip target/release/tom-core

# Stage 3: Final Runtime Image
FROM alpine:latest
WORKDIR /app

# Install runtime dependencies
RUN apk add --no-cache \
    ca-certificates \
    curl \
    libgcc \
    && addgroup -S appuser \
    && adduser -S -G appuser appuser \
    && chown -R appuser:appuser /app

# Copy artifacts from build stages
COPY --from=surface --chown=appuser:appuser /app/dist ./static
COPY --from=core --chown=appuser:appuser /app/target/release/tom-core ./

# Switch to non-root user for security
USER appuser

# Configure health check
HEALTHCHECK --interval=5s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:2000/api/health || exit 1

# Expose port and set entrypoint
EXPOSE 2000
CMD ["./tom-core"]