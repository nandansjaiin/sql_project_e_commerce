CREATE TABLE sales (
order_id INT PRIMARY KEY,
order_date DATE,
customer_name VARCHAR(100),
city VARCHAR(50),
product_category VARCHAR(50),
product_name VARCHAR(100),
quantity INT,
price DECIMAL(10,2),
total_amount DECIMAL(12,2),
payment_method VARCHAR(50),
order_status VARCHAR(30)
);

INSERT INTO sales VALUES
(1,'2026-01-02','Amit Sharma','Delhi','Clothing','Men
T-Shirt',2,499,998,'UPI','Delivered'),
(2,'2026-01-03','Riya Khan','Mumbai','Beauty','Lipstick
Set',1,799,799,'COD','Delivered'),
(3,'2026-01-04','Neha Verma','Lucknow','Home Decor','Wall
Painting',1,1299,1299,'UPI','Delivered'),
(4,'2026-01-05','Rahul Das','Kolkata','Electronics','Bluetooth
Speaker',1,1499,1499,'Card','Delivered'),
(5,'2026-01-06','Priya Singh','Delhi','Clothing','Women
Kurti',2,899,1798,'UPI','Delivered'),
(6,'2026-01-07','Arjun Mehta','Jaipur','Footwear','Sports
Shoes',1,1999,1999,'COD','Shipped'),
(7,'2026-01-08','Sara Ali','Hyderabad','Beauty','Makeup
Kit',1,1599,1599,'UPI','Delivered'),
(8,'2026-01-09','Karan Patel','Ahmedabad','Electronics','Smart
Watch',1,2499,2499,'Card','Delivered'),
(9,'2026-01-10','Pooja Nair','Chennai','Home Decor','Table
Lamp',2,699,1398,'UPI','Delivered'),
(10,'2026-01-11','Rohan
Roy','Kolkata','Clothing','Jeans',1,1199,1199,'COD','Delivered'),
(11,'2026-01-12','Sneha Kapoor','Delhi','Beauty','Face
Cream',3,399,1197,'UPI','Delivered'),
(12,'2026-01-13','Vikram Singh','Lucknow','Electronics','Power
Bank',2,899,1798,'Card','Delivered'),
(13,'2026-01-14','Deepika
Sharma','Jaipur','Clothing','Saree',1,2499,2499,'UPI','Delivered'),
(14,'2026-01-15','Farhan Khan','Mumbai','Footwear','Casual
Shoes',1,1499,1499,'COD','Delivered'),
(15,'2026-01-16','Nikhil Joshi','Pune','Home Decor','Flower
Vase',2,499,998,'UPI','Delivered'),
(16,'2026-01-17','Meena
Iyer','Chennai','Beauty','Perfume',1,1899,1899,'Card','Delivered'),
(17,'2026-01-18','Aditya
Verma','Delhi','Electronics','Earbuds',1,1999,1999,'UPI','Delivered'),
(18,'2026-01-19','Sandeep
Yadav','Lucknow','Clothing','Hoodie',2,1399,2798,'COD','Delivered'),
(19,'2026-01-20','Farah Ali','Hyderabad','Beauty','Hair
Dryer',1,2199,2199,'UPI','Delivered'),
(20,'2026-01-21','Ritesh Gupta','Delhi','Electronics','LED
Light',3,299,897,'UPI','Delivered'),
(21,'2026-01-22','Kavita Singh','Jaipur','Clothing','Salwar
Suit',1,1899,1899,'Card','Delivered'),
(22,'2026-01-23','Ankit Sharma','Mumbai','Footwear','Running
Shoes',1,2299,2299,'COD','Delivered'),
(23,'2026-01-24','Sunita Das','Kolkata','Home
Decor','Curtains',2,799,1598,'UPI','Delivered'),
(24,'2026-01-25','Manish Patel','Ahmedabad','Electronics','Mobile
Stand',3,199,597,'UPI','Delivered'),
(25,'2026-01-26','Pankaj
Kumar','Patna','Clothing','Jacket',1,2499,2499,'Card','Shipped');

select * from sales;
select customer_name, city from sales;
select * from sales where city = 'Delhi';
select * from sales where product_category = 'Clothing';
select * from sales where payment_method = 'UPI';
select count(*) from sales;
select sum(total_amount) from sales;
select avg(total_amount) from sales;
select min(price) from sales;
select mAX(price) from sales;
select city, count(*) from sales group by city;
select product_category, sum(total_amount) from sales group by product_category;
select payment_method, count(*) from sales group by payment_method;
select order_status, count(*) from sales group by order_status;
select city, avg(total_amount) from sales group by city;
select * from sales order by total_amount DESC;
select product_name, price from sales order by price DESC;
select customer_name, total_amount from sales order by total_amount desc;
select distinct city from sales order by city;
select city, sum(total_amount) from sales group by city order by sum(total_amount);
select * from sales where customer_name like "A%";
select * from sales where product_name like "%shoes%";
select * from sales where city like "%delhi%";
select * from sales where product_category like "%Electronics%";
select * from sales where product_name like "%watch%";
select * from sales limit 5;
select * from sales order by total_amount desc limit 3;
select * from sales order by price desc limit 5;
select city, Sum(total_amount) from sales group by city order by sum(total_amount) desc limit 5;
select * from sales order by order_date limit 5;
select * from sales limit 5 offset 5;
select * from sales order by total_amount desc limit 3 offset 2;
select product_name from sales limit 5 offset 3;
select customer_name from sales order by customer_name limit 5 offset 5;
select city from sales limit 5 offset 2;
select product_category, Sum(quantity) from sales group by product_category order by sum(quantity) desc;
select city, count(*) from sales where order_status = "delivered" group by city;
select sum(total_amount), payment_method from sales group by payment_method order by sum(total_amount) desc;
select sum(quantity), product_name from sales group by product_name order by sum(quantity) desc limit 5;
select city, avg(total_amount) from sales group by city order by avg(total_amount) desc;