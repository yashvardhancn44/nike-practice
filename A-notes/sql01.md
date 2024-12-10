Let's explore all the SQL concepts using small sample data and provide the corresponding results.

---

### **1. Types of Joins**

#### Sample Tables:

**Customers Table**  
| customer_id | customer_name |  
|-------------|----------------|  
| 1 | Alice |  
| 2 | Bob |  
| 3 | Charlie |

**Orders Table**  
| order_id | customer_id | order_amount |  
|----------|-------------|--------------|  
| 101 | 1 | 500 |  
| 102 | 2 | 1000 |  
| 103 | 4 | 1500 |

---

#### **1.1 Cross Join**

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
CROSS JOIN orders;
```

**Result:** (Cartesian product of both tables)  
| customer_name | order_id |  
|---------------|----------|  
| Alice | 101 |  
| Alice | 102 |  
| Alice | 103 |  
| Bob | 101 |  
| Bob | 102 |  
| Bob | 103 |  
| Charlie | 101 |  
| Charlie | 102 |  
| Charlie | 103 |

---

#### **1.2 Inner Join**

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
```

**Result:** (Only matching rows)  
| customer_name | order_id |  
|---------------|----------|  
| Alice | 101 |  
| Bob | 102 |

---

#### **1.3 Left Join**

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;
```

**Result:** (All customers, with `NULL` for unmatched orders)  
| customer_name | order_id |  
|---------------|----------|  
| Alice | 101 |  
| Bob | 102 |  
| Charlie | NULL |

---

#### **1.4 Right Join**

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;
```

**Result:** (All orders, with `NULL` for unmatched customers)  
| customer_name | order_id |  
|---------------|----------|  
| Alice | 101 |  
| Bob | 102 |  
| NULL | 103 |

---

#### **1.5 Full Outer Join**

```sql
SELECT customers.customer_name, orders.order_id
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;
```

**Result:** (All rows from both tables)  
| customer_name | order_id |  
|---------------|----------|  
| Alice | 101 |  
| Bob | 102 |  
| Charlie | NULL |  
| NULL | 103 |

---

### **2. WHERE Clause and ORDER BY Clause**

#### **2.1 WHERE Clause**

```sql
SELECT order_id, order_amount
FROM orders
WHERE order_amount > 500;
```

**Result:**  
| order_id | order_amount |  
|----------|--------------|  
| 102 | 1000 |  
| 103 | 1500 |

---

#### **2.2 ORDER BY Clause**

```sql
SELECT order_id, order_amount
FROM orders
ORDER BY order_amount DESC;
```

**Result:**  
| order_id | order_amount |  
|----------|--------------|  
| 103 | 1500 |  
| 102 | 1000 |  
| 101 | 500 |

---

### **3. GROUP BY and HAVING**

#### **GROUP BY with HAVING**

```sql
SELECT customer_id, SUM(order_amount) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(order_amount) > 500;
```

**Result:**  
| customer_id | total_sales |  
|-------------|-------------|  
| 2 | 1000 |  
| 4 | 1500 |

---

### **4. CASE WHEN Statement**

#### **Categorize Orders**

```sql
SELECT order_id, order_amount,
       CASE
           WHEN order_amount > 1000 THEN 'High'
           WHEN order_amount BETWEEN 500 AND 1000 THEN 'Medium'
           ELSE 'Low'
       END AS order_category
FROM orders;
```

**Result:**  
| order_id | order_amount | order_category |  
|----------|--------------|----------------|  
| 101 | 500 | Medium |  
| 102 | 1000 | Medium |  
| 103 | 1500 | High |

---

### **5. CASE WHEN with GROUP BY**

#### **Group Orders by Category**

```sql
SELECT
    CASE
        WHEN order_amount > 1000 THEN 'High'
        WHEN order_amount BETWEEN 500 AND 1000 THEN 'Medium'
        ELSE 'Low'
    END AS order_category,
    COUNT(*) AS total_orders
FROM orders
GROUP BY
    CASE
        WHEN order_amount > 1000 THEN 'High'
        WHEN order_amount BETWEEN 500 AND 1000 THEN 'Medium'
        ELSE 'Low'
    END;
```

**Result:**  
| order_category | total_orders |  
|----------------|--------------|  
| Medium | 2 |  
| High | 1 |

---

This setup provides sample data, the query, and expected results for each SQL concept. You can use these examples to practice and expand your understanding. Let me know if you'd like to add more complexity or additional scenarios!
