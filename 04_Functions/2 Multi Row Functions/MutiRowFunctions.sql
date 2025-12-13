SHOW DATABASES;
USE Company;
SHOW Tables;

SELECT * FROM Employees;

-- Count the total number of employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- SUM of all salaries
SELECT SUM(Salary) AS TotalSalaries FROM Employees;

-- Average salary of employees
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Minimum salary in the company
SELECT MIN(Salary) AS MinimumSalary FROM Employees;

-- Maximum salary in the company    
SELECT MAX(Salary) AS MaximumSalary FROM Employees;