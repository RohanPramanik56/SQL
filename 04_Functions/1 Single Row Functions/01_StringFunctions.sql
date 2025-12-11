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