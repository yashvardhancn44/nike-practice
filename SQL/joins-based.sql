CREATE DATABASE joinsdb;
USE joinsdb;

-- Create customers table

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(255)
);

-- Create orders table
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert data into customers table
INSERT INTO customers (customer_id, customer_name)
VALUES
  (1, 'John Doe'),
  (2, 'Jane Doe'),
  (3, 'Bob Smith'),
  (4, 'Alice Brown');

-- Insert data into orders table
INSERT INTO orders (order_id, customer_id, order_date)
VALUES
  (1, 1, '2022-01-01'),
  (2, 1, '2022-01-15'),
  (3, 2, '2022-02-01'),
  (4, 3, '2022-03-01');
  
  
-- Find customers with and without orders (Full Outer Join).

-- no full outer join in MySQL - need to use left join union right join

SELECT c.customer_id, c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


SELECT * 
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT *
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


--

-- Create departments table
CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(255)
);

-- Create employees table
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert data into departments table
INSERT INTO departments (department_id, department_name)
VALUES
  (1, 'Sales'),
  (2, 'Marketing'),
  (3, 'IT');

-- Insert data into employees table
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES
  (1, 'John Doe', 1),
  (2, 'Jane Doe', 1),
  (3, 'Bob Smith', 2),
  (4, 'Alice Brown', NULL),
  (5, 'Mike Davis', 3),
  (6, 'Emily Taylor', NULL);


SELECT employee_name AS E_NAME, department_name AS D_NAME
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;




-- =============================================


-- Create categories table
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(255)
);

-- Create products table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Insert data into categories table
INSERT INTO categories (category_id, category_name)
VALUES
  (1, 'Electronics'),
  (2, 'Fashion'),
  (3, 'Home Goods'),
  (4, 'Sports');

-- Insert data into products table
INSERT INTO products (product_id, product_name, category_id)
VALUES
  (1, 'Smartphone', 1),
  (2, 'Laptop', 1),
  (3, 'T-Shirt', 2),
  (4, 'Dress', 2),
  (5, 'Coffee Table', 3),
  (6, 'Sofa', 3),
  (7, 'Basketball', 4),
  (8, 'Football', 4),
  (9, 'TV', 1),
  (10, 'Shoes', 2);
  
  
SELECT *
FROM products
INNER JOIN categories
ON products.category_id = categories.category_id;


-- ====================================================


-- Find all orders and their customers, even if there’s no matching customer

SELECT *
FROM customers c 
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

INSERT INTO orders(order_id,order_date)
VALUES (6,'2024-12-10');

SELECT *
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id;

SELECT * FROM orders;


--- cross join

SELECT *
FROM customers
CROSS JOIN orders;


-- ====================================================

 -- Count orders for each customer 
 
 
 SELECT c.customer_id, COUNT(o.order_id)
 FROM customers c
 LEFT JOIN orders o
 ON c.customer_id = o.customer_id
 GROUP BY c.customer_id;


-- Identify unmatched records between two tables

SELECT c.customer_id, c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id is NULL
UNION
SELECT  c.customer_id, c.customer_name, o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_id is NULL;



--  Fetch top 3 customers based on the number of orders 
-- (Left Join with Count Agg->Ranking)

SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY COUNT(o.order_id) DESC
LIMIT 3;

-- Find the total sales for each product 
-- (Inner Join with Aggregation).
-- data not available; assuming order table has o.amount
-- note: cant keep null, when doing sum - so inner join

SELECT p.product_name
FROM products p
INNER JOIN orders o
GROUP BY p.product_id, p.product_name;


-- =====================

-- Create products table

CREATE TABLE products_a (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  price DECIMAL(10, 2)
);

-- Create orders table
CREATE TABLE orders_a (
  order_id INT PRIMARY KEY,
  order_date DATE
);

-- Create order_items table
CREATE TABLE order_items_a (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into products table
INSERT INTO products_a (product_id, product_name, price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 5.99),
  (3, 'Product C', 7.99),
  (4, 'Product D', 12.99);

-- Insert data into orders table
INSERT INTO orders_a (order_id, order_date)
VALUES
  (1, '2022-01-01'),
  (2, '2022-01-15'),
  (3, '2022-02-01'),
  (4, '2022-03-01');

-- Insert data into order_items table
INSERT INTO order_items_a (order_item_id, order_id, product_id, quantity)
VALUES
  (1, 1, 1, 2),
  (2, 1, 2, 1),
  (3, 2, 1, 1),
  (4, 2, 3, 2),
  (5, 3, 2, 3),
  (6, 3, 4, 1),
  (7, 4, 1, 1),
  (8, 4, 3, 1);
  
  
  SELECT * FROM products_a;
  
  SELECT p.product_id,p.product_name, SUM(p.price*oi.quantity) AS total_sales
  FROM order_items_a oi
  INNER JOIN products_a p
  ON oi.product_id = p.product_id
  GROUP BY p.product_id;
  
-- =================================================================

-- Identify overlapping employees between two departments 
-- (self Join) 
-- Self Join Overview: A self join is a join where a table is joined with itself. It is typically 
-- used to find relationships within the same table, such as hierarchical relationships, comparisons, or duplicates.

-- ---------------------
-- Create employees table
CREATE TABLE employees_b (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255),
  department_id INT,
  department_name VARCHAR(255)
);

-- Insert data into employees table
INSERT INTO employees_b (employee_id, employee_name, department_id, department_name)
VALUES
  (1, 'John Doe', 1, 'Sales'),
  (2, 'John Doe', 2, 'Marketing'),
  (3, 'Jane Doe', 1, 'Sales'),
  (4, 'Bob Smith', 2, 'Marketing'),
  (5, 'Alice Brown', 1, 'Sales'),
  (6, 'Alice Brown', 3, 'IT'),
  (7, 'Mike Davis', 2, 'Marketing'),
  (8, 'Mike Davis', 3, 'IT');

SELECT *
FROM employees_b e1
INNER JOIN employees_b e2
ON e1.employee_id = e2.employee_id;

SELECT 
e1.employee_name AS Emp_name,
e1.department_name AS First_dept,
e2.department_name AS second_dept
FROM 
  employees_b e1
  INNER JOIN employees_b e2
  ON e1.employee_name = e2.employee_name
  WHERE e1.department_name < e2.department_name; -- doesn't give duplicates
  -- AND e1.department_name < e2.department_name; -- doesn't give duplicates (SAME AS USING WHERE)
	-- AND e1.department_name NOT LIKE e2.department_name; (gives duplicates actually)
	-- AND e1.department_name != e2.department_name; (same as not like)


-- ------- with department tables being seperate. 

-- Create employees table
CREATE TABLE employees_a (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255)
);

-- Create department_assignments table
CREATE TABLE department_assignments_a (
  assignment_id INT PRIMARY KEY,
  employee_id INT,
  department_id INT,
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Insert data into employees table
INSERT INTO employees_a (employee_id, employee_name)
VALUES
  (1, 'John Doe'),
  (2, 'Jane Doe'),
  (3, 'Bob Smith'),
  (4, 'Alice Brown'),
  (5, 'Mike Davis');

-- Insert data into department_assignments table
INSERT INTO department_assignments_a (assignment_id, employee_id, department_id)
VALUES
  (1, 1, 1),
  (2, 1, 2),
  (3, 2, 1),
  (4, 3, 2),
  (5, 4, 1),
  (6, 4, 3),
  (7, 5, 2),
  (8, 5, 3);

SELECT 
  da1.employee_id,
  e.employee_name,
  da1.department_id AS department_id_1,
  da2.department_id AS department_id_2
FROM 
  department_assignments_a da1
  INNER JOIN employees_a e
  ON da1.employee_id = e.employee_id
  INNER JOIN department_assignments_a da2
  ON da1.employee_id = da2.employee_id
  AND da1.department_id < da2.department_id;

-- ==========================================
-- Find employees who are managers of other employees.
-- Create employees table
CREATE TABLE employees_c (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255),
  manager_id INT,
  FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

-- Insert data into employees table
INSERT INTO employees_c (employee_id, employee_name, manager_id)
VALUES
  (1, 'John Doe', NULL),
  (2, 'Jane Doe', 1),
  (3, 'Bob Smith', 1),
  (4, 'Alice Brown', 2),
  (5, 'Mike Davis', 2),
  (6, 'Emily Taylor', 3),
  (7, 'David Lee', 3);

--  Find employees who are managers of other employees.
SELECT 
e1.employee_name AS e_name,
e2.employee_name AS e_manager
FROM employees_c as e1
JOIN employees_c as e2
ON e1.manager_id = e2.employee_id;


-- Find employees reporting to the same manager.
-- the one below is false
-- SELECT e1.employee_name, e2.employee_name
-- FROM employees_c e1
-- JOIN employees_c e2
-- ON e1.manager_id = e2.employee_id -- //this especially is not correct, see this again properly
-- GROUP BY e2.employee_name;

SELECT 
  e1.employee_name AS Employee1,
  e2.employee_name AS Employee2,
  e1.manager_id AS Common_Manager
FROM employees_c e1
JOIN employees_c e2
ON e1.manager_id = e2.manager_id
where e1.employee_id < e2.employee_id;

-- if there was no where 
SELECT 
*
FROM employees_c e1
JOIN employees_c e2
ON e1.manager_id = e2.manager_id;

-- ====================================================

-- identify duplicates records in the table
-- Create employees table
CREATE TABLE employees_d (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255)
);

-- Insert data into employees table
INSERT INTO employees_d (employee_id, employee_name)
VALUES
  (1, 'John Doe'),
  (2, 'Jane Doe'),
  (3, 'John Doe'),
  (4, 'Bob Smith'),
  (5, 'Jane Doe'),
  (6, 'Alice Brown'),
  (7, 'John Doe');

DROP TABLE employees_d;

-- using group by
SELECT e.employee_name, Count(employee_name)
FROM employees_d e
GROUP BY e.employee_name
HAVING Count(employee_name)>1;

-- making it a subquery and finding all duplicate records of that particular name
SELECT e.employee_id, e.employee_name
FROM employees_d e
WHERE e.employee_name IN(
SELECT e.employee_name
FROM employees_d e
GROUP BY e.employee_name
HAVING Count(employee_name)>1
)
ORDER BY e.employee_name;


SELECT * 
FROM employees_d e1
JOIN employees_d e2 
ON e1.employee_name = e2.employee_name
AND e1.employee_id <e2.employee_id;

DELETE e1
FROM employees_d e1
JOIN employees_d e2 
ON e1.employee_name = e2.employee_name
AND e1.employee_id <e2.employee_id;

-- To delete the duplicate records coming after the 1st record and keep the first original records, you can use the following SQL queries:
-- READ THIS AGAIN LATER


DELETE FROM employees_d
WHERE employee_name NOT IN (
SELECT MIN(e.employee_id)
FROM employees_d e
GROUP BY e.employee_name
);

DELETE e1
FROM employees_d e1
INNER JOIN (
  SELECT employee_name, MIN(employee_id) AS min_id
  FROM employees_d
  GROUP BY employee_name
) e2
ON e1.employee_name = e2.employee_name
AND e1.employee_id > e2.min_id;

select * from employees_d;





