SHOW DATABASES;
USE Others;

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    product_price DECIMAL(10,2) NOT NULL
);

INSERT INTO product (product_id, product_name, product_price) VALUES
(1, 'Laptop', 899.99),
(2, 'Smartphone', 499.50),
(3, 'Tablet', 299.99),
(4, 'Monitor', 199.99),
(5, 'Keyboard', 49.99),
(6, 'Mouse', 29.99),
(7, 'Printer', 149.99),
(8, 'Webcam', 89.99),
(9, 'Headphones', 79.99),
(10, 'Speakers', 59.99);

SELECT * FROM product;

-- MOD function to get the remainder of product prices when divided by 100
SELECT product_name, product_price, MOD(product_price, 100) AS PriceDividedBy100 FROM product;

-- ABS function to get the absolute value of product prices (in case of negative prices)
SELECT product_name, product_price, ABS(product_price) AS Absolute_Price FROM product;

-- ROUND function to round product prices to the nearest integer
SELECT product_name, product_price, ROUND(product_price) AS Rounded_Price FROM product;

-- ROUND function to round product prices to 1 decimal place
SELECT product_name, product_price, ROUND(product_price, 1) AS Rounded_Price_3Decimals FROM product;

-- CEIL function to round product prices up to the nearest integer
SELECT product_name, product_price, CEIL(product_price) AS Ceil_Price FROM product;

-- FLOOR function to round product prices down to the nearest integer
SELECT product_name, product_price, FLOOR(product_price) AS Floor_Price FROM product;

-- POWER function to calculate the square of product prices
SELECT product_name, product_price, POWER(product_price, 2) AS Price_Squared FROM product;

-- POW function to calculate the cube of product prices
SELECT product_name, product_price, POW(product_price, 3) AS Price_Cubed FROM product;
SELECT product_name, product_price, POW(product_price, 0.5) AS Price_SquareRoot FROM product;
SELECT product_name, product_price, POW(product_price, 4) AS PriceX4 FROM product;

-- SQRT function to calculate the square root of product prices
SELECT product_name, product_price, SQRT(product_price) AS Price_SquareRoot FROM product;

-- TRUNCATE function to truncate product prices to 1 decimal place
SELECT product_name, product_price, TRUNCATE(product_price, 1) AS Truncated_Price FROM product;

-- LOG function to calculate the natural logarithm of product prices
SELECT product_name, product_price, LOG(product_price) AS Price_NaturalLog FROM product;

-- EXP function to calculate the exponential of product prices
SELECT product_name, product_price, EXP(product_price) AS Price_Exponential FROM product;