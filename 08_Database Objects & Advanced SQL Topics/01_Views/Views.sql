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