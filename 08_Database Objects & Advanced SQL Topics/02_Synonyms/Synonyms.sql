-- SYNONYM Doesn't work in MySQL, but works in SQL Server and Oracle.

USE Others;

CREATE TABLE bank_active_user_account_details (
    account_number INT PRIMARY KEY,
    user_name VARCHAR(100),
    balance DECIMAL(10, 2)
);

INSERT INTO bank_active_user_account_details (account_number, user_name, balance) VALUES
(101, 'Alice', 50000),
(102, 'Bob', 120000),
(103, 'Charlie', 90000);

--- Create a synonym for the table
CREATE SYNONYM BA FOR bank_active_user_account_details;

-- Query using the synonym
SELECT * FROM BA;
