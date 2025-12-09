USE University;

SELECT * FROM Drives;

-- We need to find all the rows where the designation contains the word "data".
SELECT * FROM Drives WHERE Designation LIKE '%data%';

-- Find all the rows where the designation ends with the word "Developer".
SELECT *  FROM Drives  WHERE designation LIKE '%Developer';

-- Find all the rows where the package starts with '5'.
SELECT *  FROM Drives WHERE package LIKE '5%';

-- Find all the rows where the drive_date is in the year 2023.
SELECT *  FROM Drives WHERE drive_date LIKE '%2023%';

-- Find all the rows where the fourth character in the designation is 't'.
SELECT *  FROM Drives  WHERE designation LIKE '___t%'; -- We use the LIKE operator with underscores (_) for exact character positions and % for any number of characters.

-- Find all the rows where the designation starts with 'S' and ends with 'Developer'.
SELECT * FROM Drives  WHERE designation LIKE 'S%Developer';

-- Find all the rows where the designation does not contain the word "Developer".
SELECT * FROM Drives WHERE designation NOT LIKE '%Developer%';

-- Find all the rows where the drive_date is not in the year 2023.
SELECT * FROM Drives WHERE drive_date NOT LIKE '%2023%';