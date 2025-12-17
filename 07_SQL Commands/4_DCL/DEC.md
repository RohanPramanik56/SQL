# DCL (Data Control Language)
Data Control Language (DCL) is used to control access to data in a database. 
- **The two primary commands in DCL are:**
    - **GRANT:** Allows users to access and manipulate database objects.
    - **REVOKE:** Removes access rights or privileges from users.
## MySQL Database and User Management
In MySQL, you can have multiple users, each with their own databases and tables. By default, one user cannot access the databases or tables of another user unless explicitly granted access by a Database Administrator (DBA).

### Creating a User and Granting Privileges in MySQL

#### 1. Create a New User:
``` SQL
CREATE USER 'adam_new' IDENTIFIED BY 'password';
```
#### 2. Grant All Privileges to the User:
``` SQL
GRANT ALL PRIVILEGES ON *.* TO 'adam_new';
```
#### 3. Revoke Privileges:
``` SQL
REVOKE ALL PRIVILEGES ON *.* FROM 'adam_new';
```
By granting all privileges, the new user can create, update, delete, and access all databases and tables. Revoking these privileges restricts the user from performing any operations.

### Example in MySQL
#### 1. Create a New Database and Table:
``` SQL
CREATE DATABASE companyDB; 
USE companyDB;  
CREATE TABLE Users ( ID INT PRIMARY KEY AUTO_INCREMENT, Name VARCHAR(255) NOT NULL );
```
#### 2. Insert Data into the Table:
``` SQL
INSERT INTO Users (Name) VALUES ('John Doe');
```
#### 3. Grant Privileges to the New User:
``` SQL
GRANT ALL PRIVILEGES ON companyDB.* TO 'adam_new';
```
#### 4. Revoke Privileges from the User:
``` SQL
REVOKE ALL PRIVILEGES ON companyDB.* FROM 'adam_new';
```

## Oracle Database and User Management
In Oracle, the structure is slightly different. Users directly create tables under their schema. Similar to MySQL, one user cannot access another user's tables without explicit permission.
### Creating a User and Granting Privileges in Oracle

#### 1. Create a New User:
``` SQL
CREATE USER alex_new IDENTIFIED BY password;
```
#### 2. Grant All Privileges to the User:
``` SQL
GRANT ALL PRIVILEGES TO alex_new;
```
#### 3. Revoke Privileges:
``` SQL
REVOKE ALL PRIVILEGES FROM alex_new;
```

### Example in Oracle
#### 1. Connect as the System Administrator:
``` SQL
CONNECT sys AS sysdba;
```
#### 2. Create a New User and Grant Privileges:
``` SQL
CREATE USER alex_new IDENTIFIED BY password;  
GRANT ALL PRIVILEGES TO alex_new;
```
#### 3. Revoke Privileges from the User:
``` SQL
REVOKE ALL PRIVILEGES FROM alex_new;
```