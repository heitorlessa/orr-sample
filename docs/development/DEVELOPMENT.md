# Development Guide

This is the main entry point for development documentation. For detailed information, please refer to the following guides:

## Core Guides

1. [Frontend Development](frontend.md) - Templ, Tailwind, DaisyUI, HTMX, and Alpine.js
2. [Backend Development](backend.md) - Go, Echo, and Templ handlers
3. [Database Guide](database.md) - PostgreSQL, Goose migrations, and SQLc

## Getting Started

### Prerequisites

- Go 1.24+
- Node.js 18+ (for frontend dependencies)
- PostgreSQL 15+
- Docker & Docker Compose

### Local Development

```bash
# Start dependencies
docker-compose up -d

# Run migrations
make migrate

# Start development server with hot-reload
make watch
```

## Project Structure

```
/orr-sample
├── cmd/                 # Application entry points
├── internal/            # Private application code
│   └── api/             # HTTP handlers
├── migrations/          # Database migrations
├── web/                 # Frontend assets and templates
│   ├── assets/          # CSS and JS
│   ├── components/      # Reusable UI components
│   ├── layouts/         # Page layouts
│   └── pages/           # Page templates
├── docs/                # Project documentation
└── .env.example         # Example environment variables
```

## Development Workflow

### Branching Strategy

- `main` - Production-ready code
- `feature/*` - New features
- `fix/*` - Bug fixes
- `docs/*` - Documentation updates

### Code Review

- All changes require at least one approval
- Ensure tests pass before merging
- When `mkdocs-material` is in place, ensure equivalent docs are always part of pull/merge requests
- Keep commits focused and atomic, following conventional message

## Code Style

- **Go**: Follow [Effective Go](https://golang.org/doc/effective_go.html)
- **Templ**: Group related components, use proper indentation
- **SQL**: UPPERCASE keywords, 2-space indentation
- **CSS**: Use Tailwind utility classes first, custom CSS when necessary

## Documentation

- Keep documentation in sync with code changes
- Use clear, concise language
- Include examples for complex functionality
- Update relevant sections when making changes

## Need Help?

- Check the [AGENTS.md](../../AGENTS.md) for project context
- Review the [domain documentation](../domain.md) for business logic
- Look at existing patterns in the codebase
