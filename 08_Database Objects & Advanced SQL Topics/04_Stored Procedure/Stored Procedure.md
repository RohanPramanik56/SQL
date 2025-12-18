# Stored Procedure
A stored procedure is a group of one or more SQL statements or procedural statements compiled into a single unit. This unit is stored in the database and can be executed by calling its name.

### Benefits of Stored Procedures
- **Reusability:** Define once, use multiple times.
- **Maintainability:** Easier to manage changes.
- **Performance:** Reduces network traffic between the application and the database.
- **Security:** Restrict user access to data by giving access to stored procedures instead of the underlying tables.
  
## Creating a Stored Procedure in Oracle
#### Table Structure:
``` SQL
CREATE TABLE employee 
( 
employee_id INT PRIMARY KEY, 
designation VARCHAR2(50), 
salary INT, 
department_id INT 
);
```
### Creating the Stored Procedure:
``` SQL
CREATE OR REPLACE PROCEDURE employee_insert ( eid IN INT, des IN VARCHAR2, sal IN INT, did IN INT ) 
AS 
BEGIN 
INSERT INTO employee (employee_id, designation, salary, department_id) VALUES (eid, des, sal, did); 
END;
```
- **Procedure Name:** **`employee_insert`**
- **Parameters:** eid (employee ID), des (designation), sal (salary), did (department ID)
  
#### Calling the Stored Procedure:
``` SQL
BEGIN 
employee_insert(301, 'Manager', 150000, 5); 
END;
```

## Creating a Stored Procedure in MySQL

#### Table Structure:
``` SQL
CREATE TABLE employee 
( 
employee_id INT PRIMARY KEY, 
designation VARCHAR(50), 
salary INT, 
department_id INT 
);
```
### Creating the Stored Procedure:
``` SQL
DELIMITER // 

CREATE PROCEDURE employee_insert ( IN eid INT, IN des VARCHAR(50), IN sal INT, IN did INT ) 
BEGIN 
INSERT INTO employee (employee_id, designation, salary, department_id) VALUES (eid, des, sal, did); 
END // 

DELIMITER ;
```
- **DELIMITER:** Changes the statement delimiter to **`//`** to handle the procedure body correctly.
- **Procedure Definition:** Same as Oracle but includes the DELIMITER syntax.
  
#### Calling the Stored Procedure:
``` SQL
CALL employee_insert(301, 'Manager', 150000, 5);
```

## Fetching Data with Stored Procedures
Let’s enhance our understanding by creating a stored procedure that fetches data. Suppose we want to fetch the designation of an employee based on their ID.
### Oracle Stored Procedure:

``` SQL
CREATE OR REPLACE PROCEDURE get_employee_designation ( eid IN INT, des OUT VARCHAR2 ) 
AS 
BEGIN 
SELECT designation INTO des FROM employee WHERE employee_id = eid; END;
```

#### Calling the Procedure in Oracle:
``` SQL
DECLARE emp_designation VARCHAR2(50); 
BEGIN get_employee_designation(301, emp_designation); 
DBMS_OUTPUT.PUT_LINE('Designation: ' || emp_designation); 
END;
```

### MySQL Stored Procedure:
``` SQL
DELIMITER // 

CREATE PROCEDURE get_employee_designation ( IN eid INT, OUT des VARCHAR(50) ) 
BEGIN 
SELECT designation INTO des FROM employee WHERE employee_id = eid; 
END // 

DELIMITER ;
```
#### Calling the Procedure in MySQL:
``` SQL
SET @emp_designation = ''; 
CALL get_employee_designation(301, @emp_designation); 
SELECT @emp_designation AS designation;
```

## ORACLE SQL PROCEDURE DEMO
``` SQL
SET SERVEROUTPUT ON;  -- This is for printing output in console


CREATE TABLE employee2
( 
employee_id INT PRIMARY KEY, 
designation VARCHAR2(50), 
salary INT, 
department_id INT 
);


INSERT INTO employee2 (employee_id, designation, salary, department_id) VALUES
(1, 'Manager', 80000, 10),
(2, 'Developer', 60000, 20),
(3, 'Analyst', 70000, 10),
(4, 'Tester', 50000, 30),
(5, 'Support', 40000, 20);

SELECT * FROM employee2;

-- Procedure to insert employee in Employee2 table

CREATE PROCEDURE Employee_Insert(eid IN INT, des IN VARCHAR2, sal IN INT, depId IN INT) 
AS
    BEGIN
        INSERT INTO employee2 VALUES (eid, des, sal, depId);
    END;
/

-- Execute procedure `Employee_Insert`
EXEC Employee_Insert(6, 'Backend Dev.', 80000, 9);

/*                     CREATE A PROCEDURE WHERE WE PASS EMPLOYEE_ID AS INPUT AND IT WILL RETURN DESIGNATION AS OUTPUT           */
-- Procedure
CREATE PROCEDURE find_desg (eid IN INT, des OUT VARCHAR2)
AS
    BEGIN
        SELECT designation INTO des FROM employee2 WHERE employee_id=eid; -- We have to insert the output INTO output variable
    END;
/


-- calling procedure 
DECLARE
    ed VARCHAR2(30);
    BEGIN
        ed := '';
        find_desg(5, ed);
        DBMS_OUTPUT.PUT_LINE('Designation is: '||ed);
    END;
/

-- delete procedure
DROP PROCEDURE find_desg; -- DELETE PROCEDURE

--          CREATE A STORED PROCEDURE WHICH WILL TAKE EMPLOYEE ID AS INPUT AND RETURN SALARY AS OUTPUT

CREATE PROCEDURE Check_Salary (empId IN INT, sal OUT INT)
AS
    BEGIN
        SELECT salary INTO sal FROM employee2 WHERE employee_id=empId;
    END;
/

-- calling procedure
DECLARE
    salry INT;
    BEGIN
        Check_Salary(2, salry);
        DBMS_OUTPUT.PUT_LINE('SALARY is: '||salry);
    END;
/

/*
- When create procedure in Oracle first give prameter name then input/output, then datatype
- In Oracle, to get output from procedure we have to use `INTO` clause in SELECT statement
- To print output in Oracle we use DBMS_OUTPUT.PUT_LINE function
- To see output in Oracle SQL Developer, we have to enable SERVEROUTPUT using `SET SERVEROUTPUT ON;`
*/
```
```
- When create procedure in Oracle first give prameter name then input/output, then datatype
- In Oracle, to get output from procedure we have to use `INTO` clause in SELECT statement
- To print output in Oracle we use DBMS_OUTPUT.PUT_LINE function
- To see output in Oracle SQL Developer, we have to enable SERVEROUTPUT using `SET SERVEROUTPUT ON;`
```

## MySQL PROCEDURE DEMO

``` SQL
USE Others;

CREATE TABLE employee3
( 
employee_id INT PRIMARY KEY, 
designation VARCHAR(50), 
salary INT, 
department_id INT 
);

INSERT INTO employee3 (employee_id, designation, salary, department_id) VALUES
(1, 'Manager', 80000, 10),
(2, 'Developer', 60000, 20),
(3, 'Analyst', 70000, 10),
(4, 'Tester', 50000, 30),
(5, 'Support', 40000, 20);


-- Procedure to insert employee in Employee2 table

DELIMITER //  -- we hasve to change the delimiter to create procedure in MySQL

CREATE PROCEDURE Employee_Insert(IN eid INT, IN des VARCHAR(20), IN sal INT, IN depId INT) 
BEGIN
    INSERT INTO employee3 VALUES (eid, des, sal, depId);
END//  

DELIMITER ; -- changing delimiter back to semicolon

-- Execute procedure `Employee_Insert`
CALL Employee_Insert(6, 'Backend Dev.', 80000, 9);

SELECT * FROM employee3;


/*                     CREATE A PROCEDURE WHERE WE PASS EMPLOYEE_ID AS INPUT AND IT WILL RETURN DESIGNATION AS OUTPUT           */
-- Procedure
DELIMITER //
CREATE PROCEDURE find_desg (IN eid  INT, OUT des VARCHAR(20))
BEGIN
    SELECT designation INTO des FROM employee3 WHERE employee_id=eid; -- We have to insert the output INTO output variable
END//

DELIMITER ; 

-- calling procedure 
SET @ed = '';  -- we have to define variable to store output value
CALL find_desg(5, @ed);
SELECT @ed AS 'Designation';

-- delete procedure
DROP PROCEDURE find_desg; -- DELETE PROCEDURE


/*
- IN MySQL procedure prameter first we have to define Input/Output, then name of parameter and then datatype of parameter
- In Oracle procedure prameter first we have to define name of parameter, then Input/Output and then datatype of parameter
- Here we use CALL insted of EXEC to execute the procedure in MySQL
*/
```

``` 
- IN MySQL procedure prameter first we have to define Input/Output, then name of parameter and then datatype of parameter
- In Oracle procedure prameter first we have to define name of parameter, then Input/Output and then datatype of parameter
- Here we use CALL insted of EXEC to execute the procedure in MySQL
```