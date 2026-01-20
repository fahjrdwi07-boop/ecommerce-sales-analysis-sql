-- Show all customers
SELECT * FROM customers;

-- Products with price above 500000
SELECT product_name, price
FROM products
WHERE price > 500000;

-- Orders after January 12, 2024
SELECT customer_id, order_date
FROM orders
WHERE order_date > '2024-01-12';

-- Products sorted by highest price
SELECT product_name, price
FROM products
ORDER BY price DESC;

-- Total revenue
SELECT SUM(total_amount) AS total_omzet
FROM orders;

-- Total orders per customer
SELECT customer_id, COUNT(*) AS jumlah_pesanan
FROM orders
GROUP BY customer_id;
