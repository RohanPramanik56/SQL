# Common table expressions
A CTE is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. It's particularly useful when dealing with complex queries, as it allows you to break them into simpler parts

#### We use this table to demonstrate CTE
- **employee_id:** The unique identifier for each employee.
- **department_id:** The department where the employee works.
- **salary:** The salary of the employee.
- **manager_id:** The employee ID of the employee's manager.


| employee_id | department_id | salary | manager_id |
|-------------|---------------|--------|------------|
| 101 | 1 | 50000 | 201 |
| 102 | 1 | 48000 | 201 |
| 103 | 1 | 70000 | 201 |
| 104 | 2 | 60000 | 202 |
| 105 | 2 | 68000 | 202 |
| 106 | 2 | 80000 | 202 |
| 107 | 3 | 52000 | 203 |
| 108 | 3 | 45000 | 203 |
| 109 | 3 | 48000 | 203 |

### Understanding the CTE
A CTE begins with the **`WITH`** keyword, followed by a temporary named result set that can be referenced in the main query. You can think of it as a subquery or temporary view that exists only for the duration of that query.

#### Example 1: Simple CTE to Calculate Average Salary by Department
Write a query using a CTE to display the department_id and the average salary for each department.
``` SQL
WITH department_avg AS 
( SELECT department_id, AVG(salary) AS avg_salary 
FROM employee GROUP BY department_id ) 
SELECT department_id, avg_salary FROM department_avg;
```
##### Explanation: 
The CTE department_avg calculates the average salary for each department, and the main query simply retrieves this data. CTEs make it easier to break down complex calculations into smaller, readable parts.


#### Example 2: Using CTE with Multiple Columns
Write a query using a CTE to find the highest salary in each department and display the department_id, max_salary, and manager_id.
```SQL
WITH department_max AS 
( SELECT department_id, MAX(salary) AS max_salary FROM employee GROUP BY department_id ) 
SELECT e.department_id, d.max_salary, e.manager_id FROM employee e JOIN department_max d ON e.department_id = d.department_id AND e.salary = d.max_salary;
```
##### Explanation: 
The CTE department_max finds the maximum salary for each department, and in the main query, we join this with the employee table to retrieve the manager_id associated with the employee earning the maximum salary.


#### Example 3: Recursive CTE for Employee Hierarchy
Write a query using a recursive CTE to find the hierarchy of employees and their managers.
``` SQL
WITH RECURSIVE employee_hierarchy AS
( SELECT employee_id, manager_id, 1 AS level FROM employee WHERE manager_id IS NOT NULL UNION ALL SELECT e.employee_id, e.manager_id, eh.level + 1 FROM employee e JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id ) 
SELECT employee_id, manager_id, level FROM employee_hierarchy;
```
##### Explanation: 
The recursive CTE employee_hierarchy starts by selecting employees who have a manager (level = 1), and then it repeatedly joins the employee table to build the hierarchy, incrementing the level each time.

#### Example 4: Combining CTEs with Aggregate Functions
Write a query using a CTE to display the department_id, total salary, and the number of employees in each department.
``` SQL
WITH department_stats AS 
( SELECT department_id, SUM(salary) AS total_salary, COUNT(employee_id) AS employee_count FROM employee GROUP BY department_id ) 
SELECT department_id, total_salary, employee_count FROM department_stats;
```
##### Explanation: 
The CTE department_stats calculates the total salary and the number of employees for each department, and the main query retrieves this summary information.

``` SQL
-- Step 1: Calculate total salary expense for each department
WITH DepartmentSalaries AS (
    SELECT
        department,
        SUM(salary) AS total_salary
    FROM
        company_employees
    GROUP BY
        department
),

-- Step 2: List employees with their managers
EmployeeManagers AS (
    SELECT
        e.id AS employee_id,
        e.name AS employee_name,
        COALESCE(m.name, 'None') AS manager_name,
        e.department
    FROM
        company_employees e
    LEFT JOIN
        company_employees m ON e.manager_id = m.id
),

-- Step 3: Find the minimum salary in each department
DepartmentMinSalaries AS (
    SELECT
        department,
        MIN(salary) AS min_salary
    FROM
        company_employees
    GROUP BY
        department
)

-- Final selection from all the CTEs
SELECT
    em.employee_id AS "Employee ID",
    em.employee_name AS "Employee Name",
    em.manager_name AS "Manager Name",
    ds.total_salary AS "Total Salary Expense",
    dms.min_salary AS "Lowest Salary"
FROM
    EmployeeManagers em
JOIN
    DepartmentSalaries ds ON em.department = ds.department
JOIN
    DepartmentMinSalaries dms ON em.department = dms.department
ORDER BY
    em.department, em.employee_id;
```