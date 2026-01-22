# 📊 E-Commerce Sales Analysis using SQL

## 1. Problem Statement

Perusahaan e-commerce ingin memahami performa penjualan, perilaku pelanggan, dan produk terlaris untuk mendukung pengambilan keputusan bisnis berbasis data.

Tujuan analisis ini adalah:

* Mengetahui total omzet penjualan
* Mengidentifikasi produk dengan harga tertinggi
* Menganalisis jumlah pesanan tiap pelanggan
* Melihat tren tanggal pemesanan
* Mengetahui produk paling populer per pelanggan dan per bulan

## 2. Dataset

Dataset yang digunakan merupakan simulasi database e-commerce sederhana dengan tabel berikut:

* **customers** (customer_id, customer_name, email)
* **products** (product_id, product_name, price)
* **orders** (order_id, customer_id, product_id, order_date, total_amount)

Dataset disimpan dalam database SQL (MySQL / PostgreSQL / SQLite).

## 3. SQL Queries

```sql
--Tampilkan semua data pelanggan--
select * from customers;
select * from products;
select * from orders;
select * from order_items;
--Tampilkan nama produk dan harga--
select product_name, price from products;
--Tampilkan produk dengan harga di atas 500.000--
select product_name, price from products
where price > '500000';
--Tampilkan pesanan setelah tanggal 2024-01-12--;
select order_id, order_date from orders
where order_date > '2024-01-12';
--Tampilkan produk termahal ke termurah--;
select product_name, price from products
order by price desc;
--Hitung total omzet dari seluruh pesanan--;
select sum(total_amount) as total_omzet from orders; 
--Hitung jumlah pesanan per pelanggan--;
select customer_id, count(*) as jumlah_pesanan from orders
group by customer_id;
--Tampilkan : Nama Pelanggan, Tanggal Pesanan, Total Belanja--;
select customers.customer_name, orders.order_date, orders.total_amount as total_belanja from orders
join customers on orders.customer_id = customers.customer_id;
--Tampilkan : Nama Produk, Jumlah terjual--;
select products.product_name, sum(order_items.quantity) as jumlah_terjual from order_items
join products on order_items.product_id = products.product_id
group by products.product_name;
--Produk paling laku berdasarkan jumlah terjual--;
select products.product_name, sum(order_items.quantity) as jumlah_terjual from order_items
join products on order_items.product_id = products.product_id
group by products.product_name
order by jumlah_terjual desc;
--Negara dengan total belanja terbesar--;
select customers.country, sum(order_items.quantity) as jumlah_terjual from order_items
join customers on order_items.product_id = product_id
group by customers.country
order by jumlah_terjual desc;
--Statistik harga produk--;
select 
min(price) as min_price,
max(price) as max_price,
avg(price) as avg_price
from products;
--Total omzet per bulan--;
select date_format(order_date, '%y-%m') as month,
sum(total_amount) as total_omzet from orders
group by month
order by month;
--Produk terlaris per bulan--;
select date_format(orders.order_date, '%y-%m') as month,
products.product_name, sum(order_items.quantity) as jumlah_terjual from orders
join order_items on orders.order_id = order_items.order_id
join products on order_items.product_id = products.product_id
group by month, products.product_name
order by month, jumlah_terjual desc;
```

## 4. Insights

Berdasarkan hasil analisis SQL, diperoleh beberapa insight penting:

* Sebagian kecil pelanggan menyumbang porsi omzet terbesar (high-value customers)
* Produk dengan harga tinggi berkontribusi signifikan terhadap total omzet
* Terdapat pelanggan dengan frekuensi pemesanan tinggi yang berpotensi menjadi pelanggan loyal
* Data pemesanan setelah Januari 2024 menunjukkan potensi peningkatan aktivitas transaksi
* Beberapa produk populer sering dipesan bersama pelanggan tertentu
* Tren omzet bulanan dapat menunjukkan seasonality dan pola musiman penjualan

Insight ini menunjukkan bahwa strategi bisnis sebaiknya tidak hanya fokus pada volume pesanan, tetapi juga pada nilai transaksi dan tren waktu.

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

5. **Produk Promosi Musiman**
   Fokuskan kampanye marketing pada produk yang paling banyak dibeli pada bulan tertentu untuk meningkatkan penjualan musiman

---

📌 **Tools**: SQL (MySQL / PostgreSQL)
📌 **Skill Highlighted**: Data Analysis, Aggregation, JOIN, Business Insight, Trend Analysis
📌 **Level**: Beginner – Intermediate
