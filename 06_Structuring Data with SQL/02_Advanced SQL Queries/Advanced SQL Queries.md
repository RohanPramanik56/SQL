# All Select Clause
SELECT statement is crucial for effective data retrieval and analysis. The core clauses you need to understand are SELECT, FROM, WHERE, GROUP BY, HAVING, and ORDER BY. 

## Syntax of All Clauses in the SELECT Statement

#### SELECT Clause
Specifies the columns or expressions to be displayed.
`SELECT column1, column2, ... FROM table_name;`

#### FROM Clause
Indicates the table(s) from which to retrieve data.
`SELECT column1, column2, ... FROM table1, table2, ...;`

#### WHERE Clause
Sets conditions for filtering rows.
`SELECT column1, column2, ... FROM table_name WHERE condition;`

#### GROUP BY Clause
Groups rows that have the same values into summary rows.
`SELECT column1, aggregate_function(column2) FROM table_name WHERE condition GROUP BY column1;`

#### HAVING Clause 
Filters groups based on a condition involving aggregate functions.
`SELECT column1, aggregate_function(column2) FROM table_name WHERE condition  GROUP BY column1 HAVING aggregate_function(column2) condition;`

#### ORDER BY Clause
Sorts the results.
`SELECT column1, column2, ... FROM table_name WHERE condition GROUP BY column1 HAVING aggregate_function(column2) condition ORDER BY column1 ASC|DESC;`


## Examples
### We want to retrieve the total quantity sold, total revenue, and average unit price for each product. Additionally, the results should be ordered by the average unit price in descending order. Only include products with a total quantity sold greater than 10.

#### Table:
--------------------------------------------------------------------------------
| sale_id | product_id | sale_date  | quantity_sold | unit_price | customer_id |
|:--------|:-----------|:-----------|:--------------|:-----------|:------------|
| 1       | 101        | 2023-01-01 | 10            | 25.50      | 1001        |
| 2       | 102        | 2023-01-02 | 15            | 20.00      | 1002        |
| 3       | 101        | 2023-01-03 | 7             | 25.50      | 1003        |
--------------------------------------------------------------------------------

``` SQL
SELECT product_id, 
       SUM(quantity_sold) AS total_quantity_sold, 
       SUM(quantity_sold * unit_price) AS total_revenue, 
       AVG(unit_price) AS average_unit_price
FROM sales
GROUP BY product_id 
HAVING SUM(quantity_sold) > 10 
ORDER BY average_unit_price DESC;
```
#### Explanation:
- **SELECT Clause:** Retrieves product_id, total quantity sold, total revenue, and average unit price.
- **FROM Clause:** Specifies the sales table.
- **GROUP BY Clause:** Groups results by product_id.
- **HAVING Clause:** Filters to include only those products with a total quantity sold greater than 10.
- **ORDER BY Clause:** Orders results by average_unit_price in descending order.

###  List the total sales amount for each category. Only consider sales made in the year 2023. Exclude categories with total sales amount less than 1000. Display the results in descending order of total sales amount. Include only those categories where the maximum sale amount for any product within that category is greater than 200.

#### Table:
| product_id | product_name | sales_date | sale_amount | category    | customer_id | customer_name |
|------------|--------------|------------|-------------|-------------|-------------|---------------|
| 101        | Widget A     | 2023-01-01 | 200.00      | Electronics | 1001        | John Doe      |
| 102        | Widget B     | 2023-01-02 | 850.00      | Clothing    | 1002        | Jane Smith    |
| 103        | Widget C     | 2023-01-03 | 150.00      | Electronics | 1003        | Bob Johnson   |

``` SQL
SELECT category, 
       SUM(sale_amount) AS total_sales_amount 
FROM sales_data 
WHERE YEAR(sales_date) = 2023 
GROUP BY category 
HAVING SUM(sale_amount) >= 1000 AND MAX(sale_amount) > 200 
ORDER BY total_sales_amount DESC;
```
#### Explanation:
- **SELECT Clause:** Retrieves category and total sales amount.
- **FROM Clause:** Specifies the sales_data table.
- **WHERE Clause:** Filters records to include only those from the year 2023.
- **GROUP BY Clause:** Groups results by category.
- **HAVING Clause:** Filters to include categories with total sales amount of at least 1000 and a maximum sale amount greater than 200.
- **ORDER BY Clause:** Orders results by total_sales_amount in descending order.

### List the product names and their total value in stock (quantity_in_stock * unit_price). Exclude products with a total value in stock less than 500. Display the results in descending order of total value in stock.

#### Table
--------------------------------------------------------------
| product_id | product_name | quantity_in_stock | unit_price |
|------------|--------------|-------------------|------------|
| 1          | Item A       | 50                | 10.00      |
| 2          | Item B       | 30                | 15.00      |
| 3          | Item C       | 20                | 25.00      |
--------------------------------------------------------------
``` SQL
SELECT product_name, 
       SUM(quantity_in_stock * unit_price) AS total_value_in_stock
FROM inventory 
GROUP BY product_name 
HAVING SUM(quantity_in_stock * unit_price) >= 500 
ORDER BY total_value_in_stock DESC;
```
#### Explanantion:
- **SELECT Clause:** Retrieves product_name and total value in stock.
- **FROM Clause:** Specifies the inventory table.
- **GROUP BY Clause:** Groups results by product_name.
- **HAVING Clause:** Filters to include only those products with a total value in stock of at least 500.
- **ORDER BY Clause:** Orders results by total_value_in_stock in descending order.

### List the departments of employees, their positions, and the length of their names. If the length of their names is greater than 10, display 'Long', otherwise 'Short'. Calculate the average salary for each department with position. If the average salary is 0, replace it with 'No Data'. Display the results in alphabetical order of employee names.


#### Table
--------------------------------------------------------------------------------
| employee_id | employee_name | hire_date  | salary  | department | position   |
|-------------|---------------|------------|---------|------------|------------|
| 1           | John Doe      | 2020-01-01 | 50000.00| IT         | Developer  |
| 2           | Jane Smith    | 2019-02-01 | 60000.00| Finance    | Analyst    |
| 3           | Bob Johnson   | 2021-03-01 | 45000.00| HR         | Manager    |
--------------------------------------------------------------------------------

``` SQL
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
```
#### Explanation:
- **SELECT Clause:** Retrieves department, position, employee_name, length of employee_name, categorization of name length, and average salary.
- **FROM Clause:** Specifies the employee_data table.
- **GROUP BY Clause:** Groups results by department and position.
- **ORDER BY Clause:** Orders results by employee_name in ascending order.