USE Others;
-- Disable Auto-Commit Mode:
SET autocommit = 0;

CREATE TABLE bank_accounts (
    account_number INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    balance DECIMAL(12,2) CHECK (balance >= 0)
);


INSERT INTO bank_accounts (account_number, username, password, balance) VALUES
(101, 'Neha',   'neha123',   50000),
(102, 'Priya',  'priya123',  30000),
(103, 'Ravi',   'ravi123',   10000),
(104, 'Naresh', 'naresh123', 100000);

--                                  Transferring Money Between Accounts
-- Query to Deduct Amount from Naresh’s Account:
UPDATE bank_accounts 
SET balance = balance - 10000 
WHERE account_number = 104;

-- Query to Add Amount to Ravi’s Account:
UPDATE bank_accounts 
SET balance = balance + 10000 
WHERE account_number = 103;

-- Commit the Transaction:
COMMIT;

--                                      Creating and Using Savepoint
/*Let’s insert three new records into the bank_accounts table, create a savepoint, and then insert two more records. If something goes wrong after the savepoint, we can rollback to the savepoint.*/

-- Insert First Set of Records and Commit:

INSERT INTO bank_accounts (account_number, username, password, balance) VALUES (105, 'Balaji', 'balaji123', 200000); 
INSERT INTO bank_accounts (account_number, username, password, balance) VALUES (106, 'Vikram', 'vikram123', 250000); 
INSERT INTO bank_accounts (account_number, username, password, balance) VALUES (107, 'Sahana', 'sahana123', 150000); 

COMMIT;

-- Create a Savepoint:
SAVEPOINT first_entry;

-- Insert Second Set of Records:
INSERT INTO bank_accounts (account_number, username, password, balance) VALUES (108, 'Sindhu', 'sindhu123', 100000); 
INSERT INTO bank_accounts (account_number, username, password, balance) VALUES (109, 'Swapna', 'swapna123', 180000);

-- Rollback to Savepoint if Needed:
ROLLBACK TO first_entry;