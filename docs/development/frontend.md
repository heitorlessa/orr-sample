# Frontend Development Guide

## Tech Stack

| Name             | Description                                                      | Docs                            |
|------------------|------------------------------------------------------------------|---------------------------------|
| **Templ**        | Component-based frontend in Go                                   | https://templ.guide/llms.md     |
| **Tailwind CSS** | Utility-first CSS framework                                      | https://tailwindcss.com/docs/   |
| **DaisyUI**      | Component library for Tailwind to reduce inline CSS class galore | https://daisyui.com/llms.txt    |
| **HTMX**         | For hypermedia interactions                                      | https://htmx.org/docs/          |
| **Alpine.js**    | For micro interactions to reduce network calls                   | https://alpinejs.dev/start-here |

## Project Structure

```bash
web/
├── assets/          # Static assets (CSS, JS, images)
├── components/      # Reusable UI components
├── layouts/         # Page layouts
├── pages/           # Page templates
└── static/          # Compiled assets and static files served as-is
```

## Component Guidelines

1. **Naming**: Use PascalCase for component names (e.g., `Button.templ`)
2. **Props**: Document required and optional props at the top of each component
3. **Styling**: Use Tailwind utility classes directly in templates. Prefer DaisyUI components to reduce bytes sent
   over-the-wire and cognitive load, where possible
4. **State Management**: Prefer server-side state with HTMX for interactivity
5. **Micro interactions**: Prefer CSS-first, otherwise Alpine.js for micro interactions to reduce network calls like
   switching between default and survey mode
6. **Minimal JS**: When crafting Alpine.js interactions, prefer separate files to make it easy to test while adhering to
   Locality of Behaviour
7. **Desktop only**: This app is restricted to desktop only so a Macbook Pro 13' is the minimum screen size *(ignore
   smaller than that)*

## Development Workflow

1. Run `make watch` to start the development server with hot-reload
2. Create new components in `web/components/`
3. Use `@apply` in `web/assets/css/` for custom styles when needed
4. Reference components in pages using their package path

## Best Practices

- Keep components small and focused
- Use semantic HTML elements
- Follow DaisyUI's component patterns

