USE University;

SELECT * FROM Drives;

-- Write a query to find drive where package is between 650000 and 750000
SELECT * FROM Drives WHERE package BETWEEN 650000 AND 750000; 

SELECT * FROM Drives WHERE package BETWEEN 750000 AND 650000; -- Return null because we have to give smaller value first then larger value