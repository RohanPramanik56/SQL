# DDL (Data Definition Language)

**Create, Alter, Drop, and Truncate.** 

## Create Command
### First Query:
**Design an SQL query to create a table named library for managing information about books. The table should have the following columns: book ID, title, author, publication year, and genre.**
``` SQL
CREATE TABLE library 
(     
book_id INT PRIMARY KEY AUTO_INCREMENT,    
title VARCHAR(255) NOT NULL,     
author VARCHAR(255) NOT NULL,     
publication_year INT,     
genre VARCHAR(50) 
);
```
#### Explanation:
- We use the CREATE TABLE command to define a new table named library.
- The book_id column is set as the primary key with auto-increment.
- title and author are defined with VARCHAR(255) and NOT NULL constraints.
- publication_year is defined as an integer.
- genre is defined with VARCHAR(50).

### Insertion Example:
``` SQL
INSERT INTO library (title, author, publication_year, genre)  VALUES ('Book Title 1', 'Author 1', 2020, 'Fiction');
```

## Alter Command
### Second Query:
**Write a query to add a new column price of type DECIMAL to the library table.**
``` SQL
ALTER TABLE library  
ADD COLUMN price DECIMAL(10, 2);
```
#### Explanation:
- The ALTER TABLE command is used to modify the existing table library.
- The ADD COLUMN clause adds a new column price with the DECIMAL(10, 2) data type.
  
### Third Query:
**Write a query to rename the column genre to book_genre in the library table.**
``` SQL
ALTER TABLE library  
RENAME COLUMN genre TO book_genre;
```
#### Explanation:
- The RENAME COLUMN clause in the ALTER TABLE command renames genre to book_genre.

## Drop Command
### Fourth Query:
**Write a query to drop the column price from the library table.**
``` SQL
ALTER TABLE library  
DROP COLUMN price;
```
#### Explanation:
- The DROP COLUMN clause in the ALTER TABLE command removes the price column from the library table.

## Truncate Command
### Fifth Query:
**Write a query to remove all data from the library table without deleting the table structure.**
``` SQL
TRUNCATE TABLE library;.
```
#### Explanation:
- The TRUNCATE TABLE command removes all rows from the library table while keeping the table structure intact.

## SUMMARY:
- **Create:** Enables the creation of tables and other database objects.
- **Alter:** Allows modifications to existing tables, such as adding or dropping columns, renaming columns or tables, and modifying data types.
- **Drop:** Removes entire tables or specific columns from tables.
- **Truncate:** Deletes all rows from a table without removing the table structure.