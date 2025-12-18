# Database Guide

## Tech Stack

| Name           | Description                        |
|----------------|------------------------------------|
| **PostgreSQL** | Primary database                   |
| **Goose**      | Database migrations                |
| **SQLc**       | SQL to Go code gen for type safety |

## Migrations

### Creating Migrations

You can use goose CLI or manually create a file manually under `./migrations` folder with the naming convention:

```bash
goose -dir ./migrations create add_column_to_table
```

### Running Migrations

```bash
make migrate

# Rollback the last migration
make migrate-down
```

### Migration Guidelines

1. Always write idempotent SQL
2. Include both `up` and `down` migrations
3. Test migrations in a development environment first
4. Never modify migrations after they've been applied to production

## Schema Design

### Naming Conventions

- Tables: `snake_case` plural (e.g., `assessments`, `questions`)
- Columns: `snake_case`
- Primary keys: `id`
- Foreign keys: `{table}_id` (e.g., `assessment_id`)
- Timestamps: `created_at`, `updated_at` (UTC)

### Common Patterns

- Add `NOT NULL` constraints where appropriate
- Use `CHECK` constraints for domain validation
- Add appropriate indexes for query performance
- Prevent "death by a thousand JOINs" and be flexible on not everything needs to be normalized

## Connection Management

- Use connection pooling
- Set appropriate timeouts
- Handle connection retries for transient failures
