SHOW DATABASES;
USE Others;

--  Table: employee
CREATE TABLE employee (
    employee_id    INT PRIMARY KEY,
    department_id  INT,
    salary         INT
);
-- Inserting sample data into employee table
INSERT INTO employee (employee_id, department_id, salary) VALUES (101, 1, 50000);
INSERT INTO employee (employee_id, department_id, salary) VALUES (102, 1, 48000);
INSERT INTO employee (employee_id, department_id, salary) VALUES (103, 1, 70000);
INSERT INTO employee (employee_id, department_id, salary) VALUES (104, 2, 60000);
INSERT INTO employee (employee_id, department_id, salary) VALUES (105, 2, 68000);
INSERT INTO employee (employee_id, department_id, salary) VALUES (106, 2, 80000);
INSERT INTO employee (employee_id, department_id, salary) VALUES (107, 3, 52000);
INSERT INTO employee (employee_id, department_id, salary) VALUES (108, 3, 45000);
INSERT INTO employee (employee_id, department_id, salary) VALUES (109, 3, 48000);
COMMIT;

-- Write a query to display the department_id, and the maximum salary for each department.
SELECT  department_id, MAX(salary) AS max_salary 
FROM employee 
GROUP BY department_id;

-- Write a query to display the department_id and the total salary expenditure for each department.
SELECT department_id, SUM(salary) AS total_salary 
FROM employee 
GROUP BY department_id;

--Write a query to display department_id and average salary for departments where the average salary is greater than 50000.
SELECT department_id, AVG(salary) AS avg_salary 
FROM employee 
GROUP BY department_id 
HAVING AVG(salary) > 50000;

-- Write a query to display the department_id and average salary for each department and order the results by average salary in descending order.
SELECT department_id, AVG(salary) AS avg_salary 
FROM employee 
GROUP BY department_id 
ORDER BY avg_salary DESC;