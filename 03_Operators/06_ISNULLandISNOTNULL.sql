USE University;

SELECT * FROM Drives;

INSERT INTO Drives (drive_id, designation, package, drive_date) VALUES
(230, 'Software Developer', 700000, null),
(245, 'Data Analyst', 650000, null),
(300, 'Frontend Developer', 600000, null);

-- When NULL values are present in a column, we can use IS NULL we can't write (drive_date = NULL;)
SELECT * FROM Drives
WHERE drive_date IS NULL;


-- When NULL values are present in a column, we can use IS NULL we can't write (drive_date != NULL;)
SELECT * FROM Drives
WHERE drive_date IS NOT NULL;
