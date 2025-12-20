USE Others;

SHOW TABLES;

SELECT * FROM employee3;

-- We can create index for a single column
CREATE INDEX emp_fetch ON employee3(employee_id);    -- Here emp_fetch is the name of index created on employee_id column of employee3 table

SELECT * FROM employee3 WHERE employee_id = 4;  -- This query will be faster because index is created on employee_id column
