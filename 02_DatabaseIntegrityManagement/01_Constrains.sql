CREATE DATABASE IF NOT EXISTS Company;
USE Company;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Employee_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    HireDate DATE DEFAULT (CURRENT_DATE),
    Salary DECIMAL(10, 2),
    CONSTRAINT chk_salary CHECK (Salary > 0)
);

INSERT INTO Employees (EmployeeID, Employee_name, Email, Salary) VALUES
(1, 'Alice Johnson', 'alice.johnson@email.com', 60000),
(2, 'Bob Smith', 'bob.smith@email.com', 55000);



SELECT * FROM Employees;