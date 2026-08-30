-- *************************************************************
-- Assignment: Assignment 1
-- Written by: Tiyana Harden
-- Date      : 2026-08-29
-- *************************************************************

USE homework1_tiyana_harden;

-- *******************************************
-- Part 1 Exercise 1
-- *******************************************

SELECT product_code, product_name, list_price, discount_percent
FROM Products
ORDER BY list_price DESC;
 
-- *******************************************
-- Part 1 Exercise 2
-- *******************************************

SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM Customers
WHERE last_name REGEXP '^[M-Z]'
ORDER BY last_name ASC;
 
-- *******************************************
-- Part 1 Exercise 3
-- *******************************************

SELECT product_name, list_price, date_added
FROM Products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

-- *******************************************
-- Part 1 Exercise 4
-- *******************************************

SELECT product_name,
       list_price,
       discount_percent,
       ROUND(list_price * (discount_percent / 100), 2) AS discount_amount,
       ROUND(list_price - (list_price * (discount_percent / 100)), 2) AS discount_price
FROM Products
ORDER BY discount_price DESC
LIMIT 5;

-- *******************************************
-- Part 1 Exercise 5
-- *******************************************

SELECT item_id,
       item_price,
       discount_amount,
       quantity,
       item_price * quantity AS price_total,
       discount_amount * quantity AS discount_total,
       (item_price - discount_amount) * quantity AS item_total
FROM Order_Items
WHERE (item_price - discount_amount) * quantity > 500
ORDER BY item_total DESC;

-- *******************************************
-- Part 1 Exercise 6
-- *******************************************

SELECT order_id, order_date, ship_date
FROM Orders
WHERE ship_date IS NULL;

-- *******************************************
-- Part 1 Exercise 7
-- *******************************************

SELECT CURRENT_DATE AS today_unformatted,
       DATE_FORMAT(CURRENT_DATE, '%d-%b-%Y') AS today_formatted;

-- *******************************************
-- Part 1 Exercise 8
-- *******************************************

SELECT 100 AS price,
       .07 AS tax_rate,
       100 * .07 AS tax_amount,
       100 + (100 * .07) AS total;

USE homework1_tiyana_harden;

-- *******************************************
-- Part 2 Exercise 1
-- *******************************************

SELECT c.category_name, p.product_name, p.list_price
FROM Categories c
JOIN Products p
  ON c.category_id = p.category_id
ORDER BY c.category_name ASC, p.product_name ASC;
 
-- *******************************************
-- Part 2 Exercise 2
-- *******************************************

SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM Customers c
JOIN Addresses a
  ON c.customer_id = a.customer_id
WHERE c.email_address = 'allan.sherwood@yahoo.com';
 
-- *******************************************
-- Part 2 Exercise 3
-- *******************************************

SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM Customers c
JOIN Addresses a
  ON c.shipping_address_id = a.address_id;

-- *******************************************
-- Part 2 Exercise 4
-- *******************************************

SELECT c.last_name,
       c.first_name,
       o.order_date,
       p.product_name,
       oi.item_price,
       oi.discount_amount,
       oi.quantity
FROM Customers c
JOIN Orders o
  ON c.customer_id = o.customer_id
JOIN Order_Items oi
  ON o.order_id = oi.order_id
JOIN Products p
  ON oi.product_id = p.product_id
ORDER BY c.last_name, o.order_date, p.product_name;

-- *******************************************
-- Part 2 Exercise 5
-- *******************************************

SELECT DISTINCT p1.product_name, p1.list_price
FROM Products p1
JOIN Products p2
  ON p1.list_price = p2.list_price
 AND p1.product_id <> p2.product_id
ORDER BY p1.product_name;

-- *******************************************
-- Part 2 Exercise 6
-- *******************************************

SELECT c.category_name, p.product_id
FROM Categories c
LEFT JOIN Products p
  ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

-- *******************************************
-- Part 2 Exercise 7
-- *******************************************

SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM Orders
WHERE ship_date IS NOT NULL

UNION

SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
FROM Orders
WHERE ship_date IS NULL

ORDER BY order_date;