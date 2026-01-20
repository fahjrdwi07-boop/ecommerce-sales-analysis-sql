-- Menampilkan semua pelanggan
SELECT * FROM customers;


-- Produk dengan harga di atas 500.000
SELECT product_name, price
FROM products
WHERE price > 500000;


-- Pesanan setelah 12 Januari 2024
SELECT customer_id, order_date
FROM orders
WHERE order_date > '2024-01-12';


-- Produk diurutkan dari harga tertinggi
SELECT product_name, price
FROM products
ORDER BY price DESC;


-- Total omzet
SELECT SUM(total_amount) AS total_omzet
FROM orders;


-- Jumlah pesanan tiap pelanggan
SELECT customer_id, COUNT(*) AS jumlah_pesanan
FROM orders
GROUP BY customer_id;


-- JOIN: Total belanja per pelanggan
SELECT c.customer_name,
COUNT(o.order_id) AS total_orders,
SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
