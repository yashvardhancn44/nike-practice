CREATE DATABASE whereorderbydb;
use whereorderbydb;

-- 1. Retrieve employees with a salary greater than 50,000, sorted in descending order of their salary.

SELECT e.employee_id, e.employee_name
FROM employees e 
where e.salary > 50000
ORDER BY salary DESC;

-- 2. Find products priced between 100 and 500, sorted alphabetically by product name.

SELECT *
FROM products p
WHERE p.price BETWEEN 100 and 500
ORDER BY p.product_name ASC;


-- 3. Fetch the details of students who scored more than 70 in Math and sort them by their scores in ascending order.
SELECT *
FROM students s
WHERE s.subject = 'Math' AND s.score >70
ORDER BY s.score ASC;


-- 4. Retrieve the top 5 most expensive products.

SELECT *
FROM products p
ORDER BY p.price DESC
LIMIT 5;

-- 5. Fetch customer orders placed in the last 30 days, sorted by order date.

-- Create orders table
CREATE TABLE orders_a (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2)
);

-- Insert data into orders table
INSERT INTO orders_a (order_id, customer_id, order_date, total_amount)
VALUES
  (1, 1, '2024-11-10', 100.00),
  (2, 2, '2024-11-15', 50.00),
  (3, 1, '2024-11-20', 200.00),
  (4, 3, '2024-11-25', 75.00),
  (5, 2, '2024-11-30', 150.00),
  (6, 1, '2024-12-01', 300.00),
  (7, 3, '2024-12-05', 225.00),
  (8, 2, '2024-12-06', 100.00),
  (9, 1, '2024-12-08', 250.00),
  (10, 3, '2024-12-09', 175.00);
INSERT INTO orders_a (order_id, customer_id, order_date, total_amount)
VALUES  (11, 3, '2024-10-09', 175.00);

drop table orders_a;
select * from orders_a;

SELECT order_id, customer_id, order_date, total_amount
FROM orders_a
WHERE order_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
ORDER BY order_date DESC;


-- 6. Find employees working in 'Sales' or 'Marketing', sorted by their department and name.

SELECT e_name, dept
FROM employees
WHERE dept IN ('SALES', 'MARKETING')
order by dept ASC, e_name ASC; 
-- order by dept, e_name; -- wrong

-- 7. Identify customers from the USA who have spent more than $1,000, sorted by their total spending.
SELECT customer_id, customer_name, country, total_spent
FROM customers
WHERE country = 'USA' AND total_spent > 1000
ORDER BY total_spent DESC;
