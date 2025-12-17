# Database Object
Database Objects in RDBMS are data structures used to store or reference data. Simply put, any structure that holds data is a database object. 
## Types of Database Objects
- **In MySQL, the primary database objects are:**
    - Tables
    - Views
    - Indexes
    - Stored Procedures
    - Triggers

- **In Oracle, in addition to the objects listed above, you also have:**
    - Sequences
    - Synonyms
  
## Tables
Tables are collections of rows and columns used to store and organize data in the database. They are fundamental structures in any DBMS.
- **Definition:** Tables are structures used to store and organize data in rows and columns.
- **Creation Syntax:**
``` SQL
CREATE TABLE table_name 
(     
column1 datatype constraints,     
column2 datatype constraints,     
... 
);
```
