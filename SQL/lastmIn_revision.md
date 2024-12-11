```sql
1. Find the highest-selling product per category and region (geo):
Scenario: You have three tables:

sales: Contains product_id, category_id, region, and quantity_sold.
products: Contains product_id, product_name.
categories: Contains category_id, category_name.


WITH ranked_sales AS (
    SELECT
        s.category_id,
        s.region,
        s.product_id,
        p.product_name,
        c.category_name,
        SUM(s.quantity_sold) AS total_quantity,
        RANK() OVER (PARTITION BY s.category_id, s.region ORDER BY SUM(s.quantity_sold) DESC) AS rnk
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    JOIN categories c ON s.category_id = c.category_id
    GROUP BY s.category_id, s.region, s.product_id, p.product_name, c.category_name
)
SELECT
    category_name,
    region,
    product_name AS highest_selling_product,
    total_quantity
FROM ranked_sales
WHERE rnk = 1;

```

```sql
4. Find products with no sales in the past year:
Scenario: Find products that were not sold in 2023.

 -- THE JOIN PART IS INTERESTING
SELECT
    p.product_name
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id AND s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
WHERE s.product_id IS NULL;

```

```SQL
SIMILAR TO 1 BUT MINOR CHANGE

8. Find the top 3 best-performing regions for each category:
Scenario:
You need to identify the top 3 regions with the highest total sales for each product category.


```

```sql
10. Calculate the month-over-month growth for total sales:
Scenario:
Compute the growth in total sales month-over-month for the current year.

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
```

```sql
11. Find customers who purchased more than 3 different categories in a month:
Scenario:
You have a customers table (customer_id, customer_name) and need to identify customers who purchased from more than 3 different categories in any given month.

WITH customer_category_counts AS (
    SELECT
        c.customer_id,
        DATE_FORMAT(s.sale_date,'%Y-%m') as months,
        COUNT(DISTINCT s.category_id) AS category_count -- using distinct inside count
    FROM sales s
    JOIN customers c ON s.customer_id = c.customer_id
    GROUP BY c.customer_id, DATE_TRUNC('month', s.sale_date)
)
SELECT
    customer_id,
    months,
    category_count
FROM customer_category_counts
WHERE category_count > 3
ORDER BY month, customer_id;

```
