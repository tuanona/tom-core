# TOM Server

## Overview

TOM Server is the core component of The Open Metaverse project, providing local hosting capabilities for metaverse spaces. It combines a high-performance Rust backend with a React-based frontend to deliver immersive 3D experiences.

## Features

- Local server deployment with minimal setup
- Admin authentication via QR code
- Real-time multiplayer support
- Grid-based world system
- GLTF asset management
- Local database storage
- WebSocket communication
- TON blockchain integration

## Technical Stack

### Backend
- Rust
- Actix Web
- SQLite
- WebSocket support

### Frontend
- TypeScript
- React
- React Three Fiber (R3F)
- Vite
- WebSocket client

## Prerequisites

- Rust toolchain (1.70 or higher)
- Node.js (18.0 or higher)
- SQLite 3
- Git

## Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd tom-server
```

2. Setup backend:
```bash
cd backend
cargo build
```

3. Setup frontend:
```bash
cd frontend
npm install
```

## Running the Server

1. Start the backend:
```bash
cd backend
cargo run
```

2. Start the frontend development server:
```bash
cd frontend
npm run dev
```

The server will be available at:
- Backend: http://localhost:8080
- Frontend: http://localhost:3000

## Development

### Backend Development

The Rust backend is structured into several modules:
- `handlers`: Request handlers and WebSocket implementation
- `models`: Data structures and database models
- `services`: Business logic and external service integration
- `utils`: Helper functions and utilities

### Frontend Development

The React frontend follows a component-based architecture:
- `components`: UI and 3D world components
- `hooks`: Custom React hooks
- `services`: API and WebSocket clients
- `store`: State management
- `utils`: Helper functions

## Testing

```bash
# Backend tests
cd backend
cargo test

# Frontend tests
cd frontend
npm test
```

## Building for Production

```bash
# Backend
cd backend
cargo build --release

# Frontend
cd frontend
npm run build
```
## Folder Structure
tom-server/
├── backend/
│   ├── src/
│   │   ├── main.rs
│   │   ├── config/
│   │   │   └── mod.rs
│   │   ├── models/
│   │   │   ├── mod.rs
│   │   │   ├── user.rs
│   │   │   ├── world.rs
│   │   │   └── asset.rs
│   │   ├── handlers/
│   │   │   ├── mod.rs
│   │   │   ├── auth.rs
│   │   │   ├── world.rs
│   │   │   └── websocket.rs
│   │   ├── services/
│   │   │   ├── mod.rs
│   │   │   ├── database.rs
│   │   │   └── blockchain.rs
│   │   └── utils/
│   │       └── mod.rs
│   ├── tests/
│   ├── Cargo.toml
│   └── README.md
│
└── frontend/
    ├── src/
    │   ├── components/
    │   │   ├── world/
    │   │   ├── ui/
    │   │   └── shared/
    │   ├── hooks/
    │   ├── services/
    │   │   ├── api.ts
    │   │   └── websocket.ts
    │   ├── store/
    │   ├── types/
    │   ├── utils/
    │   ├── App.tsx
    │   └── main.tsx
    ├── public/
    │   └── assets/
    ├── package.json
    ├── vite.config.ts
    ├── tsconfig.json
    └── README.md
    
## Configuration

Server configuration can be modified through:
- `backend/config/`: Server configuration files
- `frontend/.env`: Environment variables for frontend

## Contributing

[Contributing guidelines]

## License

[License information](https://github.com/tuanona/tom-server/blob/main/LICENSE)
