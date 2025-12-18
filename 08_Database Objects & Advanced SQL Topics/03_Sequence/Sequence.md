# Sequence
A sequence in SQL is a database object used to generate a series of unique numbers, typically used for primary keys. The sequence of numbers can start from any given value and can be incremented by a specified amount.

### Table
| item_id | item_name |
|--------:|-----------|
| 1       | Pen       |
| 2       | Pencil    |
| 3       | Sticker   |


### Creating a Sequence
Suppose we have a table named **`stationary`**, and we need to insert values with unique `item_ids`
``` SQL
CREATE SEQUENCE item_seq 
START WITH 1 
INCREMENT BY 1 
MAXVALUE 100000 NOCYCLE;
```
- **START WITH:** Specifies the starting value of the sequence.
- **INCREMENT BY:** Specifies the interval between sequence numbers.
- **MAXVALUE:** Sets the maximum value for the sequence.
- **NOCYCLE:** Ensures the sequence does not restart after reaching the maximum value.

## SEQUENCE in ORACLE
``` SQL
-- Stationary Table
CREATE TABLE stationary (
    item_id   NUMBER PRIMARY KEY,
    item_name VARCHAR2(50)
);

-- Creating Sequence
CREATE SEQUENCE item_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

-- Inserting Values
INSERT INTO stationary (item_id, item_name)
VALUES (item_seq.NEXTVAL, 'Pen');

INSERT INTO stationary (item_id, item_name)
VALUES (item_seq.NEXTVAL, 'Pencil');

INSERT INTO stationary (item_id, item_name)
VALUES (item_seq.NEXTVAL, 'Sticker');


SELECT * FROM stationary;

SELECT item_seq.CURRVAL FROM dual; -- It will gives current sequenece value
SELECT item_seq.NEXTVAL FROM dual;  -- for next sequenece value
```

## SEQUENCE in MySQL
``` SQL
USE Others;

CREATE TABLE stationary (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(50)
);

INSERT INTO stationary (item_name) VALUES ('Pen'), ('Pencil'), ('Sticker');
SELECT * FROM stationary;
```