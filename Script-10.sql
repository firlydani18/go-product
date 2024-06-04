CREATE DATABASE productdb;
USE productdb;

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



SELECT * FROM products;
