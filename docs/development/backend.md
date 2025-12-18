# Backend Development Guide

## Tech Stack

| Component    | Purpose                   | Documentation                                  |
|--------------|---------------------------|------------------------------------------------|
| **Go 1.24+** | Core programming language | [Go Docs](https://golang.org/doc/)             |
| **Echo**     | Web framework             | [Echo Guide](https://echo.labstack.com/guide/) |
| **Templ**    | HTML templates            | [Templ Docs](https://templ.guide/)             |
| **HTMX**     | Dynamic HTML updates      | [HTMX Docs](https://htmx.org/docs/)            |

> **Frontend Integration**: See the [Frontend Development Guide](./frontend.md) for details on how the frontend works with these backend components.

## Project Structure

```
internal/
└── api/
    └── handlers/    # HTTP request handlers
        ├── home.go  # Home page handler
        └── ...      # Other route handlers
```

## Design Principles

1. **Handler-Page Relationship**
    - Each handler typically renders a corresponding Templ page
    - Page components live in `web/pages/`
    - Example: `handlers.HomeHandler` → `pages.Home()`
    - Use `templ.Handler` to render pages:
      ```go
      func HomeHandler(c echo.Context) error {
         return render(c, pages.Home())
      }
      ```

2. **Hypermedia First**
    - Default response is HTML (using Templ)
    - Use HTMX for dynamic updates
    - Keep client-side JavaScript minimal

2. **Routing**
    - Define routes in `cmd/orr/main.go`
    - Group related routes with descriptive prefixes
    - Use RESTful conventions where applicable

3. **Handlers**
    - Keep handlers focused and simple
    - Move business logic to separate packages as needed
    - Use request/response types defined near handlers

## Development Workflow

### Creating a New Handler

1. Create a new file in `internal/api/handlers/`
2. Define handler functions with the signature:
   ```go
   func HandleSomething(c echo.Context) error {
       // Handler implementation
       return render(c, pages.Something())
   }
   ```
3. Create corresponding Templ page in `web/pages/`:
   ```templ
   // something.templ
   package pages
   
   templ Something() {
       @layouts.Base() {
           <div>Page content</div>
       }
   }
   ```
4. Register the route in `cmd/orr/main.go`

### Error Handling

- Use `echo.HTTPError` for HTTP errors
- Log errors with context
- Return user-friendly error pages using Templ components
- Example:
  ```go
  func HandleSomething(c echo.Context) error {
      if err := doSomething(); err != nil {
          return render(c, pages.Error("Something went wrong"))
      }
      return render(c, pages.Success())
  }
  ```

## Testing

### Handler Tests

```go
func TestHandleSomething(t *testing.T) {
e := echo.New()
req := httptest.NewRequest(http.MethodGet, "/", nil)
rec := httptest.NewRecorder()
c := e.NewContext(req, rec)

// Test the handler
if assert.NoError(t, HandleSomething(c)) {
assert.Equal(t, http.StatusOK, rec.Code)
// Add more assertions
}
}
```

## Best Practices

1. **Keep it Simple**
    - Prefer simple, straightforward code
    - Avoid premature abstraction
    - Focus on the happy path first

2. **Dependencies**
    - Use dependency injection for testability
    - Keep dependencies minimal

3. **Performance**
    - Use context for request-scoped values and cancellation
    - Be mindful of allocations in hot paths
