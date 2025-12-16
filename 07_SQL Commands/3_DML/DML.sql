SET SQL_SAFE_UPDATES = 0;

USE Others;

CREATE TABLE office (
    office_id INT AUTO_INCREMENT PRIMARY KEY,
    office_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    employee_count INT CHECK (employee_count >= 0)
);

-- INSERT

INSERT INTO office (office_name, location, employee_count) VALUES 
('Head Office', 'City A', 100), 
('Branch Office 1', 'City B', 50), 
('Branch Office 2', 'City C', 40), 
('Regional Office', 'City D', 30), 
('Field Office 1', 'City E', 20), 
('Field Office 2', 'City F', 10), 
('Sub Office', 'City G', 5), 
('Main Office', 'City H', 200);


-- UPDATE
UPDATE office 
SET location = 'City E' 
WHERE office_name = 'Branch Office 1';

UPDATE office 
SET employee_count = 450 
WHERE office_name = 'Regional Office' OR office_name = 'Main Office';

-- DELETE

DELETE FROM office 
WHERE office_name = 'Branch Office 2';
DELETE FROM office 
WHERE employee_count = 450 AND location = 'City H';

-- Deleting All Records Temporarily
DELETE FROM office;
