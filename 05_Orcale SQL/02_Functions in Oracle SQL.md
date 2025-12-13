# Functions in Oracle SQL

- **Types of Functions in Oracle**
    - Single Row Functions
    - Multiple Row Functions (Aggregate Functions)

## Single Row Functions
Single row functions operate on individual rows and return one result per row. Oracle offers additional functions compared to MySQL, categorized as follows:
- **String Functions**: All remains same as MySQL only one will be added `INITCAP()`
- **Number Functions**: All remains same as MySQL only one will be added `TRUNC()`
- **Date and Time Functions**: Here we have different functions **MySQL functions will not work here** `Extract()`, `Months_between()`, `Next_day()`, `Last_day()`, `Add_months()`
- **Flow Control Functions**: `NULLIF()`, `COLAESCE()` same as MySQL and different functions `NVL()`, `NVL2()`
- **Conversion Functions**: `To_char()`, `To_number()`, `To_date`

## Multiple Row Functions
Multiple row functions, also known as aggregate functions, operate on sets of rows to return a single summary value. These include:
- **COUNT**
- **SUM**
- **AVG**
- **MAX**
- **MIN**

## We use this table to demonstrate this functons
| Child Name | Birth Date | Marks | In Time  | Out Time | Admission Date & Time | Guardian Name |
|------------|------------|-------|----------|----------|-----------------------|---------------|
| Arjun      | 2016-02-15 | 85    | 08:00:00 | 14:00:00 | 2020-06-01 09:00:00   | Rajesh Kumar  |
| Aditya    | 2017-03-10 | 90    | 08:30:00 | 14:30:00 | 2020-06-01 09:30:00   | Priya Singh  |
| Kavya     | 2015-04-20 | 88    | 08:45:00 | 14:45:00 | 2020-06-01 09:45:00   | Suresh Kumar |
| Priya     | 2016-05-25 | 92    | 09:00:00 | 15:00:00 | 2020-06-01 10:00:00   | Anjali Singh |
| Ayesha    | 2017-07-15 | 87    | 08:15:00 | 14:15:00 | 2020-06-01 09:15:00   | Amit Patel   |


``` SQL
SELECT * FROM SCHOOL;

--  Retrieve names with the first letter capitalized
SELECT INITCAP(child_name) AS formatted_child_name FROM school;
-- Retrieve names starting with 'A'
SELECT INITCAP(child_name) AS formatted_child_name FROM school WHERE INITCAP(child_name) LIKE 'A%';
-- Display child names with admission month, year, and day
SELECT child_name,  EXTRACT(MONTH FROM admission_date_time) AS admission_month,   EXTRACT(YEAR FROM admission_date_time) AS admission_year,   EXTRACT(DAY FROM admission_date_time) AS admission_day  FROM school;
-- Retrieve names with birth month greater than 6
SELECT child_name,EXTRACT(MONTH FROM birth_date) AS birth_month FROM school WHERE EXTRACT(MONTH FROM birth_date) > 6 FETCH FIRST 3 ROWS ONLY;
-- Find months between two dates
SELECT MONTHS_BETWEEN(TO_DATE('2023-11-14', 'YYYY-MM-DD'),  TO_DATE('2023-02-14', 'YYYY-MM-DD')) AS months_between FROM dual;
-- Display names and months between birth date and admission date
SELECT child_name, MONTHS_BETWEEN(admission_date_time, birth_date) AS months_between FROM school;
-- Display next Friday from a specific date
SELECT NEXT_DAY(TO_DATE('2023-11-23', 'YYYY-MM-DD'), 'FRIDAY') AS next_friday FROM dual;
```