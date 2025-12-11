SHOW DATABASES;
USE University;
SHOW TABLES;
SELECT * FROM Drives;

SELECT DISTINCT designation FROM Drives; -- This will work both in MySQL and ORACLE SQL
SELECT UNIQUE designation FROM Drives; -- This will only work in ORACLE SQL / In SQL UNIQUE only use for creating column it will not work while fetching data.