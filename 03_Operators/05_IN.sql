USE University;

SELECT * FROM Drives;

-- Write a query to find drives that have designation as Software Developer, Backend Developer or Frontend Developer.

SELECT * FROM Drives
WHERE Designation IN ('Software Developer', 'Backend Developer', 'Frontend Developer');

SELECT * FROM Drives
WHERE Designation IN ('Software Developer', 'Backend Developer', 'MAthemetician');-- MAthemetician is not present in the table so it will return only Software Developer and Backend Developer rows.