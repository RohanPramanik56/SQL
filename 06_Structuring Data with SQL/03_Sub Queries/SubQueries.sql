SHOW DATABASES;
USE Others;

SHOW TABLES;

-- Creating a sample customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

-- Inserting sample data into customers table
INSERT INTO customers (customer_id, customer_name, email) VALUES
(101, 'John Doe', 'john.doe@example.com'),
(102, 'James Smith', 'james.smith@example.com'),
(103, 'Bob Johnson', 'bob.johnson@example.com'),
(104, 'Alice William', 'alice.w@example.com'),
(105, 'Akash Pandey', 'akash.p@example.com'),
(106, 'Ankit Kumar', 'ankit.k@example.com');

-- Creating a sample ticket_booking table
CREATE TABLE ticket_booking (
    booking_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    show_date DATE,
    customer_name VARCHAR(100),
    num_tickets INT,
    ticket_price DECIMAL(10, 2)
);

-- Inserting sample data into ticket_booking table
INSERT INTO ticket_booking (booking_id, movie_name, show_date, customer_name, num_tickets, ticket_price) VALUES
(1, 'Bhumi Geeta', '2024-01-15', 'Rajesh Kumar', 3, 12.50),
(2, 'Akash', '2024-01-16', 'Priya Sundaram', 2, 10.00),
(3, 'Bhumi Geeta', '2024-01-15', 'Ankit Singh', 4, 12.50),
(4, 'Bandana', '2024-01-17', 'Neha Gupta', 2, 11.00),
(5, 'Akash', '2024-01-18', 'Amit Sharma', 5, 10.00);

-- Creating a sample orders table   
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Inserting sample data into orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-02-01', 50.00),
(2, 101, '2024-02-05', 30.25),
(3, 102, '2024-02-02', 75.00),
(4, 103, '2024-02-03', 120.00),
(5, 104, '2024-02-04', 90.50),
(6, 106, '2024-02-06', 60.00),
(7, 106, '2024-02-07', 45.00);


-- Finding the Blockbuster Movie
SELECT movie_name, ticket_price
FROM ticket_booking
WHERE ticket_price = (
    SELECT MAX(ticket_price)
    FROM ticket_booking
);

-- Finding Movie Buddies
SELECT customer_name
FROM ticket_booking
WHERE show_date = (
    SELECT show_date
    FROM ticket_booking
    WHERE movie_name = 'Bhumi Geeta'
);

-- Above-Average Movie Nights
SELECT movie_name, num_tickets
FROM ticket_booking
WHERE num_tickets > (
    SELECT AVG(num_tickets)
    FROM ticket_booking
);

-- The Ultimate "Bhumi Geeta" Fan
SELECT customer_name
FROM ticket_booking
WHERE show_date = (
    SELECT show_date
    FROM ticket_booking
    WHERE movie_name = 'Bhumi Geeta'
) AND num_tickets = (
    SELECT num_tickets
    FROM ticket_booking
    WHERE movie_name = 'Bhumi Geeta'
    LIMIT 1
);

-- The Big Spenders
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
    WHERE o.total_amount > (
        SELECT AVG(total_amount)
        FROM orders
        WHERE customer_id = o.customer_id
    )
);