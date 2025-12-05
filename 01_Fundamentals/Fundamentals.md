# Fundamentals

## Storing Data
1. We have to create a DB. **CREATE DATABASE IF NOT EXISTS `DB_NAME`**
2. Select Database **USE DB_NAME**
3. Create a Table **CREATE TABLE IF NOT EXISTS TABLE_NAME (COLUMN_NAME DATA_TYPE)**
4. To delete table **DROP TABLE `TABLE_NAME`**
5. To delete db **DROP DATABASE `DATABASE_NAME`**
S
``` SQL
CREATE DATABASE IF NOT EXISTS University;

USE University;

CREATE TABLE IF NOT EXISTS Student
(
    Student_ID INT,
    Student_name VARCHAR(30),
    Student_DOB DATE,
    Student_age INT
); 
```

## Insert data into table
- Use **INSERT** keyword\
**INSERT VALUES `column_names` INTO `table_name` (column_values)**

``` sql
INSERT INTO Student (Student_ID, Student_name, Student_DOB, Student_age) VALUES (1, 'AMIT', '2015-01-01', 10);
```

## Retriving Data
- Retriving data is 2 types
    - **PROJECTION:** Operation of selecting specific columns from table without restricting the number of rows.
    - **SELECTION:** Filtering rows from table based on specific condition.
- To retrive the data we have ro use\
**`SELECT`** keyword **SELECT `WHAT_TO_FETCH` FROM `TABLE_NAME`**

``` sql
USE University;
SELECT * FROM Student;  -- Retriving all data
SELECT Student_Name FROM Student; -- retriving student_name, here we are restricting the number of rows
```