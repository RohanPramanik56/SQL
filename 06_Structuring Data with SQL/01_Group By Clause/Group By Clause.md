# Group by Clause
SQL's GROUP BY clause, an essential feature that allows us to organize data into groups and perform aggregate functions on each group.
- To demonstrate this we will use this table ***employee***
    - employee_id: The unique identifier for each employee.
    - department_id: The department where the employee works.
    - salary: The salary of the employee.

----------------------------------------
| employee_id | department_id | salary |
|-------------|---------------|--------|
| 101         | 1             | 50000  |
| 102         | 1             | 48000  |
| 103         | 1             | 70000  |
| 104         | 2             | 60000  |
| 105         | 2             | 68000  |
| 106         | 2             | 80000  |
| 107         | 3             | 52000  |
| 108         | 3             | 45000  |
| 109         | 3             | 48000  |
----------------------------------------

## Understanding the GROUP BY Clause
The GROUP BY clause is used in conjunction with aggregate functions like **MAX(), SUM(), AVG(), etc.,** to group the results by one or more columns. This allows us to perform calculations on each group of data, which is especially useful for generating summary reports.
- We can't use **WHERE** with Group by Clause
- When we use group by cluase, we have to use **HAVING**
- **In *MySQL* `having` will be after group by**
- **In *PLSQL* `having` can be before or can be after group by**
``` SQL
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
SELECT  department_id, MAX(salary) AS max_salary FROM employee  GROUP BY department_id;
/*This query groups the data by department_id and then finds the maximum salary within each department. Notice that the employee_id returned may not correspond to the employee with the maximum salary, which is why understanding the output is crucial.*/

-- Write a query to display the department_id and the total salary expenditure for each department.
SELECT department_id, SUM(salary) AS total_salary FROM employee GROUP BY department_id;
/*This query sums up the salaries for each department, giving us the total salary expenditure for each group.*/

--Write a query to display department_id and average salary for departments where the average salary is greater than 50000.
SELECT department_id, AVG(salary) AS avg_salary FROM employee GROUP BY department_id HAVING AVG(salary) > 50000;
/*The HAVING clause filters the groups returned by the GROUP BY clause based on a condition. Here, it filters out departments with an average salary of 50000 or less.*/

-- Write a query to display the department_id and average salary for each department and order the results by average salary in descending order.
SELECT department_id, AVG(salary) AS avg_salary FROM employee GROUP BY department_id  ORDER BY avg_salary DESC;
/*The ORDER BY clause sorts the results based on the average salary in descending order.*/
```