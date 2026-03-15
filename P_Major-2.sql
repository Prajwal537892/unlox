-- =====================================================
-- MySQL Major Assessment
-- Dataset: Instacart Online Grocery Basket Analysis
-- Student Name: Prajwal Agasimundin 
-- Description:
-- This SQL script performs data analysis on grocery
-- order data using JOINs, aggregations, filtering,
-- and grouping techniques.
-- =====================================================


-- =====================================================
-- Select Database
-- =====================================================

USE instacart_analysis;

SHOW tables;

-- =====================================================
-- SECTION A : BASIC SQL OPERATIONS
-- =====================================================


-- 1. Create backup table for products
CREATE TABLE product_backup LIKE products;


-- 2. Insert manual records into product_backup
INSERT INTO product_backup (product_id, product_name, aisle_id, department_id)
VALUES
(90001,'Sample Organic Juice',1,1),
(90002,'Healthy Snack Mix',2,3),
(90003,'Natural Energy Bar',4,5);


-- 3. Update product names for department 1
SET SQL_SAFE_UPDATES = 0;
UPDATE products
SET product_name = CONCAT(product_name,'_new')
WHERE department_id = 1;


-- 4. Delete products with product_id greater than 50000
DELETE FROM products
WHERE product_id > 50000;


-- 5. Orders placed between day 1 and 3
SELECT *
FROM orders
WHERE order_dow BETWEEN 1 AND 3
ORDER BY order_dow;


-- 6. Products starting with letter A
SELECT *
FROM products
WHERE product_name LIKE 'A%'
ORDER BY product_name;


-- 7. Orders not placed during early hours
SELECT *
FROM orders
WHERE order_hour_of_day NOT IN (0,1,2,3)
ORDER BY order_hour_of_day;


-- 8. Top 15 products based on product_id
SELECT *
FROM products
ORDER BY product_id DESC
LIMIT 15;


-- 9. Aggregate statistics for order hour
SELECT
MIN(order_hour_of_day) AS Minimum_Order_Hour,
MAX(order_hour_of_day) AS Maximum_Order_Hour,
AVG(order_hour_of_day) AS Average_Order_Hour,
COUNT(order_id) AS Total_Orders,
SUM(days_since_prior_order) AS Total_Days_Between_Orders
FROM orders;


-- 10. Orders where days_since_prior_order between 5 and 10
SELECT *
FROM orders
WHERE days_since_prior_order BETWEEN 5 AND 10
ORDER BY days_since_prior_order;



-- =====================================================
-- SECTION B : GROUP BY AND AGGREGATION
-- =====================================================


-- 11. Total number of products in each department
SELECT
department_id,
COUNT(product_id) AS Total_Products
FROM products
GROUP BY department_id
ORDER BY Total_Products DESC;


-- 12. Number of products in each aisle
SELECT
aisle_id,
COUNT(product_id) AS Product_Count
FROM products
GROUP BY aisle_id
ORDER BY Product_Count DESC;


-- 13. Total orders per user
SELECT
user_id,
COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY user_id
ORDER BY Total_Orders DESC;


-- 14. Departments having more than 500 products
SELECT
department_id,
COUNT(product_id) AS Product_Count
FROM products
GROUP BY department_id
HAVING COUNT(product_id) > 500
ORDER BY Product_Count DESC;


-- 15. Average days_since_prior_order grouped by user
SELECT
user_id,
AVG(days_since_prior_order) AS Average_Days_Between_Orders
FROM orders
GROUP BY user_id
ORDER BY Average_Days_Between_Orders DESC;


-- 16. Total reordered items per product
SELECT
product_id,
SUM(reordered) AS Total_Reordered_Items
FROM order_products__train
GROUP BY product_id
ORDER BY Total_Reordered_Items DESC;


-- 17. Departments where product count greater than 1000
SELECT
department_id,
COUNT(product_id) AS Product_Total
FROM products
GROUP BY department_id
HAVING COUNT(product_id) > 1000
ORDER BY Product_Total DESC;



-- =====================================================
-- SECTION C : JOIN OPERATIONS
-- =====================================================


-- 18. Product name, aisle name, department name
SELECT
p.product_name,
a.aisle,
d.department
FROM products p
JOIN aisles a
ON p.aisle_id = a.aisle_id
JOIN departments d
ON p.department_id = d.department_id
ORDER BY p.product_name;


-- 19. Order ID, User ID, Product Name
SELECT
o.order_id,
o.user_id,
p.product_name
FROM orders o
JOIN order_products__train op
ON o.order_id = op.order_id
JOIN products p
ON op.product_id = p.product_id
ORDER BY o.order_id;


-- 20. Department name and total products
SELECT
d.department,
COUNT(p.product_id) AS Total_Products
FROM departments d
JOIN products p
ON d.department_id = p.department_id
GROUP BY d.department
ORDER BY Total_Products DESC;


-- 21. Show all aisles even if no products exist
SELECT
a.aisle,
p.product_name
FROM aisles a
LEFT JOIN products p
ON a.aisle_id = p.aisle_id
ORDER BY a.aisle;


-- 22. User and total products purchased
SELECT
o.user_id,
COUNT(op.product_id) AS Products_Purchased
FROM orders o
JOIN order_products__train op
ON o.order_id = op.order_id
GROUP BY o.user_id
ORDER BY Products_Purchased DESC;



-- =====================================================
-- SECTION D : BUSINESS INSIGHT ANALYSIS
-- =====================================================


-- 23. Department and total products ordered
SELECT
d.department,
COUNT(op.product_id) AS Total_Products_Ordered
FROM order_products__train op
JOIN products p
ON op.product_id = p.product_id
JOIN departments d
ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY Total_Products_Ordered DESC;


-- 24. Top 5 most ordered products
SELECT
p.product_name,
COUNT(op.product_id) AS Total_Orders
FROM order_products__train op
JOIN products p
ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Orders DESC
LIMIT 5;


-- 25. Department and total reordered products
SELECT
d.department,
SUM(op.reordered) AS Reordered_Items
FROM order_products__train op
JOIN products p
ON op.product_id = p.product_id
JOIN departments d
ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY Reordered_Items DESC;


-- 26. Aisle name and distinct products ordered
SELECT
a.aisle,
COUNT(DISTINCT op.product_id) AS Distinct_Products_Ordered
FROM order_products__train op
JOIN products p
ON op.product_id = p.product_id
JOIN aisles a
ON p.aisle_id = a.aisle_id
GROUP BY a.aisle
ORDER BY Distinct_Products_Ordered DESC;


-- 27. User and total reordered items
SELECT
o.user_id,
SUM(op.reordered) AS Total_Reorders
FROM orders o
JOIN order_products__train op
ON o.order_id = op.order_id
GROUP BY o.user_id
ORDER BY Total_Reorders DESC;


-- 28. Department and average number of products added per order
SELECT
d.department,
AVG(op.add_to_cart_order) AS Avg_Products_Per_Order
FROM order_products__train op
JOIN products p
ON op.product_id = p.product_id
JOIN departments d
ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY Avg_Products_Per_Order DESC;


-- 29. Busiest hour of the day
SELECT
order_hour_of_day,
COUNT(order_id) AS Total_Orders
FROM orders
GROUP BY order_hour_of_day
ORDER BY Total_Orders DESC
LIMIT 1;


-- 30. Department orders during weekend
SELECT
d.department,
COUNT(op.product_id) AS Weekend_Orders
FROM orders o
JOIN order_products__train op
ON o.order_id = op.order_id
JOIN products p
ON op.product_id = p.product_id
JOIN departments d
ON p.department_id = d.department_id
WHERE o.order_dow IN (0,6)
GROUP BY d.department
ORDER BY Weekend_Orders DESC;


-- 31. User and number of unique products purchased
SELECT
o.user_id,
COUNT(DISTINCT op.product_id) AS Unique_Products
FROM orders o
JOIN order_products__train op
ON o.order_id = op.order_id
GROUP BY o.user_id
ORDER BY Unique_Products DESC;


-- 32. Top 3 departments with maximum reordered items
SELECT
d.department,
SUM(op.reordered) AS Total_Reorders
FROM order_products__train op
JOIN products p
ON op.product_id = p.product_id
JOIN departments d
ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY Total_Reorders DESC
LIMIT 3;