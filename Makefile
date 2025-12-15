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

gen-templ: ## Compile templ components
	templ generate

gen-css: ## Compile used Tailwind CSS utilities (JIT)
	npx @tailwindcss/cli -i ./web/assets/css/main.css -o ./web/static/css/main.css

build: gen-css gen-templ ## Build binary under bin/
	go build -o bin/orr cmd/orr/main.go

watch-templ: ## Watch source code and templ components changes
	templ generate \
		--watch \
		--proxy="http://localhost:8080" \
		--cmd="./bin/orr"

watch-css: ## Watch Tailwind CSS changes
	npx @tailwindcss/cli -i ./web/assets/css/main.css -o ./web/static/css/main.css --watch

watch: ## Hot-reload server
	@make -j 2 watch-templ watch-css run

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