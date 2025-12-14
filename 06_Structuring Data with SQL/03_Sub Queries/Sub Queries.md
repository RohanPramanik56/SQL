# Sub Queries
 SQL, a subquery (also known as an inner query or nested query) is essentially a query within another query. *Subqueries are used to perform operations that require data to be calculated or filtered first before being used in the main query.*

 ### When Should You Use Subqueries?
Subqueries are particularly useful when you need to:
- Find data based on calculations or conditions that aren't immediately available in the main query.
- Perform operations where the results of one query will be used in another query.
- Handle complex queries involving multiple tables and conditions.

## Sample Table for Subqueries

### Ticket Booking Table

| booking_id | movie_name    | show_date  | customer_name   | num_tickets | ticket_price |
|------------|---------------|------------|------------------|-------------|--------------|
| 1          | Bhumi Geeta   | 2024-01-15 | Rajesh Kumar     | 3           | 12.50        |
| 2          | Akash         | 2024-01-16 | Priya Sundaram   | 2           | 10.00        |
| 3          | Bhumi Geeta   | 2024-01-15 | Ankit Singh      | 4           | 12.50        |
| 4          | Bandana       | 2024-01-17 | Neha Gupta       | 2           | 11.00        |
| 5          | Akash         | 2024-01-18 | Amit Sharma      | 5           | 10.00        |

---
### Customer Table

| customer_id | customer_name | email                   |
|-------------|---------------|-------------------------|
| 101         | John Doe      | john.doe@example.com    |
| 102         | James Smith   | james.smith@example.com |
| 103         | Bob Johnson   | bob.johnson@example.com |
| 104         | Alice William | alice.w@example.com     |
| 105         | Akash Pandey  | akash.p@example.com     |
| 106         | Ankit Kumar   | ankit.k@example.com     |

---

### Order Table

| order_id | customer_id | order_date | total_amount |
|----------|-------------|------------|--------------|
| 1        | 101         | 2024-02-01 | 50.00        |
| 2        | 101         | 2024-02-05 | 30.25        |
| 3        | 102         | 2024-02-02 | 75.00        |
| 4        | 103         | 2024-02-03 | 120.00       |
| 5        | 104         | 2024-02-04 | 90.50        |
| 6        | 106         | 2024-02-06 | 60.00        |
| 7        | 106         | 2024-02-07 | 45.00        |

---

## Examples:

### 1. Finding the Blockbuster Movie
``` SQL
SELECT movie_name, ticket_price
FROM ticket_booking
WHERE ticket_price = (
    SELECT MAX(ticket_price)
    FROM ticket_booking
);
```

### 2. Finding Movie Buddies
``` SQL
SELECT customer_name
FROM ticket_booking
WHERE show_date = (
    SELECT show_date
    FROM ticket_booking
    WHERE movie_name = 'Bhumi Geeta'
);
```

### 3. Above-Average Movie Nights
``` SQL
SELECT movie_name, num_tickets
FROM ticket_booking
WHERE num_tickets > (
    SELECT AVG(num_tickets)
    FROM ticket_booking
);
```

### 4. The Ultimate "Bhumi Geeta" Fan
``` SQL
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
```

### 5. The Big Spenders
``` SQL
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
```
## Key Takeaways
- **Enclose subqueries in parentheses** to ensure proper execution.
- Use subqueries when you need to filter or calculate values not directly available.
- **Subqueries are executed first**, and their results are used in the main query.
- ***You can use multiple levels of subqueries, but be cautious of performance.***