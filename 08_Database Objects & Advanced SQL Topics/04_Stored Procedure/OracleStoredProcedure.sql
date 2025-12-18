SET SERVEROUTPUT ON;  -- This is for printing output in console

-- RUN THIS WHOLE CODE IN ORACLE SQL 

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