# Flow Control Function

- **NVL Functions:** 
The NVL function is used to replace NULL values with a specified value. This is useful when you want to ensure that a column always returns a value, even if the original data is NULL.

``` SQL
-- Display worker names and birth dates, replacing NULL birth dates with 01/01/2023
SELECT worker_name, NVL(birth_date, TO_DATE('01/01/2023', 'MM/DD/YYYY')) AS birth_date  
FROM workers_details;

/* Explanation:
This query selects the worker_name and the birth_date. If the birth_date is NULL, it replaces the NULL value with 01/01/2023 using the NVL function. The TO_DATE function converts the string 01/01/2023 into a date format.
*/
```


- **NVL2 Function**
The NVL2 function checks whether a value is NULL or not, and returns one value if NULL, and another value if not NULL. This function is useful when you need to perform different actions based on the presence or absence of NULL.

``` SQL
-- Display worker names and dependents, replacing NULL dependents with 'Absent', otherwise 'Present'
SELECT worker_name, NVL2(dependents, 'Present', 'Absent') AS dependents_status  
FROM workers_details;

/* Explanation:
This query selects the worker_name and uses the NVL2 function to check the dependents column. If dependents is NULL, it returns 'Absent'; if dependents is not NULL, it returns 'Present'.
*/


-- Display worker names and ages, replacing NULL ages with 'No Age' otherwise display age itself

SELECT worker_name, NVL2(age, age, 'No Age') AS age_status  
FROM workers_details;

/* Explanation:
This query selects the worker_name and the age. If the age is NULL, it replaces the NULL value with 'No Age' using the NVL2 function. If age is not NULL, it returns the age itself.
*/
```

# Conversion Function

- **TO_DATE Function**
The TO_DATE function converts a string to a date. This function is used when you need to transform string data into date format for operations involving dates.

``` SQL
-- Convert the string 20-02-2023 to a date
SELECT TO_DATE('20-02-2023', 'DD-MM-YYYY') AS converted_date 
FROM dual;
/*Explanation:
This query converts the string 20-02-2023 to a date using the format DD-MM-YYYY.
*/

-- Convert the string 20 Feb 2023 to a date
SELECT TO_DATE('20 Feb 2023', 'DD MON YYYY') AS converted_date 
FROM dual;
/* Explanation:
This query converts the string 20 Feb 2023 to a date using the format DD MON YYYY.
*/
```

- **TO_CHAR Function**
The TO_CHAR function converts a date or number to a string with a specified format. This function is useful for displaying dates and numbers in a particular format.

``` SQL
-- Display birth dates in the format DD-MON-YYYY
SELECT worker_name, TO_CHAR(birth_date, 'DD-MON-YYYY') AS formatted_birth_date  
FROM workers_details;
/* Explanation:
This query selects the worker_name and the birth_date, converting the birth_date to a string in the format DD-MON-YYYY.
*/

-- Display the birth month and year as Month YYYY
SELECT worker_name, TO_CHAR(birth_date, 'Month YYYY') AS birth_month_year  
FROM workers_details;
/* Explanation:
This query selects the worker_name and the birth_date, converting the birth_date to a string in the format Month YYYY.
*/

-- Display the day of the week for each birth date
SELECT worker_name, TO_CHAR(birth_date, 'Day') AS birth_day  
FROM workers_details;
/* Explanation:
This query selects the worker_name and the birth_date, converting the birth_date to a string representing the day of the week.
*/

-- Display the birth date in the format YYYYMMDD
SELECT worker_name, TO_CHAR(birth_date, 'YYYYMMDD') AS birth_date_formatted 
FROM workers_details;
/* Explanation:
This query selects the worker_name and the birth_date, converting the birth_date to a string in the format YYYYMMDD.
*/

-- Display the century of the birth date as CC
SELECT worker_name, TO_CHAR(birth_date, 'CC') AS birth_century 
FROM workers_details;
/* Explanation:
This query selects the worker_name and the birth_date, converting the birth_date to a string representing the century.
*/
```

-- **TO_NUMBER Function**
The TO_NUMBER function converts a string to a number. This function is used when you need to perform numerical operations on string data.

``` SQL
-- Convert age to number and add 3 years to workers' ages where worker_id is greater than 3
SELECT worker_name, TO_NUMBER(age) + 3 AS age_3_years_later  
FROM workers_details WHERE worker_id > 3;
/* Explanation:
This query selects the worker_name and converts the age (which is a string) to a number using the TO_NUMBER function. It then adds 3 to the age and renames this column as age_3_years_later. The query filters the results to include only workers with worker_id greater than 3.
*/

-- Display worker names and hire dates, adding 10 days to the hire date and displaying the date only
SELECT worker_name, TO_CHAR(hire_date_time + INTERVAL '10' DAY, 'DD') AS hire_date_plus_10  
FROM workers_details;
/* Explanation:
This query selects the worker_name and adds 10 days to the hire_date_time, then converts the result to a string and displays only the date part using the TO_CHAR function.
*/
```







## This table will be use to demonstrate all query
------------------------------------------------------------------------------------------------------------------------------------
| worker_id | worker_name  | birth_date | age | hire_date_time        | sign_in               | sign_off              | dependents |
|-----------|--------------|------------|-----|-----------------------|-----------------------|-----------------------|------------|
| 1         | John Doe     | 1990-01-01 | 30  | 2015-05-01 09:00:00   | 2015-05-01 09:00      | 2015-05-01 18:00      | 3          |
| 2         | Jane Smith   | 1985-07-15 | 35  | 2010-07-15 09:00:00   | 2010-07-15 09:00      | 2010-07-15 18:00      | 2          |
| 3         | Alice Jones  | 1992-10-23 | 28  | 2018-10-23 09:00:00   | 2018-10-23 09:00      | 2018-10-23 18:00      | 1          |
| 4         | Bob Brown    | 1980-04-12 | 40  | 2005-04-12 09:00:00   | 2005-04-12 09:00      | 2005-04-12 18:00      | NULL       |
| 5         | Charlie Lee  | 1995-12-20 | 25  | 2020-12-20 09:00:00   | 2020-12-20 09:00      | 2020-12-20 18:00      | NULL       |
| 6         | David Green  | 1988-06-30 | 32  | 2012-06-30 09:00:00   | 2012-06-30 09:00      | 2012-06-30 18:00      | 2          |
------------------------------------------------------------------------------------------------------------------------------------