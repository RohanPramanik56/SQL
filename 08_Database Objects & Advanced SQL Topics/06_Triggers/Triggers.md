# Triggers
A trigger, in the context of databases, is a special type of stored procedure that automatically executes or fires in response to specific events on a particular table or view. These events can include actions like **insert, update, or delete**.

### Key Points about Triggers
- **Automatic Execution:** Unlike stored procedures that need to be called explicitly, triggers are automatically executed.
- **Specific Events:** Triggers fire in response to certain events such as insert, update, or delete on a table or view.
- **Specialty:** Triggers are considered special because they automate the execution of predefined actions in response to changes in the database.

## Tables:
#### order_details table
| order_id | product_id | quantity |
| -------: | ---------: | -------: |
|      101 |          1 |        5 |
|      102 |          2 |        3 |
|      103 |          3 |        7 |
|      104 |          4 |        2 |
|      105 |          5 |        8 |

#### products table
| product_id | quantity |
| ---------: | -------: |
|          1 |       50 |
|          2 |       30 |
|          3 |       20 |
|          4 |      100 |
|          5 |       80 |

- **Without Trigger:** You would need to manually update the product table after inserting a record into the order_details table.

- **With Trigger:** The update to the product table happens automatically after an insertion in the order_details table.

## Creating a Trigger in Oracle

### 1. View Existing Tables
``` SQL
SELECT * 
FROM order_details; 

SELECT * 
FROM products;
```
### 2. Create the Trigger
``` SQL
CREATE OR REPLACE TRIGGER update_product
AFTER INSERT ON order_details 
FOR EACH ROW 
BEGIN 
UPDATE product SET quantity = quantity - :NEW.quantity WHERE product_id = :NEW.product_id; 
END;
```
- **Trigger Name:** update_product
- **Event:** AFTER INSERT on order_details
- **Action:** Update the product table by subtracting the inserted quantity from the available quantity.

### 3. Test the Trigger
``` SQL
INSERT INTO order_details (order_id, product_id, quantity) VALUES (106, 5, 10);
```
- **Result:** The quantity in the product table for Product ID 5 should decrease by 10.

### Trigger in Oracle SQL
``` SQL
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

-- Creating Trigger
CREATE TRIGGER Update_Products -- create the trigger
AFTER UPDATE ON order_details  -- When the trigger will fire
FOR EACH ROW                   -- Where the trigger will work
    BEGIN
        UPDATE products SET quantity = quantity - :NEW.quantity   -- what would perform the trigger
        WHERE product_id =: NEW.product_id;
    END;
/

UPDATE order_details
SET quantity = 6
WHERE order_id = 105
AND product_id = 5;


SELECT * FROM order_details;
SELECT * FROM products;

DROP TRIGGER Update_Products;  -- DELETE Trigger


--- Create Trigger DeleteProductQuantity, for every delete operation the trigger will be fired, and the quantity in the product table will be updated. in this case, it will add quantity of the deleted order back to the product table.

CREATE TRIGGER DeleteProductQuantity -- create the trigger
AFTER DELETE ON order_details  -- When the trigger will fire
FOR EACH ROW                   -- Where the trigger will work
    BEGIN
        UPDATE products SET quantity = quantity + :OLD.quantity   -- what would perform the trigger
        WHERE product_id =: OLD.product_id;
    END;
/

DELETE FROM order_details WHERE order_id=105;

SELECT * FROM order_details;
SELECT * FROM products;
```


## Creating a Trigger in MySQL
### 1. View Existing Tables
``` SQL
SELECT * FROM order_details; 
SELECT * FROM product;
```
### 2. Create the Trigger
``` SQL
DELIMITER // 
CREATE TRIGGER update_product 
AFTER INSERT ON order_details 
FOR EACH ROW 
BEGIN UPDATE product SET quantity = quantity - NEW.quantity WHERE product_id = NEW.product_id; 
END // 
DELIMITER ;
```
- **DELIMITER:** Change the delimiter to handle the trigger body correctly.
- **Trigger Definition:** Similar to Oracle but using NEW keyword for referencing new values.
  
### 3. Test the Trigger
``` SQL
INSERT INTO order_details (order_id, product_id, quantity) VALUES (106, 5, 10);
```
- **Result:** The quantity in the product table for Product ID 5 should decrease by 10.

## Additional Trigger Scenarios

### 1. After Delete Trigger
- **Scenario:** When an order is deleted, the quantity of the product should be added back to the product table.
- **Trigger:**
``` SQL
CREATE OR REPLACE TRIGGER restore_product_quantity 
AFTER DELETE ON order_details 
FOR EACH ROW 
BEGIN 
UPDATE product SET quantity = quantity + :OLD.quantity WHERE product_id = :OLD.product_id; 
END;
```
### 2. Before Insert/Update/Delete Triggers
- **Scenario:** Similar to AFTER triggers, but these triggers fire before the specified event occurs.

### Trigger in MySQL
``` SQL
USE Others;

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
```