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
