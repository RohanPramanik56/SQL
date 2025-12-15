SHOW DATABASES;
USE Others;
SELECT * FROM customers;
SELECT * from orders;


-- Create sample table1 for join examples
DROP TABLE IF EXISTS table1;
CREATE TABLE table1 (
    A INT,
    B INT
);
INSERT INTO table1 (A, B) VALUES (1, 2), (3, 4), (5, 6), (7, 8);
SELECT * FROM table1

-- Create sample table2 for join examples
CREATE TABLE table2 (
    B INT,
    C INT
);
INSERT INTO table2 (B, C) VALUES (4, 1), (3, 1), (8, 1);
SELECT * FROM table2;

-- Equi Join Example
-- Write a query to perform an equi join on table1 and table2 where table1's column B is equals to table2's column B
SELECT *
FROM table1, table2
WHERE table1.B = table2.B;

-- Inner Join Example
-- Write a query to perform an inner join on table1 and table2 
SELECT *
FROM table1
INNER JOIN table2
ON table1.B = table2.B;

-- Natural Join
-- Write a query to perform a natural join on table1 and table2
SELECT *
FROM table1
NATURAL JOIN table2; -- Here no need to define the comparing condition, it will be defiend automatically

-- Left Join Example
-- Write a query to perform a left join on table1 and table2