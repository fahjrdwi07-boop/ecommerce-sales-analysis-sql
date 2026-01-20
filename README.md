# 📊 E-Commerce Sales Analysis using SQL

## 1. Problem Statement

Perusahaan e-commerce ingin memahami performa penjualan, perilaku pelanggan, dan produk terlaris untuk mendukung pengambilan keputusan bisnis berbasis data.

Tujuan analisis ini adalah:

* Mengetahui total omzet penjualan
* Mengidentifikasi produk dengan harga tertinggi
* Menganalisis jumlah pesanan tiap pelanggan
* Melihat tren tanggal pemesanan

## 2. Dataset

Dataset yang digunakan merupakan simulasi database e-commerce sederhana dengan tabel berikut:

* **customers** (customer_id, customer_name, email)
* **products** (product_id, product_name, price)
* **orders** (order_id, customer_id, order_date, total_amount)

Dataset disimpan dalam database SQL (MySQL / PostgreSQL / SQLite).

## 3. SQL Queries

```sql
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
```

## 4. Insights

Berdasarkan hasil analisis SQL, diperoleh beberapa insight penting:

* Sebagian kecil pelanggan menyumbang porsi omzet terbesar (high-value customers)
* Produk dengan harga tinggi berkontribusi signifikan terhadap total omzet
* Terdapat pelanggan dengan frekuensi pemesanan tinggi yang berpotensi menjadi pelanggan loyal
* Data pemesanan setelah Januari 2024 menunjukkan potensi peningkatan aktivitas transaksi

Insight ini menunjukkan bahwa strategi bisnis sebaiknya tidak hanya fokus pada volume pesanan, tetapi juga pada nilai transaksi.

## 5. Business Recommendations

Berdasarkan insight di atas, rekomendasi bisnis yang dapat diberikan:

1. **Program Loyalitas Pelanggan**
   Berikan reward khusus untuk pelanggan dengan total belanja tertinggi

2. **Fokus Produk High-Value**
   Tingkatkatkan promosi pada produk dengan harga tinggi dan margin besar

3. **Customer Retention Strategy**
   Lakukan follow-up marketing kepada pelanggan aktif setelah Januari 2024

4. **Analisis Lanjutan**
   Disarankan analisis lanjutan berbasis waktu (bulanan / kuartalan) untuk melihat tren penjualan

---

📌 **Tools**: SQL (MySQL / PostgreSQL)
📌 **Skill Highlighted**: Data Analysis, Aggregation, JOIN, Business Insight
📌 **Level**: Beginner – Intermediate
