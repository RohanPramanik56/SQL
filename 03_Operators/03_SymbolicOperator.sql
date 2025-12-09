USE University;

CREATE TABLE Drives(
    drive_id INT PRIMARY KEY,
    designation VARCHAR(50),
    package INT,
    drive_date DATE
)

INSERT INTO Drives (drive_id, designation, package, drive_date)
VALUES
(212, 'Software Developer', 500000, '2023-01-15'),
(216, 'Backend Developer', 450000, '2023-02-20'),
(220, 'Frontend Developer', 300000, '2023-03-10'),
(224, 'Data Scientist', 600000, '2023-04-05'),
(228, 'Backend Developer', 550000, '2023-05-12'),
(232, 'Full Stack Developer', 700000, '2023-06-18'),
(236, 'Frontend Developer', 650000, '2023-07-25'),
(240, 'Software Developer', 800000, '2023-08-30');

-- OR
SELECT * FROM Drives WHERE designation='Software Developer' OR designation='Frontend Developer';

-- AND
SELECT * FROM Drives WHERE package > 500000 AND drive_date > '2023-01-01';

commit;