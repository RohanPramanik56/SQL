# Views
Views are virtual tables that do not store data themselves but display data stored in base tables. They provide an alternative way to represent data.
### Definition: 
Views in SQL are virtual tables that do not contain any data on their own but display data stored in database tables. A view is an alternative way to represent a table or tables.
### Scenario Example:
Suppose you have a complex query that you need to execute frequently to get certain results. Instead of retyping the query every time, you can create a view.
### Creation Syntax:
``` SQL
CREATE VIEW view_name 
AS 
SELECT column1, column2, ... FROM table_name WHERE condition;
```
### Example in Oracle:
``` SQL
CREATE VIEW average_balance 
AS 
SELECT bank_name, AVG(balance) AS avg_balance 
FROM bank_details 
GROUP BY bank_name;
```
### To use this view, simply query it like a table:
``` SQL
SELECT * FROM average_balance;
```

## We use this 2 tables to demonstrate view:
**Users Table**
| user_id | user_name | account_number |
| --------| --------- | -------------: |
|       1 | Alice     |            101 |
|       2 | Bob       |            102 |
|       3 | Charlie   |            103 |

**Bank Table**

| account_number | account_holder | balance |
| ---------------| -------------- | ------: |
|            101 | Alice          |   50000 |
|            102 | Bob            |  120000 |
|            103 | Charlie        |   90000 |

### Create a View
``` SQL
CREATE VIEW user_id_balance 
AS 
SELECT users.user_id, 
bank.balance FROM users INNER JOIN bank 
ON users.account_number = bank.account_number;
```

### Query the View:
``` SQL
SELECT user_id, balance FROM user_id_balance WHERE balance > 80000;
```

## Example:
``` SQL
USE Others;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    account_number INT
);

INSERT INTO users (user_id, user_name, account_number) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103);


CREATE TABLE bank (
    account_number INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance INT
);

INSERT INTO bank (account_number, account_holder, balance) VALUES
(101, 'Alice', 50000),
(102, 'Bob', 120000),
(103, 'Charlie', 90000);

-- Create a view
CREATE VIEW user_id_balance 
AS 
SELECT users.user_id, 
bank.balance FROM users INNER JOIN bank 
ON users.account_number = bank.account_number;

CREATE VIEW high_balance_users
AS
SELECT user_id, balance 
FROM user_id_balance    
WHERE balance > 100000;

-- Query the view
SELECT user_id, balance FROM user_id_balance WHERE balance > 80000;
SELECT * FROM high_balance_users;   
```