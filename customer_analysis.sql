-- Customer Analysis Queries

-- Show only the names and locations of customers
SELECT name, location FROM customers;

-- List customers who signed up in January 2024
SELECT name, TO_CHAR(order_date, 'MMM') AS month, EXTRACT(YEAR FROM order_date) AS year
FROM customers
JOIN sales ON customers.customer_id = sales.customer_id
WHERE TO_CHAR(order_date, 'MM') = '1' AND EXTRACT(YEAR FROM order_date) = '2024';

-- Retrieve all female customers
SELECT name FROM customers WHERE gender = 'Female';

-- Find customers from New York or Los Angeles
SELECT name FROM customers WHERE location = 'New York' OR location = 'Los Angeles';

-- List customers whose names start with 'J'
SELECT name FROM customers WHERE name LIKE 'J%';

-- Find the total number of customers
SELECT COUNT(*) FROM customers;

-- Count how many customers are from each location
SELECT location, COUNT(*) AS customer_count FROM customers GROUP BY location;

-- Find customers who spent more than $1000
SELECT name FROM customers WHERE total_spend > 1000;

-- Find customers who spent above the average total spend
SELECT name, total_spend FROM customers WHERE total_spend > (SELECT AVG(total_spend) FROM customers);

-- List customers who made more than one order
SELECT c.customer_id, c.name AS customer_name, COUNT(s.sale_id) AS total_orders
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(s.sale_id) > 1
ORDER BY total_orders DESC;

-- Find Each Customer's Latest Order Date
SELECT customer_id, order_date
FROM (
    SELECT customer_id, order_date,
           ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM sales
) AS x
WHERE x.rn = 1;
