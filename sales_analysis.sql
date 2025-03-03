-- Sales Analysis Queries

-- Show the total revenue from sales
SELECT SUM(price * quantity) AS total_revenue FROM sales;

-- Find the total sales per customer
SELECT customer_id, SUM(price * quantity) AS total_spent FROM sales GROUP BY customer_id ORDER BY total_spent DESC;

-- Get the average order value per customer
SELECT customer_id, ROUND(SUM(price * quantity) / COUNT(DISTINCT sale_id), 2) AS avg_order_value
FROM sales
GROUP BY customer_id ORDER BY avg_order_value DESC;

-- Show the total revenue per product category
SELECT category, SUM(quantity * s.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY category;

-- Find the most sold product
SELECT name, COUNT(*) AS total_sold FROM products GROUP BY name ORDER BY total_sold DESC LIMIT 1;

-- Show customer names along with their orders
SELECT c.name AS customer_name, p.name AS product_name FROM customers c JOIN products p ON c.customer_id = p.product_id;

-- Display sales along with product names
SELECT s.sale_id, s.quantity, s.price, p.name AS product_name FROM sales s JOIN products p ON s.product_id = p.product_id;

-- List all orders with customer names and product names
SELECT s.sale_id, s.quantity, s.price, c.name AS customer_name, p.name AS product_name
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id;

-- Find the sales made by each sales representative
SELECT salesrep_id, SUM(price * quantity) AS total_sales FROM sales GROUP BY salesrep_id ORDER BY total_sales DESC;

-- Show total sales per sales representative
SELECT sr.name, SUM(s.price * s.quantity) AS total_sales
FROM sales s JOIN salesreps sr ON s.salesrep_id = sr.id
GROUP BY sr.name ORDER BY total_sales DESC;

-- Find the total revenue generated per month
SELECT TO_CHAR(order_date, 'MM') AS month, SUM(price * quantity) AS total_revenue FROM sales GROUP BY month ORDER BY month;

-- Rank sales representatives by total revenue (DENSE_RANK)
SELECT sales_rep_id, SUM(price * quantity) AS total_revenue,
       DENSE_RANK() OVER(ORDER BY SUM(price * quantity) DESC) AS rank
FROM sales GROUP BY sales_rep_id;
