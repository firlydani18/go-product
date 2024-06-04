package utils

import (
	"strconv"

	"github.com/labstack/echo/v4"
)

func GeneratePagination(c echo.Context, page, limit int) map[string]interface{} {
	u := c.Request().URL
	query := u.Query()
	query.Set("page", strconv.Itoa(page))
	u.RawQuery = query.Encode()
	next := u.String()

	if page > 1 {
		query.Set("page", strconv.Itoa(page-1))
		u.RawQuery = query.Encode()
	}
	prev := u.String()

	return map[string]interface{}{
		"current_page": page,
		"limit":        limit,
		"next_page":    next,
		"prev_page":    prev,
	}
}
