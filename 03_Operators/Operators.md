# Operators
- Operators come in two main flavors :
    - ***Symbolic Operators:*** These are your go-to for arithmetic and comparisons, using symbols we all know and love.
        - **Arithmetic Operators :**

            - **+** for addition
            - **-** for subtraction
            - * for multiplication
            - **/** for division
            - **%** for modulo (remainder of a division)
            - **Arithmetic Operator Precedence *(/ > * > + > -)***

        - **Comparison Operators/Relational Operator :**
            - **=** for equals
            - **>** for greater than
            - **<** for lesser than
            - **>**= for greater than or equal to
            - **<**= for less than or equal to
            - **!**= or <> for not equal to

    - ***Keyword Operators :*** These are more about logic and filtering.
        - **AND**, **OR**, **NOT** for combining conditions
        - **BETWEEN**, **LIKE**, **IN** for filtering data

## Arithmetic Operator
``` SQL
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
```

### Relational Operator
``` SQL
SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS School;
USE School;

CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_name VARCHAR(100),
    Course_ID INT
);

INSERT INTO Students (Student_ID, Student_name, Course_ID) VALUES
(1, 'Alice Johnson', 101),
(2, 'Bob Smith', 102),
(3, 'Charlie Brown', 101),
(4, 'Diana Prince', 103),
(5, 'Ethan Hunt', 102);


CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_name VARCHAR(100),
    Course_fees INT
);

INSERT INTO Courses (Course_ID, Course_name, Course_fees) VALUES
(101, 'Mathematics', 5000),
(102, 'Science', 6000),
(103, 'History', 4000);

-- Write a query to find where course fees are greater than 4500
SELECT * FROM Courses WHERE Course_fees > 4500;

-- Write a query to display Studet_ID and Student_name, who have enrolled for course_id is 101
SELECT Student_ID, Student_name FROM Students WHERE Course_ID = 101;

-- Write a query to display Studet_ID and Student_name, who have enrolled for course_id is not 101
SELECT Student_ID, Student_name FROM Students WHERE Course_ID != 101; 
```

## Logical Operator / Symbolic Operator
- **AND:** Both condition have to be correct.
- **OR:** Any one condition have to be correct.
``` SQL
USE University;

CREATE TABLE Drives(
    drive_id INT PRIMARY KEY,
    designation VARCHAR(50),
    package INT,
    drive_date DATE
)

INSERT INTO Drives (drive_id, designation, package, drive_date)
VALUES
(212, 'Software Developer', 500000, '2023-01-15'),
(216, 'Backend Developer', 450000, '2023-02-20'),
(220, 'Frontend Developer', 300000, '2023-03-10'),
(224, 'Data Scientist', 600000, '2023-04-05'),
(228, 'Backend Developer', 550000, '2023-05-12'),
(232, 'Full Stack Developer', 700000, '2023-06-18'),
(236, 'Frontend Developer', 650000, '2023-07-25'),
(240, 'Software Developer', 800000, '2023-08-30');

-- OR
SELECT * FROM Drives WHERE designation='Software Developer' OR designation='Frontend Developer';

-- AND
SELECT * FROM Drives WHERE package > 500000 AND drive_date > '2023-01-01';
```

## BETWEEN Operator
- When we use **BETWEEN** operator we must have to use **AND**.
- In Bewtween Operator always we have to give the smallest number first then largest number.
``` SQL
USE University;

SELECT * FROM Drives;

-- Write a query to find drive where package is between 650000 and 750000
SELECT * FROM Drives WHERE package BETWEEN 650000 AND 750000; 

SELECT * FROM Drives WHERE package BETWEEN 750000 AND 650000; -- Return null because we have to give smaller value first then larger value
```

## IN Operator
- When we use **IN** operator we can pass the values, which are not also exist in the table.
``` SQL
USE University;

SELECT * FROM Drives;

-- Write a query to find drives that have designation as Software Developer, Backend Developer or Frontend Developer.

SELECT * FROM Drives
WHERE Designation IN ('Software Developer', 'Backend Developer', 'Frontend Developer');

SELECT * FROM Drives
WHERE Designation IN ('Software Developer', 'Backend Developer', 'MAthemetician');-- MAthemetician is not present in the table so it will return only Software Developer and Backend Developer rows.
```
## NULL and NOTNULL Operator
- **IS NULL Operator:** The IS NULL operator is used to find rows where a specific column has NULL values. NULL represents missing or undefined data. This is different from an empty string or zero, which are actual values.
- **When to use IS NULL:**
    - To identify records that have missing information.
    - To filter out incomplete data entries.
    - To perform operations or corrections on rows where specific data is absent.
- **IS NOT NULL Operator:** The IS NOT NULL operator is used to find rows where a specific column does not have NULL values. This helps in retrieving records that have valid and present data in a given column.
- **When to use IS NOT NULL:**
    - To find records with complete information.
    - To ensure certain columns have valid entries before processing or analyzing the data.
    - To filter out rows where important data is missing.

- - `SELECT * FROM table_name WHERE column_name NOT NULL;`
- `SELECT * FROM table_name WHERE column_name IS NOT NULL;`
``` SQL
USE University;

SELECT * FROM Drives;

INSERT INTO Drives (drive_id, designation, package, drive_date) VALUES
(230, 'Software Developer', 700000, null),
(245, 'Data Analyst', 650000, null),
(300, 'Frontend Developer', 600000, null);

-- When NULL values are present in a column, we can use IS NULL we can't write (drive_date = NULL;)
SELECT * FROM Drives
WHERE drive_date IS NULL;


-- When NULL values are present in a column, we can use IS NULL we can't write (drive_date != NULL;)
SELECT * FROM Drives
WHERE drive_date IS NOT NULL;
```
## LIKE and NOT LIKE Operator
- **LIKE Operator:** Used for pattern matching with strings.
    - **%** matches any sequence of characters.
    - **_** matches exactly one character.
`SELECT * FROM table_name WHERE column_name LIKE 'pattern';`
- **NOT LIKE Operator:** Used to exclude rows matching a specific pattern.
`SELECT * FROM table_name WHERE column_name NOT LIKE 'pattern';`

``` SQL
USE University;

SELECT * FROM Drives;

-- We need to find all the rows where the designation contains the word "data".
SELECT * FROM Drives WHERE Designation LIKE '%data%';

-- Find all the rows where the designation ends with the word "Developer".
SELECT *  FROM Drives  WHERE designation LIKE '%Developer';

-- Find all the rows where the package starts with '5'.
SELECT *  FROM Drives WHERE package LIKE '5%';

-- Find all the rows where the drive_date is in the year 2023.
SELECT *  FROM Drives WHERE drive_date LIKE '%2023%';

-- Find all the rows where the fourth character in the designation is 't'.
SELECT *  FROM Drives  WHERE designation LIKE '___t%'; -- We use the LIKE operator with underscores (_) for exact character positions and % for any number of characters.

-- Find all the rows where the designation starts with 'S' and ends with 'Developer'.
SELECT * FROM Drives  WHERE designation LIKE 'S%Developer';

-- Find all the rows where the designation does not contain the word "Developer".
SELECT * FROM Drives WHERE designation NOT LIKE '%Developer%';

-- Find all the rows where the drive_date is not in the year 2023.
SELECT * FROM Drives WHERE drive_date NOT LIKE '%2023%';
```

## DISTINCT and UNIQUE
- The **DISTINCT** keyword is used to return only unique values from a specified column.
- The **UNIQUE** keyword can also be used to achieve the same result. However, it's important to note that UNIQUE works only in Oracle SQL for retrieval purposes, whereas DISTINCT works in both MySQL and Oracle.

``` SQL
SHOW DATABASES;
USE University;
SHOW TABLES;
SELECT * FROM Drives;

SELECT DISTINCT designation FROM Drives; -- This will work both in MySQL and ORACLE SQL
SELECT UNIQUE designation FROM Drives; SELECT UNIQUE designation FROM Drives; -- This will only work in ORACLE SQL / In SQL UNIQUE only use for creating column it will not work while fetching data.
```
## LIMIT and OFFSET
- **LIMIT:** The LIMIT keyword restricts the number of rows returned in the result set. In this case, it limits the output to the first two records.
- **OFFSET:** The OFFSET keyword skips the first three records, and then LIMIT restricts the output to the next two records.

``` SQL
SHOW DATABASES;
USE University;
SHOW TABLES;
SELECT * FROM Drives;


-- Write a query to display the first two records from the drives table.
SELECT * FROM Drives LIMIT 2;

-- Displaying Two Records Starting from the Fourth Record
SELECT * FROM Drives LIMIT 2 OFFSET 3;

-- Displaying Specific Records Based on Conditions
SELECT * FROM Drives WHERE designation = 'Backend Developer' LIMIT 2 OFFSET 1;

-- Displaying Developer Details
SELECT * FROM Drives WHERE designation LIKE '%Developer%' LIMIT 2 OFFSET 2;
```