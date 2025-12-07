SHOW DATABASES;

USE Company;

-- Department Table 
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    Department_name VARCHAR(50),
    Location VARCHAR(100)
);

INSERT INTO Departments VALUES
(101, 'Human Resources', 'New York'),
(102, 'Engineering', 'San Francisco');


--- EmployeeDepartments Table with Foreign Key Constraint
CREATE TABLE EmployeeDepartments (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO EmployeeDepartments VALUES
(1, 'Alice Johnson', 'alice@johnson@gmail.com', 101),
(2, 'Bob Smith', 'bob@smith@outlook.com', 102);

-- Query to join EmployeeDepartments with Departments
SELECT ed.EmployeeID, ed.Name, d.Department_name
FROM EmployeeDepartments ed
JOIN Departments d ON ed.DepartmentID = d.DepartmentID;

Commit;