# TOM-Server

## Overview
TOM-Server is a core component of The Open Metaverse (TOM) ecosystem. This server handles essential functionalities like managing local databases, enabling interactions between users, and connecting to TOM's blockchain-based smart contracts for minting NFTs. The project is open source and welcomes contributions from the community.

## Key Features
- Containerized with Docker for easy deployment.
- Developed with TypeScript for frontend interactions and Rust for backend services.
- Provides APIs for seamless integration with TOM-TMA (Telegram Mini App) and TOM-SmartContract.
- Implements local storage with optional blockchain minting for data permanence.

## License
This project is licensed under the **The Open Metaverse License (TOML)**:
1. You are free to clone, modify, and distribute this project, including commercial use.
2. Attribution is mandatory. You must include this license in any distribution and credit "The Open Metaverse."
3. All integrations must use the official smart contracts provided by The Open Metaverse.

## Contributor Acknowledgment
All contributors to this project will be listed in the CONTRIBUTORS.md file. Contributions include code, documentation, testing, and any other support for the project.

## Repository Structure
- **tom-server/**: This repository, which includes both the TypeScript and Rust components.
- **tom-tma/**: The Telegram Mini App interface.
- **tom-smartcontract/**: Blockchain-based smart contracts for the TOM ecosystem.

## Roadmap

### Phase 1: Initial Setup
- [x] Define project structure.
- [x] Create Docker environment for server.
- [x] Set up TypeScript frontend framework.
- [x] Initialize Rust backend with Actix-web.

### Phase 2: Core Features
- [ ] Implement local database management.
- [ ] Develop APIs for user interactions and blockchain integration.
- [ ] Enable QR-based login flow via TMA.
- [ ] Establish data minting and retrieval mechanisms.

### Phase 3: Testing and Optimization
- [ ] Comprehensive testing of API endpoints.
- [ ] Optimize Rust backend for performance.
- [ ] Test Docker deployment on multiple platforms.

### Phase 4: Community and Expansion
- [ ] Open project for community contributions.
- [ ] List contributors in CONTRIBUTORS.md.
- [ ] Provide extensive documentation for developers.

## How to Contribute
1. Fork the repository from the official TOM GitHub organization: [The Open Metaverse](https://github.com/orgs/the-open-metaverse).
2. Clone your fork and create a new branch for your feature.
3. Submit a pull request with a detailed explanation of your changes.

## Installation

### Prerequisites
- Docker
- Node.js (for TypeScript frontend)
- Rust (with Cargo package manager)

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/the-open-metaverse/tom-server.git
   cd tom-server
   ```
2. Build and run the Docker container:
   ```bash
   docker-compose up --build
   ```
3. Access the server locally at `http://localhost:3000`.

## Community
Join our community to discuss ideas, report bugs, and share feedback:
- **Discord**: [TOM Community](https://discord.gg/the-open-metaverse)
- **GitHub Discussions**: [TOM Discussions](https://github.com/orgs/the-open-metaverse/discussions)

## Contact
For inquiries and support, email us at [support@theopenmetaverse.org](mailto:support@theopenmetaverse.org).
