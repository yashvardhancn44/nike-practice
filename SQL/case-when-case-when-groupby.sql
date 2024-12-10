CREATE DATABASE casewhengroupbydb;
use casewhengroupbydb;


-- ### CASE AND WHEN  ---> is used to create conditional logic in SQL queries. It evaluates conditions and returns values based on the first condition met.

-- 1. Classify employees based on their salary into High, Medium, and Low salary brackets.

select employee_name, 
CASE
	WHEN salary>100 THEN 'high'
    when salalry between 50 and 100 then 'medium'
    else 'low'
END AS salary_bracket
from employees;


-- 2. Identify product stock status as 'In Stock', 'Low Stock', or 'Out of Stock'.

-- Create products table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  stock_quantity INT
);

-- Insert data into products table
INSERT INTO products (product_id, product_name, stock_quantity)
VALUES
  (1, 'Apple iPhone', 100),
  (2, 'Samsung TV', 20),
  (3, 'Sony Headphones', 0),
  (4, 'Nike Shoes', 50),
  (5, 'Adidas T-Shirt', 75),
  (6, 'Canon Camera', 10),
  (7, 'HP Laptop', 5),
  (8, 'Lenovo Tablet', 200),
  (9, 'JBL Speakers', 15),
  (10, 'Microsoft Xbox', 0);

select product_id, product_name, stock_quantity, 
case
	when stock_quantity = 0 then 'out of stock'
    when stock_quantity between 0 and 50 then 'low stock'
    else 'in stock'
end as stock_status
from products;




-- ### CASE WHEN with GROUP BY ---> use it to create conditional aggregations. ###

-- 3. Calculate the total sales for each product category and classify the categories as 'High Sales' or 'Low Sales' based on a threshold.
-- Create sales table
CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  category_id INT,
  sales_amount DECIMAL(10, 2)
);

-- Insert data into sales table
INSERT INTO sales (sale_id, category_id, sales_amount)
VALUES
  (1, 1, 10000.00),
  (2, 1, 20000.00),
  (3, 1, 30000.00),
  (4, 2, 5000.00),
  (5, 2, 10000.00),
  (6, 3, 40000.00),
  (7, 3, 60000.00),
  (8, 4, 2000.00),
  (9, 4, 3000.00),
  (10, 5, 80000.00);

select category_id, SUM(sales_amount),
case
when SUM(sales_amount) >10000 then 'high sales'
else 'low sales'
end as total_sales
from sales
group by category_id;


-- 4. Count the number of employees in each department and classify departments as 'Large' or 'Small'.




-- 5. Determine the average order value per customer and classify customers as 'High Spender' or 'Low Spender'.

