# Project Context

## Purpose
Operational Readiness Review (ORR) sample application. This repository is for learning purposes, particularly Go ecosystem, GoTH stack, and new AI workflows like OpenSpec.

## Tech Stack
- Go (see `go.mod`)
- HTTP API (handlers under `internal/api/handlers/`)
- Database migrations under `migrations/`
- Web assets/templates under `web/`

## Project Conventions

### Code Style
- Follow existing Go conventions already used in the codebase.
- Prefer small, readable changes that align with current patterns in `internal/`.

### Architecture Patterns
- Entry point(s): `cmd/`
- Application code: `internal/`
- HTTP layer: `internal/api/handlers/`
- Database schema evolution: `migrations/`
- Frontend assets/templates: `web/`

### Testing Strategy
- Prefer adding/updating tests alongside behavior changes.
- Use existing project test patterns (`make test`).

### Git Workflow
- Keep changes scoped to the task.
- If a request introduces new capability, breaking changes, or architectural shifts, follow the OpenSpec change proposal workflow in `@/openspec/AGENTS.md`.

## Domain Context
ORR (Operational Readiness Review) is a process and set of checks to confirm a system/service is ready for operation. Domain evolution notes live in `docs/domain.md`.

## Important Constraints
- Prefer modifying existing specs/capabilities rather than creating duplicates.
- For significant changes, create an OpenSpec change proposal before implementation (see `@/openspec/AGENTS.md`).

## External Dependencies
- Development commands and local workflow are documented in `Makefile` (start there).
- Additional project documentation:
  - `README.md`
  - `docs/development/DEVELOPMENT.md`
  - `docs/decisions/`
