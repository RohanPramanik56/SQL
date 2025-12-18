USE Others;

CREATE TABLE stationary (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(50)
);

INSERT INTO stationary (item_name) VALUES ('Pen'), ('Pencil'), ('Sticker');
SELECT * FROM stationary;
