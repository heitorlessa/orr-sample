package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

const mg = "Hello ORR"

func main() {
	e := echo.New()

	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, mg)
	})

	e.Logger.Fatal(e.Start(":8080"))
}
