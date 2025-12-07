# Data Integraity

## CONSTRAINS:
- **UNIQUE:** use in a column, so the column will only accept the unique value.
- **NOT NULL**: use in a column, so the column will not accept the null value.
- **PRIMARY KEY:** use in a column, so the column will be unique and not null.
- **CHECK**: use in a column, so the column will to check certain condition.
- **DEFAULT**: use in a column, so the column will to add some default value itself.
- **FOREIGN KEY**: Maintains relationship with other tables.

``` sql
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
```

## FOREIGN KEY:
FOREIGN KEY constraints connect two tables together, preventing actions that might mess up data relationships. This helps keep data accurate and reflects real-world relationships correctly.\
Imagine a company's system with two main types of data: employees and the departments they work in.
- We usually deal with two tables:
    - **Departments Table :**
    ``` SQL
    CREATE TABLE Departments 
    ( 
        DepartmentID INT PRIMARY KEY, 
        DepartmentName VARCHAR(50), 
        Location VARCHAR(50) 
    );
    ```
    - **Employees Table :**
    ``` SQL
    CREATE TABLE Employees 
    ( 
        EmployeeID INT PRIMARY KEY, 
        Name VARCHAR(50), 
        Email VARCHAR(100) UNIQUE, 
        DepartmentID INT, 
        FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
    );
    ```
``` SQL
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
```

## ALIAS:
### Column Alias
**What is an Alias in SQL?**
An alias in SQL is a temporary name assigned to a table or column that exists only for the duration of the query. Aliases help enhance readability and can make complex SQL queries simpler to understand and maintain.
**Column Aliases: Simplifying Data Presentation**
Column aliases are used to rename a column in the output of a query. This renaming helps clarify the data's meaning without altering the underlying database schema.
- How to Define Column Aliases 
    - **Using AS Keyword :**\
    The **AS** keyword is optional but recommended for clarity. It clearly separates the column name from the alias name.
        - **Without Quotes :**
            - If the alias name does not contain spaces or special characters, it can be written without quotes.\
            `SELECT employee_name AS EmployeeName FROM Employees;`
        - **With Quotes :**
            - If you prefer the alias to include spaces, special characters, or if it improves readability, enclose the alias in double quotes.\
            `SELECT employee_name AS "Employee Full Name" FROM Employees;`
    - **Without AS Keyword :**
        - You can omit the AS keyword for brevity, but this practice might reduce readability, especially for those unfamiliar with your code.\
        `SELECT employee_name "Employee Full Name" FROM Employees;`

### Table Alias
Table aliases simplify the referencing of tables, particularly when performing operations involving multiple accesses to the same table or to emphasize the role of a table in specific query contexts.

**Implementing Table Aliases :**\
When using table aliases, you can make your SQL queries more concise, especially when the table names are long or when the same table is referenced multiple times in different contexts.

**Example Table Alias with AS:**\
`SELECT E.EmployeeID, E.Name FROM Employees AS E;`\
Here, E is an alias for the Employees table, making the query shorter and the reference to the table clear.\
**Table Alias without AS:**\
`SELECT employee_name AS "Employee Full Name" FROM Employees;`

``` SQL
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
```