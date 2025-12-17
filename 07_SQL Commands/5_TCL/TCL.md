# TCL (Transaction Control Language)
A transaction in SQL is a sequence of operations performed as a single logical unit of work. A transaction can involve multiple SQL queries, and it's crucial that either all queries in a transaction are executed successfully, or none of them are. This ensures data integrity and consistency.

### Table:
| account_number | username | password   | balance |
|----------------|----------|------------|---------|
| 101            | Neha     | neha123    | 50000   |
| 102            | Priya    | priya123   | 30000   |
| 103            | Ravi     | ravi123    | 10000   |
| 104            | Naresh   | naresh123  | 100000  |

- **Commit:**
COMMIT is used to save all the changes made during the current transaction. Once a transaction is committed, its changes become permanent.

- **Rollback:**
ROLLBACK is used to undo the changes made in the current transaction. It reverts the database back to the state since the last COMMIT.

- **Savepoint:**
SAVEPOINT is used to set a point within a transaction to which you can later roll back. This allows for finer control over transaction management.

``` SQL
-- Create table 
CREATE TABLE patient_details 
(     
patient_id INT AUTO_INCREMENT PRIMARY KEY,     
patient_name VARCHAR(50),     
age INT,     
status VARCHAR(50) 
); 

-- Insert first three rows and commit 

INSERT INTO patient_details (patient_name, age, status) VALUES ('Savita', 30, 'In'); 
INSERT INTO patient_details (patient_name, age, status) VALUES ('Sona', 40, 'In'); 
INSERT INTO patient_details (patient_name, age, status) VALUES ('Karan', 28, 'Out'); COMMIT; 

-- Create a savepoint 
SAVEPOINT first_entry; 

-- Insert two more rows 

INSERT INTO patient_details (patient_name, age, status) VALUES ('Sahana', 45, 'Recovered'); 
INSERT INTO patient_details (patient_name, age, status) VALUES ('Sindhu', 50, 'Recovered'); 

-- Rollback to savepoint 

ROLLBACK TO first_entry; 

-- Final commit 
COMMIT;
```

#### With out savepoint, rollback will execute upto last commit. 