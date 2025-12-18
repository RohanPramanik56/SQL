# Synonyms
A synonym in SQL is an alternative name for a database object, such as a table, view, sequence, or stored procedure. It makes it easier to reference these objects without having to use their full, sometimes lengthy, names every time.

### Creating a Synonym
To demonstrate, let's create a synonym for the table bank_active_user_account_details and name it BA. This allows us to reference the table simply as BA in our queries.

### Table
| account_number | user_name | balance |
|----------------|-----------|---------|
| 101            | Alice     | 50000   |
| 102            | Bob       | 120000  |
| 103            | Charlie   | 90000   |

**Creating the Synonym:**
``` SQL
CREATE SYNONYM BA FOR bank_active_user_account_details;
```
This command creates a synonym BA for the bank_active_user_account_details table.

### Advantages of Synonyms
- **Simplifies Queries:** Makes queries easier to write and read.
- **Reduces Errors:** Minimizes the risk of typing errors with long table names.
- **Enhances Productivity:** Saves time and effort, especially in complex queries.

## Use the synonym BA in various SQL operations:
### Insert Data:
``` SQL
INSERT INTO BA (account_number, user_name, balance) VALUES (567890, 'Bob', 2500);
```
### Update Data:
``` SQL
UPDATE BA SET balance = 3000 WHERE user_name = 'Alice';
```
### Delete Data:
``` SQL
DELETE FROM BA WHERE account_number = 567890;
```

# `SYNONYM Doesn't work in MySQL, but works in SQL Server and Oracle.`

