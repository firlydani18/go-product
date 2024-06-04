package main

import (
	"go-product/config"
	"go-product/handlers"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	e := echo.New()
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	config.InitDB()

	e.GET("/products", handlers.GetProducts)

	e.Start(":8080")
}
