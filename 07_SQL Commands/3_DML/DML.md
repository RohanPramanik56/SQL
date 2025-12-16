# DML (Data Manipulation Language)
**INSERT, DELETE, UPDATE**

### Table
**We use this table to demonstrate**
| office_id | office_name        | location | employee_count |
|-----------|--------------------|----------|----------------|
| 1         | Head Office        | City A   | 100            |
| 2         | Branch Office 1    | City B   | 50             |
| 3         | Branch Office 2    | City C   | 40             |
| 4         | Regional Office    | City D   | 30             |
| 5         | Field Office 1     | City E   | 20             |
| 6         | Field Office 2     | City F   | 10             |
| 7         | Sub Office         | City G   | 5              |
| 8         | Main Office        | City H   | 200            |


## INSERT
``` SQL
INSERT INTO office (office_name, location, employee_count) VALUES 
('Head Office', 'City A', 100), 
('Branch Office 1', 'City B', 50), 
('Branch Office 2', 'City C', 40), 
('Regional Office', 'City D', 30), 
('Field Office 1', 'City E', 20), 
('Field Office 2', 'City F', 10), 
('Sub Office', 'City G', 5), 
('Main Office', 'City H', 200);
```

## UPDATE
**let’s update the location of "Branch Office 1" to "City E":**
``` SQL
UPDATE office 
SET location = 'City E' 
WHERE office_name = 'Branch Office 1';
```

**Update the employee count for "Regional Office" and "Main Office" to 450:**
``` SQL
UPDATE office 
SET employee_count = 450 
WHERE office_name = 'Regional Office' OR office_name = 'Main Office';
```

## DELETE
**To delete the record of "Branch Office 2":**
``` SQL
DELETE FROM office 
WHERE office_name = 'Branch Office 2';
```
**delete the record where the employee count is 450 and the location is "City H":**
``` SQL
DELETE FROM office 
WHERE employee_count = 450 AND location = 'City H';
```
**Deleting All Records Temporarily**
``` SQL
DELETE FROM office;
```

## SUMMARY:
- **INSERT** adds new rows to a table.
- **UPDATE** modifies existing data within a table.
- **DELETE** removes data from a table.\
#### **In MySQL we need to disable safe updates by executing: `SET SQL_SAFE_UPDATES = 0;`**