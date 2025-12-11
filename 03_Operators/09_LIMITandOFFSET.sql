SHOW DATABASES;
USE University;
SHOW TABLES;
SELECT * FROM Drives;


-- Write a query to display the first two records from the drives table.
SELECT * FROM Drives LIMIT 2;

-- Displaying Two Records Starting from the Fourth Record
SELECT * FROM Drives LIMIT 2 OFFSET 3;

-- Displaying Specific Records Based on Conditions
SELECT * FROM Drives WHERE designation = 'Backend Developer' LIMIT 2 OFFSET 1;

-- Displaying Developer Details
SELECT * FROM Drives WHERE designation LIKE '%Developer%' LIMIT 2 OFFSET 2;
