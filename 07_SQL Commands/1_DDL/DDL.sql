USE Others;

-- CREATE Command
CREATE TABLE library 
(     
book_id INT PRIMARY KEY AUTO_INCREMENT,    
title VARCHAR(255) NOT NULL,     
author VARCHAR(255) NOT NULL,     
publication_year INT,     
genre VARCHAR(50) 
);

-- INSERT Command
INSERT INTO library (title, author, publication_year, genre)  VALUES ('Book Title 1', 'Author 1', 2020, 'Fiction');

-- ALTER Command
ALTER TABLE library  
ADD COLUMN price DECIMAL(10, 2);

ALTER TABLE library  
RENAME COLUMN genre TO book_genre;

-- DROP Command
ALTER TABLE library  
DROP COLUMN price;

-- TRUNCATE Command
TRUNCATE TABLE library; -- Removes all records from the table but keeps the table structure intact
