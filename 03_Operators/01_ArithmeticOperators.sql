SHOW DATABASES;
USE Company;
SHOW TABLES;
SELECT * FROM Employees;


-- SELECT with Arithmetic Operators
SELECT (Salary+10000) AS New_Salary FROM Employees;

-- Display employee names with a 10% salary increase
SELECT Employee_name, (Salary +  (Salary*.10)) AS Increased_Salary FROM Employees;

-- Display employee names with monthly and annual salary
SELECT Employee_name, Salary AS Monthly_Salary, (Salary*12) AS Annual_Salary FROM Employees;