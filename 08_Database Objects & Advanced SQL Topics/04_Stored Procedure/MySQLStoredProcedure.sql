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