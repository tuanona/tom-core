# Stage 1: Build Frontend
FROM denoland/deno:2.1.4 AS surface
WORKDIR /app
COPY surface/ ./surface
WORKDIR /app/surface
RUN deno task build

# Stage 2: Build Backend
FROM rust:1.83 AS core
WORKDIR /app
COPY . .
RUN cargo build --release

# Stage 3: Production Image
FROM debian:bullseye-slim AS production
WORKDIR /app
COPY --from=surface /app/surface/dist ./static
COPY --from=core /app/target/release/tom-core .
EXPOSE 2000
CMD ["./tom-core"]

# Stage 4: Development
FROM denoland/deno:2.1.4 AS development
WORKDIR /app
COPY . .
WORKDIR /app/surface
CMD ["deno", "task", "dev"]
