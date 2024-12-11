
create database nikeActualQuestions;
use nikeActualQuestions;
-- ==================

/*1. Find the highest-selling product per category and region (geo):
Scenario: You have three tables:

sales: Contains product_id, category_id, region, and quantity_sold.
products: Contains product_id, product_name.
categories: Contains category_id, category_name.
*/

-- 
CREATE TABLE sales (
  product_id INT,
  category_id INT,
  region VARCHAR(50),
  quantity_sold INT
);

INSERT INTO sales (product_id, category_id, region, quantity_sold)
VALUES
  (1, 1, 'North', 100),
  (1, 1, 'North', 50),
  (2, 1, 'North', 20),
  (3, 2, 'South', 200),
  (3, 2, 'South', 150),
  (4, 2, 'South', 100),
  (5, 3, 'East', 50),
  (5, 3, 'East', 30),
  (6, 3, 'East', 20);
  
  
  CREATE TABLE products (
  product_id INT,
  product_name VARCHAR(100)
);

INSERT INTO products (product_id, product_name)
VALUES
  (1, 'Product A'),
  (2, 'Product B'),
  (3, 'Product C'),
  (4, 'Product D'),
  (5, 'Product E'),
  (6, 'Product F');
  
  
  CREATE TABLE categories (
  category_id INT,
  category_name VARCHAR(100)
);

INSERT INTO categories (category_id, category_name)
VALUES
  (1, 'Electronics'),
  (2, 'Fashion'),
  (3, 'Home Goods');


/*
-- Select s.product_id, p.product_name,s.category_id, c.category_name, s.region, s.quantity_sold, -- cant write s.quantity sold here if it is not in groupbyclasues
Select s.product_id, p.product_name,s.category_id, c.category_name, s.region,
SUM(s.quantity_sold) as total_quantity
FROM sales s
JOIN products p 
ON s.product_id = p.product_id
JOIN categories c
ON s.category_id = c.category_id
GROUP BY s.category_id, s.region, s.product_id, p.product_name, c.category_name
order by total_quantity desc
limit 1;
*/

-- using window functions 

Select s.product_id, p.product_name,s.category_id, c.category_name, s.region,
SUM(s.quantity_sold) as total_quantity,
-- rank() OVER( Partition by s.category_id, s.region order by total_quantity DESC) as rnk
rank() OVER(Partition by s.region, s.category_id order by SUM(s.quantity_sold) DESC) as rnk
FROM sales s
JOIN products p 
ON s.product_id = p.product_id
JOIN categories c
ON s.category_id = c.category_id
GROUP BY s.category_id, s.region, s.product_id, p.product_name, c.category_name;


-- with CTE 


with ranked_sales as(Select s.product_id, p.product_name,s.category_id, c.category_name, s.region,
SUM(s.quantity_sold) as total_quantity,
-- rank() OVER( Partition by s.category_id, s.region order by total_quantity DESC) as rnk
rank() OVER(Partition by s.region, s.category_id order by SUM(s.quantity_sold) DESC) as rnk
FROM sales s
JOIN products p 
ON s.product_id = p.product_id
JOIN categories c
ON s.category_id = c.category_id
GROUP BY s.category_id, s.region, s.product_id, p.product_name, c.category_name)
SELECT 
    category_name,
    region,
    product_name AS highest_selling_product,
    total_quantity
FROM ranked_sales
WHERE rnk = 1;

############################################################



CREATE TABLE sales_a (
  sale_date DATE,
  quantity_sold INT
);

INSERT INTO sales_a (sale_date, quantity_sold)
VALUES
  ('2024-01-01', 100),
  ('2024-01-05', 200),
  ('2024-01-10', 300),
  ('2024-01-15', 400),
  ('2024-01-20', 500),
  ('2024-02-01', 550),
  ('2024-02-05', 600),
  ('2024-02-10', 650),
  ('2024-02-15', 700),
  ('2024-02-20', 750),
  ('2024-03-01', 800),
  ('2024-03-05', 850),
  ('2024-03-10', 900),
  ('2024-03-15', 950),
  ('2024-03-20', 1000),
  ('2024-04-01', 1050),
  ('2024-04-05', 1100),
  ('2024-04-10', 1150),
  ('2024-04-15', 1200),
  ('2024-04-20', 1250),
  ('2024-05-01', 1300),
  ('2024-05-05', 1350),
  ('2024-05-10', 1400),
  ('2024-05-15', 1450),
  ('2024-05-20', 1500),
  ('2024-06-01', 1550),
  ('2024-06-05', 1600),
  ('2024-06-10', 1650),
  ('2024-06-15', 1700),
  ('2024-06-20', 1750);

WITH monthly_sales as (
SELECT 
DATE_FORMAT(s.sale_date,'%Y-%m') as months,
SUM(s.quantity_sold) as total_sales
FROM sales_a s
WHERE s.sale_date >= '2024-01-01'
GROUP BY months),
sales_growth as (
select 
	months,
    total_sales,
    LAG(total_sales) over(order by months) as prev_month_sales,
    ROUND((total_sales-LAG(total_sales) over(order by months))*100/LAG(total_sales) over(order by months),2) as growth_percentage
from monthly_sales)
SELECT 
    months,
    total_sales,
    prev_month_sales,
    growth_percentage
FROM sales_growth;


-- ######################################################333


###################################

CREATE TABLE sales_c (
  product_id INT,
  region VARCHAR(50),
  quantity_sold INT
);

INSERT INTO sales_c (product_id, region, quantity_sold)
VALUES
  (1, 'North', 100),	
  (1, 'South', 200),
  (1, 'East', 300),
  (1, 'West', 400),
  (2, 'North', 50),
  (2, 'South', 150),
  (2, 'East', 250),
  (3, 'North', 200),
  (3, 'South', 300),
  (4, 'North', 100),
  (4, 'East', 200);
  
CREATE TABLE products_c (
  product_id INT,
  product_name VARCHAR(100)
);

INSERT INTO products_c (product_id, product_name)
VALUES
  (1, 'Product A'),
  (2, 'Product B'),
  (3, 'Product C'),
  (4, 'Product D');

/* 12. List products that were sold in all regions:
Scenario:
Find products that are sold in every region.
 sales_c (product_id, region, quantity_sold)
 products_c (product_id, product_name)
*/


select p.product_id, p.product_name, s.region
from sales s
join products p
on s.product_id = p.product_id
group by p.product_id;



