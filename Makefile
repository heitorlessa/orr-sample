.PHONY: help
.DEFAULT_GOAL := help

# Help styling
HELP_TITLE      := Available commands:
HELP_USAGE      := Usage: make <target>
HELP_COL_WIDTH  := 18

COLOR_TITLE := \033[1;36m
COLOR_TARGET := \033[1;32m
COLOR_DIM := \033[2m
COLOR_RESET := \033[0m

## DB migrations setup
### Load .env if present (local dev); make native dotenv
ifneq (,$(wildcard .env))
include .env
export
endif

DB_HOST ?= localhost
DB_PORT ?= 5432
DB_NAME ?= orr
DB_USER ?= orr
DB_SSLMODE ?= disable

DATABASE_URL := postgres://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/$(DB_NAME)?sslmode=$(DB_SSLMODE)
MIGRATIONS_DIR := ./migrations
## DB migrations setup

gen-templ: ## Compile templ components
	templ generate

gen-css: ## Compile used Tailwind CSS utilities (JIT)
	npx @tailwindcss/cli -i ./web/assets/css/main.css -o ./web/static/css/main.css

build: gen-css gen-templ ## Build binary under bin/
	go build -o bin/orr cmd/orr/main.go

run: build ## One-off build and run binary
	./bin/orr

watch-templ: ## Watch source code and templ components changes
	templ generate \
		--watch \
		--proxy="http://localhost:8080" \
		--cmd="./bin/orr"

watch-css: ## Watch Tailwind CSS changes
	npx @tailwindcss/cli -i ./web/assets/css/main.css -o ./web/static/css/main.css --watch

watch: ## Hot-reload server
	@make -j 2 watch-templ watch-css

db-check: ## Ensure DATABASE_URL is set
	@test -n "$(DATABASE_URL)" || (echo "DATABASE_URL is not set"; exit 1)

migrate: db-check ## Apply all pending migrations
	goose -dir $(MIGRATIONS_DIR) postgres "$(DATABASE_URL)" up

migrate-status: db-check ## Show current migration status
	goose -dir $(MIGRATIONS_DIR) postgres "$(DATABASE_URL)" status

migrate-down: db-check ## Roll back the most recent migration
	goose -dir $(MIGRATIONS_DIR) postgres "$(DATABASE_URL)" down

migrate-reset: db-check ## Roll back all migrations
	$(GOOSE) -dir $(MIGRATIONS_DIR) postgres "$(DATABASE_URL)" reset

help: ## Show this help
	@printf "\n$(COLOR_TITLE)%s$(COLOR_RESET)\n\n" "$(HELP_TITLE)"
	@awk 'BEGIN { \
			FS=":.*##[[:space:]]*"; \
			TARGET_COLOR="$(COLOR_TARGET)"; \
			RESET="$(COLOR_RESET)"; \
			WIDTH=$(HELP_COL_WIDTH); \
		} \
		/^[A-Za-z0-9_.-]+:.*##[[:space:]]*/ { \
			printf "  " TARGET_COLOR "%-*s" RESET " %s\n", WIDTH, $$1, $$2 \
		}' $(MAKEFILE_LIST)
	@printf "\n$(COLOR_DIM)%s$(COLOR_RESET)\n\n" "$(HELP_USAGE)"
