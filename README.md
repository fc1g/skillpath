# skillpath

Monorepo shell for SkillPath: frontend/backend as submodules and infra files

## Repositories

- `skillpath-frontend` — Next.js client for the learning platform: courses, lessons, quizzes, and AI-powered assistance.
- `skillpath-backend` — NestJS backend monorepo with a dedicated BFF as the single entrypoint for the frontend and
  separate
  microservices responsible for domain-specific logic.

Both are added as Git submodules to keep them in separate repositories.

## Getting Started

1. **Clone the repository with submodules:**
     ```bash
   git clone --recurse-submodules https://github.com/fc1g/skillpath.git
   ```

2. **Install dependencies:**
   Navigate to each submodule and install dependencies:
     ```bash
   make initialize
   ```

3. **Configure environment:**
    - Use the `.env.example` files in each `skillpath-backend/apps/` service as a reference to create corresponding
      `.env.development.local` files
    - Use the `skillpath-frontend/.env.example` file as a reference to create `.env.development.local`
    - Add the `certs` folder to `skillpath-backend` with keys required for the auth service

4. **Run the project:**
   From the root `skillpath` directory, run:
     ```bash
   make dev
   ```

For more control over available commands and workflows, check the `Makefile` in the repository root.

## Docs

Architecture and domain documentation is stored in the `docs/` folder:

- `docs/system-architecture.png` — high-level system architecture
- `docs/entities.png` — entities