-- Product Analysis Queries

-- Find all products priced above $300
SELECT name, price FROM products WHERE price > 300;

-- Show the top 5 most expensive products
SELECT name, price FROM products ORDER BY price DESC LIMIT 5;

-- Get products whose price is between $100 and $500
SELECT name FROM products WHERE price BETWEEN 100 AND 500;

-- Count the number of products in each category
SELECT category, COUNT(*) AS product_count FROM products GROUP BY category;

-- Calculate the average product price
SELECT AVG(price) AS avg_product_price FROM products;

-- Find the highest and lowest product prices
SELECT MIN(price) AS lowest_price, MAX(price) AS highest_price FROM products;

-- Find products that are cheaper than the average product price
SELECT name, price FROM products WHERE price < (SELECT AVG(price) FROM products);

-- Find the second highest-priced product
SELECT MAX(price) FROM products WHERE price < (SELECT MAX(price) FROM products);

-- Rank products by price using RANK()
SELECT name, price, RANK() OVER(ORDER BY price DESC) AS rank FROM products;

-- Find the Top 3 Most Expensive Products in Each Category
SELECT name, price FROM (
    SELECT name, price, RANK() OVER(PARTITION BY category ORDER BY price DESC) AS rnk
    FROM products
) AS ranked_products WHERE ranked_products.rnk <= 3;

-- Show the most popular product category
SELECT category AS popular_category, COUNT(category) AS category_count
FROM products
GROUP BY category
ORDER BY category_count DESC
LIMIT 1;
