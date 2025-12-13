# ORACLE SQL
``` SQL
CREATE TABLE employee (
    employee_id       NUMBER PRIMARY KEY,
    name              VARCHAR2(100) NOT NULL,
    designation       VARCHAR2(50) NOT NULL,
    phone             VARCHAR2(15),
    mobile            VARCHAR2(15),
    office            VARCHAR2(15),
    employee_salary   NUMBER(10,2)
);

INSERT INTO employee VALUES (1, 'John Doe', 'Manager', '1234567890', '9876543210', '1122334455', 5000.00);
INSERT INTO employee VALUES (2, 'Jane Smith', 'Developer', '2233445566', '8765432101', '2233445566', 4500.00);
INSERT INTO employee VALUES (3, 'Robert Brown', 'Tester', '3233445567', '7765432102', '3233445567', 4000.00);
INSERT INTO employee VALUES (4, 'Emily Davis', 'Developer', '4233445568', '6765432103', '4233445568', 4700.00);
INSERT INTO employee VALUES (5, 'Michael Johnson', 'Manager', '5233445569', '5765432104', '5233445569', 5200.00);
INSERT INTO employee VALUES (6, 'Linda Wilson', 'Tester', '6233445570', '4765432105', '6233445570', 4300.00);
INSERT INTO employee VALUES (7, 'David Lee', 'Developer', '7233445571', '3765432106', '7233445571', 4900.00);
INSERT INTO employee VALUES (8, 'Laura Kim', 'Tester', '8233445572', '2765432107', '8233445572', 4100.00);
INSERT INTO employee VALUES (9, 'Richard Kim', 'Manager', '9233445573', '1765432108', '9233445573', 5300.00);
INSERT INTO employee VALUES (10, 'Barbara Clark', 'Developer', '1233445574', '0765432109', '1233445574', 4600.00);


SELECT * FROM EMPLOYEE;
```
- In Oracle we can't directly print Sysdate, we have to give a reference every time.
    - SELECT SYSDATE;  // Error
    - SELECT SYSDATE FROM employee;  // Correct
- To avoid these reference oracle provide a inbuilt table called `DUAL TABLE`

### DUAL TABLE
- Oracle provides an inbuilt table called **DUAL** to make our lives easier when working with such keywords. 
- The DUAL table has one column called **DUMMY** and one row with a value of **X**.
- `DESC DUAL;`
- `SELECT * FROM DUAL;`
- **Using the DUAL Table for System Date**
    - `SELECT SYSDATE FROM DUAL;`
- **Using CURRENT_DATE with DUAL**
    - `SELECT CURRENT_DATE FROM DUAL;`
- **Concatenation Using DUAL**
    - `SELECT 'Sachin' || ' ' || 'Tendulkar' AS FULL_NAME FROM DUAL;` **Oracle provides a concatenation operator *(||)* to concatenate strings.**
- **Handling NULL Values in Concatenation**
    - `SELECT 'Sachin' || ' ' || NULL || ' ' || 'Tendulkar' AS FULL_NAME FROM DUAL;`

