SHOW databases;

USE Company;

SHOW Tables;

SELECT * FROM Employees;

-- COLUMN ALIASING EXAMPLES
-- Alias using AS keyword
SELECT
    Employee_name AS Name,
    Email AS ContactEmail,
    Salary AS MonthlySalary
FROM Employees;

-- Alias without AS keyword
SELECT
    Employee_name Name,
    Email ContactEmail,
    Salary MonthlySalary
FROM Employees;

-- TABLE ALIASING EXAMPLES
-- Alias using AS keyword
SELECT e.Employee_name, e.Email, e.Salary
FROM Employees AS e
WHERE
    e.Salary > 50000;

-- Alias without AS keyword
SELECT e.Employee_name, e.Email, e.Salary
FROM Employees e
WHERE
    e.Salary > 50000;