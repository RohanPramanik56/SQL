SHOW DATABASES;
USE Others;
SHOW TABLES;

CREATE TABLE employee2 (
    employee_id   INT PRIMARY KEY,
    department_id INT NOT NULL,
    salary        INT NOT NULL,
    manager_id    INT
);


INSERT INTO employee2 (employee_id, department_id, salary, manager_id) VALUES
(101, 1, 50000, 201),
(102, 1, 48000, 201),
(103, 1, 70000, 201),
(104, 2, 60000, 202),
(105, 2, 68000, 202),
(106, 2, 80000, 202),
(107, 3, 52000, 203),
(108, 3, 45000, 203),
(109, 3, 48000, 203);

-- Write a query using a CTE to display the department_id and the average salary for each department.
WITH department_avg AS 
( SELECT department_id, AVG(salary) AS avg_salary 
FROM employee GROUP BY department_id ) 
SELECT department_id, avg_salary FROM department_avg;

-- Write a query using a CTE to find the highest salary in each department and display the department_id, max_salary, and manager_id.
WITH department_max AS 
( SELECT department_id, MAX(salary) AS max_salary FROM employee2 GROUP BY department_id ) 
SELECT e.department_id, d.max_salary, e.manager_id FROM employee2 e JOIN department_max d ON e.department_id = d.department_id AND e.salary = d.max_salary;

--  Write a query using a recursive CTE to find the hierarchy of employees and their managers.
WITH RECURSIVE employee_hierarchy AS
( SELECT employee_id, manager_id, 1 AS level FROM employee2 WHERE manager_id IS NOT NULL UNION ALL SELECT e.employee_id, e.manager_id, eh.level + 1 FROM employee2 e JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id ) 
SELECT employee_id, manager_id, level FROM employee_hierarchy;


-- Write a query using a CTE to display the department_id, total salary, and the number of employees in each department.
WITH department_stats AS 
( SELECT department_id, SUM(salary) AS total_salary, COUNT(employee_id) AS employee_count FROM employee2 GROUP BY department_id ) 
SELECT department_id, total_salary, employee_count FROM department_stats;