Here's a `README.md` file for your GitHub repository that includes instructions on setting up the database and running the project:

```md
# Product API

## Description

A simple API to manage product data, built with Go and Echo framework. This API allows you to retrieve product information with support for filtering by name, sorting by stock, and pagination.

## Features

- Get all products with optional filtering by name
- Support for sorting by stock (ASC, DESC)
- Pagination support

## Prerequisites

- Go 1.16+
- MySQL

## Setup

### Step 1: Clone the Repository

```sh
git clone https://github.com/yourusername/product-api.git
cd product-api
```

### Step 2: Set Up MySQL Database

1. **Log in to MySQL**:

```sh
mysql -u root -p
```

2. **Create a new database**:

```sql
CREATE DATABASE productdb;
USE productdb;
```

3. **Create the `products` table**:

```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    category VARCHAR(255),
    price DECIMAL(10, 2),
    discountPercentage DECIMAL(5, 2),
    rating DECIMAL(3, 2),
    stock INT,
    tags JSON,
    brand VARCHAR(255),
    sku VARCHAR(255),
    weight INT,
    dimensions JSON,
    warrantyInformation VARCHAR(255),
    shippingInformation VARCHAR(255),
    availabilityStatus VARCHAR(255),
    reviews JSON,
    returnPolicy VARCHAR(255),
    minimumOrderQuantity INT,
    meta JSON,
    images JSON,
    thumbnail VARCHAR(255)
);
```

4. **Insert sample data**:

```sql
INSERT INTO products (id, title, description, category, price, discountPercentage, rating, stock, tags, brand, sku, weight, dimensions, warrantyInformation, shippingInformation, availabilityStatus, reviews, returnPolicy, minimumOrderQuantity, meta, images, thumbnail)
VALUES (
    1,
    'Essence Mascara Lash Princess',
    'The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects.',
    'beauty',
    9.99,
    7.17,
    4.94,
    5,
    JSON_ARRAY('beauty', 'mascara'),
    'Essence',
    'RCH45Q1A',
    2,
    JSON_OBJECT('width', 23.17, 'height', 14.43, 'depth', 28.01),
    '1 month warranty',
    'Ships in 1 month',
    'Low Stock',
    JSON_ARRAY(
        JSON_OBJECT('rating', 2, 'comment', 'Very unhappy with my purchase!', 'date', '2024-05-23T08:56:21.618Z', 'reviewerName', 'John Doe', 'reviewerEmail', 'john.doe@x.dummyjson.com'),
        JSON_OBJECT('rating', 2, 'comment', 'Not as described!', 'date', '2024-05-23T08:56:21.618Z', 'reviewerName', 'Nolan Gonzalez', 'reviewerEmail', 'nolan.gonzalez@x.dummyjson.com'),
        JSON_OBJECT('rating', 5, 'comment', 'Very satisfied!', 'date', '2024-05-23T08:56:21.618Z', 'reviewerName', 'Scarlett Wright', 'reviewerEmail', 'scarlett.wright@x.dummyjson.com')
    ),
    '30 days return policy',
    24,
    JSON_OBJECT('createdAt', '2024-05-23T08:56:21.618Z', 'updatedAt', '2024-05-23T08:56:21.618Z', 'barcode', '9164035109868', 'qrCode', 'https://dummyjson.com/public/qr-code.png'),
    JSON_ARRAY('https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png'),
    'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png'
);
```

### Step 3: Update Configuration

Update the MySQL connection string in `config/config.go`:

```go
DB, err = sql.Open("mysql", "user:password@tcp(127.0.0.1:3306)/productdb")
```

Replace `user` and `password` with your MySQL username and password.

### Step 4: Run the Application

```sh
go run main.go
```

The API will be available at `http://localhost:8080/products`.

## API Endpoints

### Get All Products

```sh
GET /products
```

#### Query Parameters:

- `name` (string): Filter by product name
- `sort` (string): Sort by stock (`stock_asc`, `stock_desc`)
- `page` (int): Page number for pagination
- `limit` (int): Number of items per page

### Example

```sh
curl "http://localhost:8080/products?name=Essence&sort=stock_desc&page=1&limit=10"
```

## Project Structure

```
product-api/
|-- main.go
|-- config/
|   |-- config.go
|-- handlers/
|   |-- product.go
|-- models/
|   |-- product.go
|-- utils/
|   |-- pagination.go
```

## Version Control

This project uses Git for version control. Here are the basic commands to get started:

### Initialize Git

```sh
git init
```

### Add and Commit Changes

```sh
git add .
git commit -m "Initial commit"
```

### Create a New Repository on GitHub

1. Go to GitHub and create a new repository named `product-api`.
2. Follow the instructions provided to push your local repository to GitHub.

```sh
git remote add origin https://github.com/yourusername/product-api.git
git branch -M main
git push -u origin main
```

