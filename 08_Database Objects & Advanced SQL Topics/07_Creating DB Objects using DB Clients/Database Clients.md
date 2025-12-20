# Database Clients
Database clients like Oracle SQL Developer and MySQL Workbench provide graphical interfaces for interacting with databases. While it's essential to understand and be able to write SQL statements, using these clients can significantly simplify the process.
## Creating Database Objects with Clicks
### 1. Creating a Table
####  1: Open Object Browser
Navigate to the Object Browser in your database client. This is where you'll manage all your database objects.
#### 2: Create a New Table
- Right-click on the Tables section and select New Table.
- Enter the table name, for example, organization.
- Define the columns by clicking on the + icon. For instance:
    - org_id with data type NUMBER, set as NOT NULL.
    - org_name with data type VARCHAR2(20), set as NOT NULL.
#### 3: Confirm Creation
Click **OK**, and your table will be created. You can verify its creation by expanding the Tables section and locating your new table.

### 2. Creating a View
####  1: Open View Creation
- Right-click on the Views section and select New View.
- Enter the view name, for example, org_view.
#### 2: Define the View
- Write the SELECT statement for the view. For example:
``` SQL
SELECT * FROM organization;
```
- Check the DDL tab to see the generated SQL statement:
``` SQL
CREATE VIEW org_view AS SELECT * FROM organization;
```
#### Confirm Creation
Click **OK** to create the view. Verify it by expanding the Views section.

### 3. Creating an Index
#### 1: Open Index Creation
- Right-click on the Indexes section and select New Index.
- Enter the index name, for example, org_index.

#### 2: Define the Index
- Select the table and columns to index. For example:
    - Table: organization
    - Column: org_id
#### 3: Confirm Creation
Click **OK** to create the index. You can verify it by expanding the Indexes section.

### 4. Creating a Stored Procedure
#### 1: Open Procedure Creation
- Right-click on the Procedures section and select New Procedure.
- Enter the procedure name, for example, org_procedure.
#### 2: Define the Procedure
- Define the parameters and write the procedure body. For example:
``` SQL
CREATE OR REPLACE PROCEDURE org_procedure ( p_org_id IN NUMBER, p_org_name IN VARCHAR2 ) IS BEGIN INSERT INTO organization (org_id, org_name) VALUES (p_org_id, p_org_name); 
END;
/
```
#### 3: Confirm Creation
Click **OK** to create the procedure. Verify it by expanding the Procedures section.

### Creating a Trigger
#### 1: Open Trigger Creation
- Right-click on the Triggers section and select New Trigger.
- Enter the trigger name, for example, org_trigger.
#### 2: Define the Trigger
- Define the event and write the trigger body. For example:
``` SQL
CREATE OR REPLACE TRIGGER org_trigger
AFTER INSERT 
ON organization 
FOR EACH ROW 
BEGIN 
-- Trigger logic here 
END;
```
#### 3: Confirm Creation
Click **OK** to create the trigger. Verify it by expanding the Triggers section.

