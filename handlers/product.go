package handlers

import (
	"net/http"
	"strconv"

	"go-product/config"
	"go-product/models"
	"go-product/utils"

	"github.com/labstack/echo/v4"
)

func GetProducts(c echo.Context) error {
	name := c.QueryParam("name")
	sort := c.QueryParam("sort")
	page, _ := strconv.Atoi(c.QueryParam("page"))
	limit, _ := strconv.Atoi(c.QueryParam("limit"))

	if page == 0 {
		page = 1
	}
	if limit == 0 {
		limit = 10
	}

	offset := (page - 1) * limit

	query := "SELECT * FROM products WHERE title LIKE ?"
	if sort == "stock_asc" {
		query += " ORDER BY stock ASC"
	} else if sort == "stock_desc" {
		query += " ORDER BY stock DESC"
	}
	query += " LIMIT ? OFFSET ?"

	rows, err := config.DB.Query(query, "%"+name+"%", limit, offset)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}
	defer rows.Close()

	var products []models.Product
	for rows.Next() {
		var product models.Product
		if err := rows.Scan(&product.ID, &product.Title, &product.Description, &product.Category, &product.Price, &product.DiscountPercentage, &product.Rating, &product.Stock, &product.Tags, &product.Brand, &product.SKU, &product.Weight, &product.Dimensions, &product.WarrantyInformation, &product.ShippingInformation, &product.AvailabilityStatus, &product.Reviews, &product.ReturnPolicy, &product.MinimumOrderQuantity, &product.Meta, &product.Images, &product.Thumbnail); err != nil {
			return c.JSON(http.StatusInternalServerError, err.Error())
		}
		products = append(products, product)
	}

	response := map[string]interface{}{
		"data":       products,
		"pagination": utils.GeneratePagination(c, page, limit),
	}

	return c.JSON(http.StatusOK, response)
}
