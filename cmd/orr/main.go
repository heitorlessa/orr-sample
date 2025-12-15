package main

import (
	"github.com/heitorlessa/orr-sample/internal/api/handlers"
	"github.com/labstack/echo/v4"
)

const STATIC_ASSETS = "web/static"

func main() {
	e := echo.New()

	e.Static("/static", STATIC_ASSETS)
	e.GET("/", handlers.HomeHandler)
	e.Logger.Fatal(e.Start(":8080"))
}
