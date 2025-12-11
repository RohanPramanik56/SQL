SHOW DATABASES
USE Company;
CREATE TABLE NewEmployees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    designation VARCHAR(50),
    phone VARCHAR(15),
    mobile VARCHAR(15),
    office VARCHAR(15),
    salary INT
);

INSERT INTO NewEmployees (employee_id, name, designation, phone, mobile, office, salary) VALUES
(1, 'John Doe', 'Software Engineer', '1234567890', NULL, '9876543210', 500000),
(2, 'Jane Smith', 'HR Manager', NULL, '1234567890', NULL, 60000),
(3, 'Mark Brown', 'Intern', NULL, NULL, NULL, 0);

-- IF Function: The IF function in SQL works similarly to the if conditional control construct in programming languages.
SELECT IF(5 + 5 = 10, 'True', 'False') AS result;
-- Write a query to display the names and designations of all employees, and if the salary is greater than 0, display "Paid" as status; otherwise, display "Unpaid".
SELECT name, designation, IF(salary > 0, 'Paid', 'Unpaid') AS status 
FROM NewEmployees;



-- IFNULL Function: The IFNULL function returns the first argument if it is not null
SELECT IFNULL(NULL, 'No Value') AS result;
-- Write a query to display the names and office phone numbers of employees. If the office number is null, display "Not Available".
SELECT name, designation, IFNULL(office, 'Not Available') AS office_status 
FROM NewEmployees;


-- NULLIF Function: The NULLIF function returns null if the first argument equals the second argument; otherwise, it returns the first argument.
SELECT NULLIF(0, 0) AS result;
-- Write a query to display the name and salary of employees. If the salary is 0, display null.
SELECT name, NULLIF(salary, 0) AS salary 
FROM NewEmployees;

-- COALESCE Function: The COALESCE function returns the first non-null value in a list of expressions.
SELECT COALESCE(NULL, NULL, 'First Non-Null Value', NULL) AS result;
-- Write a query to display the employee ID, name, designation, and any one of the phone numbers (in the priority order: mobile, office, phone).
SELECT employee_id, name, designation, COALESCE(mobile, office, phone) AS phone_number 
FROM employee;