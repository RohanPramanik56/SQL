# Indexed in SQL
An index in SQL is a database object that provides a fast and efficient way to locate rows in a table. Indexes can significantly improve query performance by allowing the database to quickly locate rows matching specified conditions.

####  Explanation
Consider you have a table named employee and you want to fetch records for a particular employee ID:
``` SQL
SELECT * 
FROM employee
WHERE employee_id = 217;
```

### Creating an Index
To create an index and improve retrieval efficiency
``` SQL
CREATE INDEX employee_index ON employee(employee_id);
```
- **Table:** employee
- **Column:** employee_id
- **Index Name:** employee_index
Creating an index assigns unique identifiers to each row, stored in a data structure optimized for searching. This way, when you execute a query involving the indexed column, the DBMS can quickly locate the required row.

### DEMO TABLE:
### Employee Table

| employee_id | employee_name   | department |
|------------:|-----------------|------------|
| 101         | John Doe        | Sales      |
| 217         | Jane Smith      | HR         |
| 235         | Emily Johnson   | IT         |
| ...         | ...             | ...        |


- **To create an index on employee_id:**
``` SQL
CREATE INDEX employee_index ON employee(employee_id);
```
- **More efficient way**
``` SQL
SELECT * FROM employee WHERE employee_id = 217;
```
**The DBMS uses the index to directly access the row where employee_id is 217, improving query performance.**