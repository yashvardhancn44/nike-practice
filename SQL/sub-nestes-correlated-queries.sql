create DATABASE subqnestqcorrqdb;
USE subqnestqcorrqdb;


-- Subquery: A query within another query that is executed independently.
-- Nested Subquery: A subquery inside another subquery or query.
-- Correlated Subquery: A subquery that references columns from the outer query and is executed repeatedly for each row of the outer query.

-- ## Subqueries

-- 1. Find employees earning more than the average salary of all employees.
-- Create employees table
CREATE TABLE employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255),
  salary DECIMAL(10, 2)
);

-- Insert data into employees table
INSERT INTO employees (employee_id, employee_name, salary)
VALUES
  (1, 'John Doe', 50000.00),
  (2, 'Jane Smith', 60000.00),
  (3, 'Bob Johnson', 70000.00),
  (4, 'Alice Brown', 40000.00),
  (5, 'Mike Davis', 55000.00),
  (6, 'Emily Taylor', 65000.00),
  (7, 'David Lee', 45000.00),
  (8, 'Sophia Patel', 58000.00),
  (9, 'Olivia Martin', 62000.00),
  (10, 'Michael White', 48000.00);

# select *
# from employees
# where salary > avg(salary); -- this is wrong cant do it like this -> hence sub query

select  * 
from employees
where salary > (select AVG(salary) from employees);




-- ============ 2. Retrieve the names of customers who placed an order in the last 30 days.
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
  (2, 'Jane Smith'),
  (3, 'Bob Johnson'),
  (4, 'Alice Brown'),
  (5, 'Mike Davis');

-- Insert data into orders table
INSERT INTO orders (order_id, customer_id, order_date)
VALUES
  (1, 1, '2024-11-15'),
  (2, 2, '2024-11-20'),
  (3, 3, '2024-12-01'),
  (4, 4, '2024-12-05'),
  (5, 5, '2024-12-08'),
  (6, 1, '2024-12-09'),
  (7, 2, '2024-11-10'),
  (8, 3, '2024-11-25'),
  (9, 4, '2024-12-02'),
  (10, 5, '2024-12-06');

select customer_name
from customers
where customer_id in (select distinct customer_id
from orders
where order_date > DATE_SUB(current_date(),INTERVAL 30 DAY));

-- ========= 3. List products with a price higher than the average price of their category.
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
  price DECIMAL(10, 2),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Insert data into categories table
INSERT INTO categories (category_id, category_name)
VALUES
  (1, 'Electronics'),
  (2, 'Fashion'),
  (3, 'Home Goods'),
  (4, 'Sports'),
  (5, 'Toys');

-- Insert data into products table
INSERT INTO products (product_id, product_name, category_id, price)
VALUES
  (1, 'Smartphone', 1, 800.00),
  (2, 'Laptop', 1, 1200.00),
  (3, 'TV', 1, 1000.00),
  (4, 'Dress', 2, 50.00),
  (5, 'Shirt', 2, 30.00),
  (6, 'Pants', 2, 40.00),
  (7, 'Sofa', 3, 500.00),
  (8, 'Chair', 3, 100.00),
  (9, 'Table', 3, 200.00),
  (10, 'Basketball', 4, 20.00),
  (11, 'Football', 4, 30.00),
  (12, 'Toy Car', 5, 10.00);





-- ## Nested Subqueries
-- 4. Find the department name with the highest average salary.
drop table departments_a;
drop table employees_a;

-- Create departments table
CREATE TABLE departments_a (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(255)
);

-- Create employees table
CREATE TABLE employees_a (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255),
  department_id INT,
  salary DECIMAL(10, 2),
  FOREIGN KEY (department_id) REFERENCES departments_a(department_id)
);

-- Insert data into departments table
INSERT INTO departments_a (department_id, department_name)
VALUES
  (1, 'Sales'),
  (2, 'Marketing'),
  (3, 'IT'),
  (4, 'Finance'),
  (5, 'HR');

-- Insert data into employees table
INSERT INTO employees_a (employee_id, employee_name, department_id, salary)
VALUES
  (1, 'John Doe', 1, 50000.00),
  (2, 'Jane Smith', 1, 60000.00),
  (3, 'Bob Johnson', 2, 70000.00),
  (4, 'Alice Brown', 3, 80000.00),
  (5, 'Mike Davis', 4, 90000.00),
  (6, 'Emily Taylor', 5, 40000.00),
  (7, 'David Lee', 1, 55000.00),
  (8, 'Sophia Patel', 2, 65000.00),
  (9, 'Olivia Martin', 3, 75000.00),
  (10, 'Michael White', 4, 85000.00);
  
  select department_name
  from departments_a
  where department_id IN
  (select department_id
  from employees_a
  where salary>(select avg(salary) from employees_a));

-- ================= 5. Retrieve the names of customers who ordered the most expensive product.
CREATE TABLE customers_b (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(255)
);

-- Create orders table
CREATE TABLE orders_b (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers_b(customer_id)
);

-- Create products table
CREATE TABLE products_b (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  price DECIMAL(10, 2)
);

-- Insert data into customers table
INSERT INTO customers_b (customer_id, customer_name)
VALUES
  (1, 'John Doe'),
  (2, 'Jane Smith'),
  (3, 'Bob Johnson'),
  (4, 'Alice Brown'),
  (5, 'Mike Davis');

-- Insert data into orders table
INSERT INTO orders_b (order_id, customer_id, product_id)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5),
  (6, 1, 5),
  (7, 2, 1),
  (8, 3, 2),
  (9, 4, 3),
  (10, 5, 4);

-- Insert data into products table
INSERT INTO products_b (product_id, product_name, price)
VALUES
  (1, 'Product A', 100.00),
  (2, 'Product B', 200.00),
  (3, 'Product C', 300.00),
  (4, 'Product D', 400.00),
  (5, 'Product E', 500.00);

DESCRIBE products_b;
Describe orders_b;
Describe customers_b;

select customer_name
from customers_b 
where customer_id IN (
select customer_id 
from orders_b where
product_id = (select product_id 
from products_b 
order by price
limit 1));

-- ## Correlated Subqueries
-- 6. Find employees whose salary is above the average salary of their department.
-- This correlated subquery is a powerful tool to compare each row in the employees table with the average salary of their respective department.


-- Create departments table
CREATE TABLE departments_c (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(255)
);

-- Create employees table
CREATE TABLE employees_c (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255),
  salary DECIMAL(10, 2),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments_c(department_id)
);

-- Insert data into departments table
INSERT INTO departments_c (department_id, department_name)
VALUES
  (1, 'Sales'),
  (2, 'Marketing'),
  (3, 'IT'),
  (4, 'Finance'),
  (5, 'HR');

-- Insert data into employees table
INSERT INTO employees_c (employee_id, employee_name, salary, department_id)
VALUES
  (1, 'John Doe', 50000.00, 1),
  (2, 'Jane Smith', 60000.00, 1),
  (3, 'Bob Johnson', 70000.00, 2),
  (4, 'Alice Brown', 80000.00, 3),
  (5, 'Mike Davis', 90000.00, 4),
  (6, 'Emily Taylor', 40000.00, 5),
  (7, 'David Lee', 55000.00, 1),
  (8, 'Sophia Patel', 65000.00, 2),
  (9, 'Olivia Martin', 75000.00, 3),
  (10, 'Michael White', 85000.00, 4);

select * 
from employees_c e1
where salary > (
select avg(salary)
from employees_c e2
where department_id = e1.department_id);


select department_id
from employees_c
where department_id In(select department_id, avg(salary)
from employees_c
group by department_id;

-- using join
SELECT 
  e1.employee_id, 
  e1.employee_name, 
  e1.salary, 
  e1.department_id
FROM 
  employees e1
  JOIN (
    SELECT 
      department_id, 
      AVG(salary) AS avg_salary
    FROM 
      employees
    GROUP BY 
      department_id
  ) e2
  ON e1.department_id = e2.department_id
WHERE 
  e1.salary > e2.avg_salary;
  
  
  -- using window function
  SELECT 
  employee_id, 
  employee_name, 
  salary, 
  department_id
FROM (
  SELECT 
    employee_id, 
    employee_name, 
    salary, 
    department_id,
    AVG(salary) OVER (PARTITION BY department_id) AS avg_salary
  FROM 
    employees
) e
WHERE 
  salary > avg_salary;




-- 7. List products with sales higher than the average sales of all products.


-- 8. Identify departments where at least one employee has a salary greater than $100,000.
-- Create departments table
CREATE TABLE departments_d (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(255)
);

-- Create employees table
CREATE TABLE employees_d (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(255),
  salary DECIMAL(10, 2),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments_d(department_id)
);

-- Insert data into departments table
INSERT INTO departments_d (department_id, department_name)
VALUES
  (1, 'Sales'),
  (2, 'Marketing'),
  (3, 'IT'),
  (4, 'Finance'),
  (5, 'HR');

-- Insert data into employees table
INSERT INTO employees_d (employee_id, employee_name, salary, department_id)
VALUES
  (1, 'John Doe', 50000.00, 1),
  (2, 'Jane Smith', 60000.00, 1),
  (3, 'Bob Johnson', 120000.00, 2),
  (4, 'Alice Brown', 150000.00, 3),
  (5, 'Mike Davis', 90000.00, 4),
  (6, 'Emily Taylor', 40000.00, 5),
  (7, 'David Lee', 55000.00, 1),
  (8, 'Sophia Patel', 130000.00, 2),
  (9, 'Olivia Martin', 160000.00, 3),
  (10, 'Michael White', 100000.00, 4);

select department_id, department_name
from departments_d d
where exists(
select 1
from employees_d e
where e.department_id = d.department_id
and e.salary> 100000);


select Distinct department_name
from departments_d d
INNER JOIN (select employee_id, department_id
from employees_d
where salary>100000) resultTable
ON d.department_id = resultTable.department_id;


-- YOU DONT USE WORDS LIKE DISTINT MUCH. (USE THEM WHENEVER REQUIRED)


