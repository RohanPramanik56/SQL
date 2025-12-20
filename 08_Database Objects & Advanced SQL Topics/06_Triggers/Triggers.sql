USE Others;

SHOW Tables;




CREATE TABLE order_details (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT
);

INSERT INTO order_details (order_id, product_id, quantity) VALUES
(101, 1, 5),
(102, 2, 3),
(103, 3, 7),
(104, 4, 2),
(105, 5, 8);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    quantity INT
);

INSERT INTO products (product_id, quantity) VALUES
(1, 50),
(2, 30),
(3, 20),
(4, 100),
(5, 80);

--- Create Trigger DeleteProductQuantity, for every delete operation the trigger will be fired, and the quantity in the product table will be updated. in this case, it will add quantity of the deleted order back to the product table.
DELIMITER //
CREATE TRIGGER DeleteProductQuantity
AFTER DELETE ON order_details
FOR EACH ROW
BEGIN
    UPDATE products
    SET quantity = quantity + OLD.quantity
    WHERE product_id = OLD.product_id;
END; //
DELIMITER ;
-- Testing the trigger by deleting an order from order_details table
DELETE FROM order_details WHERE order_id = 101;
-- Checking the products table to see if the quantity has been updated
SELECT * FROM products WHERE product_id = 1;

SELECT * FROM order_details;
SELECT * FROM products;