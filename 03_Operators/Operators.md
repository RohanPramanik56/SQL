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

