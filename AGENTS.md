# Operational Readiness Review (ORR) Project - Agent Guidelines

This document serves as the main entry point for AI agents to understand the project structure, goals, and how to interact with it effectively.

## Core Documentation

1. **[Project Overview](README.md)** - Start here for the main project documentation, including setup instructions and development tasks.

2. **[Domain](docs/domain.md)** - Information about domain this project operates with and its evolution.

3. **[Development Guide](docs/development/DEVELOPMENT.md)** - Comprehensive development guidelines including frontend, backend, and database practices.

4. **[Decision Log](docs/decisions/)** - Collection of key decisions and their rationales, maintained in a lightweight format.

## Project Structure

```
/orr-sample
├── cmd/                 # Main application entry points
├── internal/            # Private application code
│   └── api/             # API handlers and routes
├── migrations/          # Database migrations
├── web/                 # Frontend assets and templates
├── docs/                # Project documentation
│   ├── decisions/        # Decision log and design choices
│   ├── diagrams/        # System architecture diagrams
│   └── templates/       # Documentation templates
├── .env.example         # Example environment variables
├── Makefile             # Common development tasks
├── go.mod               # Go module definition
└── README.md            # Project overview and setup
```

## Key Files for Context

- **`Makefile`**: Contains common development tasks and their documentation.
- `internal/api/handlers/`: Contains HTTP route handlers.
- `migrations/`: Contains database migration files.
- `web/`: Contains frontend templates and static assets.

## Best Practices for AI Agents

1. **Check the Makefile First**: Most common tasks are documented there.
2. **Respect Boundaries**: Only modify files relevant to the current task.
3. **Document Changes**: Update relevant documentation when making significant changes.
4. **Follow Patterns**: Adhere to existing code patterns and styles.
5. **Keep it Simple**: Prefer simple, maintainable solutions over complex ones.
6. **Be Explicit**: When in doubt, ask for clarification rather than making assumptions.

## Getting Started

1. Review the `Makefile` for available development commands.
2. Check the `migrations/` directory for database schema information.
3. Look at existing handlers in `internal/api/handlers/` for implementation patterns.

## Common Tasks

- **Local development with hot-reload (only run once)**: `make watch`
- **Run the application**: `make run`
- **Apply migrations**: `make migrate-up`
- **Generate code**: `make generate`
- **Run tests**: `make test`

## Need Help?

If you're unsure about something, please ask for clarification rather than making assumptions.
