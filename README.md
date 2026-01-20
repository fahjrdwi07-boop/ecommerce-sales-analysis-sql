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
```

## 4. Insights

Beberapa insight yang diperoleh dari hasil query:

* Total omzet menunjukkan performa penjualan keseluruhan
* Produk dengan harga tinggi berpotensi memberikan margin besar
* Pelanggan dengan jumlah pesanan terbanyak berpotensi menjadi pelanggan loyal
* Data tanggal pesanan dapat digunakan untuk analisis tren

## 5. Business Recommendations

* Fokuskan promosi pada produk dengan harga tinggi dan permintaan stabil
* Berikan program loyalitas untuk pelanggan dengan pesanan terbanyak
* Analisis lebih lanjut tren bulanan untuk perencanaan campaign

---

📌 **Tools**: SQL, GitHub
📌 **Level**: Beginner – Intermediate
