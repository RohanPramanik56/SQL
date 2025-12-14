SHOW DATABASES;
USE Others;
SHOW Tables;

-- Create the sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity_sold INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    customer_id INT NOT NULL
);

-- Insert sample data
INSERT INTO sales (sale_id, product_id, sale_date, quantity_sold, unit_price, customer_id)
VALUES 
    (1, 101, '2023-01-01', 10, 25.50, 1001),
    (2, 102, '2023-01-02', 15, 20.00, 1002),
    (3, 101, '2023-01-03', 7, 25.50, 1003);

-- We want to retrieve the total quantity sold, total revenue, and average unit price for each product. Additionally, the results should be ordered by the average unit price in descending order. Only include products with a total quantity sold greater than 10.
SELECT product_id, 
       SUM(quantity_sold) AS total_quantity_sold, 
       SUM(quantity_sold * unit_price) AS total_revenue, 
       AVG(unit_price) AS average_unit_price
FROM sales
GROUP BY product_id 
HAVING SUM(quantity_sold) > 10 
ORDER BY average_unit_price DESC;

/**************************************************************************************/
-- Create the sales_data table
CREATE TABLE sales_data (
    product_id INT,
    product_name VARCHAR(100),
    sales_date DATE,
    sale_amount DECIMAL(10, 2),
    category VARCHAR(50),
    customer_id INT,
    customer_name VARCHAR(100)
);

-- Insert sample data
INSERT INTO sales_data (product_id, product_name, sales_date, sale_amount, category, customer_id, customer_name)
VALUES
    (101, 'Widget A', '2023-01-01', 200.00, 'Electronics', 1001, 'John Doe'),
    (102, 'Widget B', '2023-01-02', 850.00, 'Clothing', 1002, 'Jane Smith'),
    (103, 'Widget C', '2023-01-03', 150.00, 'Electronics', 1003, 'Bob Johnson');

-- List the total sales amount for each category. Only consider sales made in the year 2023. Exclude categories with total sales amount less than 1000. Display the results in descending order of total sales amount. Include only those categories where the maximum sale amount for any product within that category is greater than 200.
SELECT category, 
       SUM(sale_amount) AS total_sales_amount 
FROM sales_data 
WHERE YEAR(sales_date) = 2023 
GROUP BY category 
HAVING SUM(sale_amount) >= 1000 AND MAX(sale_amount) > 200 
ORDER BY total_sales_amount DESC;
/**************************************************************************************/

-- Create the inventory table
CREATE TABLE inventory (
    product_id INT,
    product_name VARCHAR(100),
    quantity_in_stock INT,
    unit_price DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO inventory (product_id, product_name, quantity_in_stock, unit_price)
VALUES
    (1, 'Item A', 50, 10.00),
    (2, 'Item B', 30, 15.00),
    (3, 'Item C', 20, 25.00);
-- List the product names and their total value in stock (quantity_in_stock * unit_price). Exclude products with a total value in stock less than 500. Display the results in descending order of total value in stock.
SELECT product_name, 
       SUM(quantity_in_stock * unit_price) AS total_value_in_stock
FROM inventory 
GROUP BY product_name 
HAVING SUM(quantity_in_stock * unit_price) >= 500 
ORDER BY total_value_in_stock DESC;
/**************************************************************************************/

-- Create the employee_data table
CREATE TABLE employee_data (
    employee_id INT,
    employee_name VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10, 2),
    department VARCHAR(50),
    position VARCHAR(50)
);

-- Insert sample data
INSERT INTO employee_data (employee_id, employee_name, hire_date, salary, department, position)
VALUES
    (1, 'John Doe', '2020-01-01', 50000.00, 'IT', 'Developer'),
    (2, 'Jane Smith', '2019-02-01', 60000.00, 'Finance', 'Analyst'),
    (3, 'Bob Johnson', '2021-03-01', 45000.00, 'HR', 'Manager');
-- List the departments of employees, their positions, and the length of their names. If the length of their names is greater than 10, display 'Long', otherwise 'Short'. Calculate the average salary for each department with position. If the average salary is 0, replace it with 'No Data'. Display the results in alphabetical order of employee names.
SELECT department, 
       position, 
       employee_name, 
       LENGTH(employee_name) AS name_length, 
       CASE 
           WHEN LENGTH(employee_name) > 10 THEN 'Long' 
           ELSE 'Short' 
       END AS name_length_category, 
       CASE 
           WHEN AVG(salary) = 0 THEN 'No Data' 
           ELSE AVG(salary) 
       END AS average_salary 
FROM employee_data 
GROUP BY department, position 
ORDER BY employee_name ASC;
