# Build stage
FROM rust:1.83.0 as builder

WORKDIR /usr/src/app

# Install musl-tools for static linking
RUN apt-get update && \
    apt-get install -y musl-tools && \
    rustup target add x86_64-unknown-linux-musl

# Copy manifests
COPY Cargo.toml Cargo.lock ./

# Create dummy main.rs to cache dependencies
RUN mkdir src && \
    echo "fn main() {}" > src/main.rs && \
    cargo build --target x86_64-unknown-linux-musl --release && \
    rm -rf src

# Copy actual source code
COPY src ./src

# Build the actual application with static linking
RUN cargo build --target x86_64-unknown-linux-musl --release

# Runtime stage
FROM alpine:3.18

RUN apk add --no-cache curl

WORKDIR /usr/local/bin

# Copy the statically linked binary
COPY --from=builder /usr/src/app/target/x86_64-unknown-linux-musl/release/tom-core .

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

CMD ["tom-core"]