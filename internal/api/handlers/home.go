package handlers

import (
	"github.com/heitorlessa/orr-sample/web/pages"
	"github.com/labstack/echo/v4"
)

func HomeHandler(c echo.Context) error {
	component := pages.Home()
	ctx := c.Request().Context()

	return component.Render(ctx, c.Response().Writer)
}
