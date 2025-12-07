SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS School;
USE School;

CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_name VARCHAR(100),
    Course_ID INT
);

INSERT INTO Students (Student_ID, Student_name, Course_ID) VALUES
(1, 'Alice Johnson', 101),
(2, 'Bob Smith', 102),
(3, 'Charlie Brown', 101),
(4, 'Diana Prince', 103),
(5, 'Ethan Hunt', 102);


CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_name VARCHAR(100),
    Course_fees INT
);

INSERT INTO Courses (Course_ID, Course_name, Course_fees) VALUES
(101, 'Mathematics', 5000),
(102, 'Science', 6000),
(103, 'History', 4000);

-- Write a query to find where course fees are greater than 4500
SELECT * FROM Courses WHERE Course_fees > 4500;

-- Write a query to display Studet_ID and Student_name, who have enrolled for course_id is 101
SELECT Student_ID, Student_name FROM Students WHERE Course_ID = 101;

-- Write a query to display Studet_ID and Student_name, who have enrolled for course_id is not 101
SELECT Student_ID, Student_name FROM Students WHERE Course_ID != 101; 
