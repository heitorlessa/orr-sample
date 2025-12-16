package main

import (
	"github.com/heitorlessa/orr-sample/internal/api/handlers"
	"github.com/labstack/echo/v4"
	"os"
)

const STATIC_ASSETS = "web/static"
const DEFAULT_PORT = ":8080"

func main() {
	e := echo.New()

	e.Static("/static", STATIC_ASSETS)
	e.GET("/", handlers.HomeHandler)

	port := os.Getenv("PORT")
	if port == "" {
		port = DEFAULT_PORT
	}

	e.Logger.Fatal(e.Start(":" + port))
}
