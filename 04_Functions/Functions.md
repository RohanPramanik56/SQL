# FUNCTIONS
Functions in SQL are built-in routines designed to perform specific tasks. These tasks can range from simple arithmetic operations to more complex string manipulations and date calculations.\
**Types of SQL Functions :**
- **Single Row Functions**
- **Multiple Row Functions**

## Single Row Functions:
Single row functions operate on each row of a table and return a single result for each row.
- **String Functions:** These functions operate on string values and allow for manipulation and transformation of text.
- **Number Functions:** These functions perform operations on numeric values.
- **Date and Time Functions:** These functions handle date and time values, allowing for calculations and formatting.
- **Flow Control Functions:** These functions provide control over the flow of SQL statements.
### Here is a comprehensive list of single row functions available in MySQL:
#### String Functions :
- **Upper():** Converts a string to uppercase.
- **Lower():** Converts a string to lowercase.
- **Length():** Returns the length of a string.
Reverse(): Reverses a string.
- **Concat():** Concatenates two or more strings.
- **Replace():** Replaces occurrences of a specified - **string with another string.
- **Substr():** Extracts a substring from a string.
- **Instr():** Returns the position of the first - occurrence of a substring in a string.
- **Trim():** Removes leading and trailing spaces from a string.
- **Lpad():** Pads the left side of a string with a specified set of characters.
- **Rpad():** Pads the right side of a string with a specified set of characters.
- **Left():** Extracts a specified number of characters from the left side of a string.
- **Right():** Extracts a specified number of characters from the right side of a string.
- **Ascii():** Returns the ASCII value of the leftmost character of a string.
```SQL
SHOW DATABASES;
USE Company;
SHOW TABLES;
SELECT * FROM Employees;

INSERT INTO Employees (EmployeeID, Employee_name, Email, HireDate, Salary) VALUES
(3, 'Charlie Brown', 'charlie.brown@example.com', '2023-03-18', 72000),
(4, 'Diana Miller', 'diana.miller@example.com', '2021-07-25', 68000),
(5, 'Ethan Wilson', 'ethan.wilson@example.com', '2020-12-01', 50000),
(6, 'Fiona Davis', 'fiona.davis@example.com', '2023-06-21', 75000),
(7, 'George Harris', 'george.harris@example.com', '2022-02-14', 64000),
(8, 'Hannah Lewis', 'hannah.lewis@example.com', '2021-10-09', 59000),
(9, 'Ian Walker', 'ian.walker@example.com', '2019-08-30', 71000),
(10, 'Julia Turner', 'julia.turner@example.com', '2023-05-12', 67000),
(11, 'Kevin Reed', 'kevin.reed@example.com', '2022-03-17', 52000),
(12, 'Laura Price', 'laura.price@example.com', '2023-04-25', 61000),
(13, 'Michael Clark', 'michael.clark@example.com', '2020-07-19', 76000),
(14, 'Nina Foster', 'nina.foster@example.com', '2021-11-10', 58000),
(15, 'Oliver King', 'oliver.king@example.com', '2022-08-05', 69000),
(16, 'Paula Scott', 'paula.scott@example.com', '2023-01-22', 63000),
(17, 'Quentin Hayes', 'quentin.hayes@example.com', '2020-10-03', 54000),
(18, 'Rachel Collins', 'rachel.collins@example.com', '2021-03-12', 70000),
(19, 'Samuel Morgan', 'samuel.morgan@example.com', '2022-06-28', 73000),
(20, 'Tina Peterson', 'tina.peterson@example.com', '2019-12-14', 49000),
(21, 'Uma Brooks', 'uma.brooks@example.com', '2023-02-16', 62000),
(22, 'Victor Ramos', 'victor.ramos@example.com', '2021-05-09', 78000),
(23, 'Wendy Adams', 'wendy.adams@example.com', '2022-09-30', 60000),
(24, 'Xavier Grant', 'xavier.grant@example.com', '2020-04-26', 74000),
(25, 'Yvonne Mitchell', 'yvonne.mitchell@example.com', '2023-07-11', 66000),
(26, 'Zachary Parker', 'zachary.parker@example.com', '2021-12-20', 72000);

-- UPPER function to convert employee names to uppercase
SELECT UPPER(Employee_name) AS Uppercase_Name FROM Employees;
-- LOWER function to convert employee names to lowercase
SELECT LOWER(Employee_name) AS Lowercase_Name FROM Employees;
-- LENGTH function to get the length of employee names
SELECT Employee_name, LENGTH(Employee_name) AS Name_Length FROM Employees;
SELECT Employee_name FROM Employees WHERE LENGTH(Employee_name) > 12;
-- REVERSE function to reverse employee names
SELECT Employee_name, REVERSE(Employee_name) AS Reversed_Name FROM Employees;
-- CONCAT function to concatenate first and last names
SELECT CONCAT(Employee_name, '/$-&', HireDate) AS Password FROM Employees;
SELECT CONCAT(Employee_name, ' - ', Email, ' / ', HireDate) AS random_Info FROM Employees;
-- SUBSTRING function to extract a portion of employee names
SELECT Employee_name, SUBSTRING(Employee_name, 1, 5) AS Name_Part FROM Employees;
-- INSTR function to find the position of a substring in employee names
SELECT Employee_name, INSTR(Employee_name, 'an') AS Position_of_a FROM Employees; -- only return 1st occurrence
SELECT Employee_name, INSTR(Employee_name, 'e') AS Position_of_e FROM Employees;
-- LPAD function to pad employee names on the left
SELECT Employee_name, LPAD(Employee_name, 20, '*') AS Left_Padded_Name FROM Employees; -- Total name length will be 20, if less than 20 then left side will be padded ith '*'
-- RPAD function to pad employee names on the right 
SELECT Employee_name, RPAD(Employee_name, 20, '#') AS Right_Padded_Name FROM Employees; -- Total name length will be 20, if less than 20 then right side will be padded ith '#'
-- TRIM function to remove leading and trailing spaces from employee names
SELECT Employee_name, TRIM(Employee_name) AS Trimmed_Name FROM Employees;
-- LEFT function to get the leftmost characters of employee names
SELECT Employee_name, LEFT(Employee_name, 4) AS Left_Chars FROM Employees;
-- RIGHT function to get the rightmost characters of employee names
SELECT Employee_name, RIGHT(Employee_name, 3) AS Right_Chars FROM Employees;
-- ASCII function to get the ASCII value of the first character of employee names
SELECT Employee_name, ASCII(Employee_name) AS First_Char_ASCII FROM Employees;
-- CHAR function to get the character corresponding to an ASCII value
SELECT CHAR(75) AS Character_For_ASCII_75; -- K
SELECT CHAR(97) AS Character_For_ASCII_97; -- a
-- NOW function to get the current date and time
SELECT NOW() AS Current_DateTime;
```

#### Number Functions :
- **Mod():** Returns the remainder of a division operation.
- **Round():** Rounds a number to a specified number of decimal places.
- **Truncate():** Truncates a number to a specified number of decimal places.
- **Power():** Returns the value of a number raised to the power of another number.
- **Pow():** Alias for Power().
- **Sqrt():** Returns the square root of a number.
- **Abs():** Returns the absolute value of a number.
- **Ceil():** Rounds a number up to the nearest integer.
- **Floor():** Rounds a number down to the nearest integer.
``` SQL
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
```

#### Date and Time Functions :
- **Date():** Extracts the date part of a date or datetime expression.
- **Time():** Extracts the time part of a date or datetime expression.
- **Sysdate():** Returns the current date and time.
- **Localtime():** Alias for Now().
- **Now():** Returns the current date and time.
- **Current_date():** Returns the current date.
- **Curdate():** Alias for Current_date().
- **Current_time():** Returns the current time.
- **Timestampdiff():** Returns the difference between two date or datetime values.
- **Date_add(): **Adds a time or date interval to a date and returns the result.
- **Day():** Returns the day of the month for a date.
- **Month():** Returns the month for a date.
- **Year():** Returns the year for a date.
- **Dayname():** Returns the name of the weekday for a date.

``` SQL
/*
Common Date and Time Functions


SYSDATE(): Returns the current date and time of the system.

NOW(): Returns the current date and time.

LOCALTIME(): Returns the current local date and time.

CURRENT_DATE(): Returns the current date.

CURDATE(): Returns the current date.

CURRENT_TIME(): Returns the current time.

CURTIME(): Returns the current time.
*/

-- Using SYSDATE() 
SELECT SYSDATE() AS current_date_time; 
-- Using NOW() 
SELECT NOW() AS current_date_time; 
-- Using LOCALTIME() 
SELECT LOCALTIME() AS current_date_time;
-- Using CURRENT_DATE() 
SELECT CURRENT_DATE() AS current_date;
-- Using CURDATE() 
SELECT CURDATE() AS current_date;
-- Using CURRENT_TIME()  
SELECT CURRENT_TIME() AS current_time;  
 -- Using CURTIME()   
SELECT CURTIME() AS current_time;
```

#### Flow Control Functions :
- **IF():** Returns one value if a condition is true and another value if it is false.
- **IFNULL():** Returns a specified value if the expression is NULL.
- **NULLIF():** Compares two expressions and returns NULL if they are equal.
- **COALESCE():** Returns the first non-NULL value in a list of expressions.

``` SQL
SHOW DATABASES
USE Company;
CREATE TABLE NewEmployees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    designation VARCHAR(50),
    phone VARCHAR(15),
    mobile VARCHAR(15),
    office VARCHAR(15),
    salary INT
);

INSERT INTO NewEmployees (employee_id, name, designation, phone, mobile, office, salary) VALUES
(1, 'John Doe', 'Software Engineer', '1234567890', NULL, '9876543210', 500000),
(2, 'Jane Smith', 'HR Manager', NULL, '1234567890', NULL, 60000),
(3, 'Mark Brown', 'Intern', NULL, NULL, NULL, 0);

-- IF Function: The IF function in SQL works similarly to the if conditional control construct in programming languages.
SELECT IF(5 + 5 = 10, 'True', 'False') AS result;
-- Write a query to display the names and designations of all employees, and if the salary is greater than 0, display "Paid" as status; otherwise, display "Unpaid".
SELECT name, designation, IF(salary > 0, 'Paid', 'Unpaid') AS status 
FROM NewEmployees;



-- IFNULL Function: The IFNULL function returns the first argument if it is not null
SELECT IFNULL(NULL, 'No Value') AS result;
-- Write a query to display the names and office phone numbers of employees. If the office number is null, display "Not Available".
SELECT name, designation, IFNULL(office, 'Not Available') AS office_status 
FROM NewEmployees;


-- NULLIF Function: The NULLIF function returns null if the first argument equals the second argument; otherwise, it returns the first argument.
SELECT NULLIF(0, 0) AS result;
-- Write a query to display the name and salary of employees. If the salary is 0, display null.
SELECT name, NULLIF(salary, 0) AS salary 
FROM NewEmployees;

-- COALESCE Function: The COALESCE function returns the first non-null value in a list of expressions.
SELECT COALESCE(NULL, NULL, 'First Non-Null Value', NULL) AS result;
-- Write a query to display the employee ID, name, designation, and any one of the phone numbers (in the priority order: mobile, office, phone).
SELECT employee_id, name, designation, COALESCE(mobile, office, phone) AS phone_number 
FROM employee;
```


## Multiple Row Functions
Multi-Row Functions are also known as Aggregate Functions or Group Functions. Unlike Single Row Functions, Multi-Row Functions do not have subtypes but they include several key functions that help in aggregating data across multiple rows.
### Here are the primary Multi-Row Functions:
- **COUNT():** Counts the number of rows in a result set.
- **SUM():** Calculates the sum of all values in a numeric column.
- **AVG():** Calculates the average value of a numeric column.
- **MAX():** Finds the maximum value in a set of values.
- **MIN():** Finds the minimum value in a set of values.