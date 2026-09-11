-- *************************************************************
-- Assignment: Assignment 2
-- Written by: Tiyana Harden
-- Date      : 2026-09-10
-- *************************************************************

USE homework1_tiyana_harden;

-- *******************************************
-- Exercise 1
-- *******************************************

INSERT INTO Categories (category_name)
VALUES ('Brass');

SET @new_category_id = LAST_INSERT_ID();

SELECT category_id, category_name
FROM Categories
WHERE category_id = @new_category_id;
 
-- *******************************************
-- Exercise 2
-- *******************************************

-- NOTE: The assignment text says product_name, but Categories uses category_name.
UPDATE Categories
SET category_name = 'Woodwinds'
WHERE category_id = @new_category_id;

SELECT category_id, category_name
FROM Categories
WHERE category_id = @new_category_id;
 
-- *******************************************
-- Exercise 3
-- *******************************************

DELETE FROM Categories
WHERE category_id = @new_category_id;

SELECT category_id, category_name
FROM Categories
WHERE category_id = @new_category_id;

-- *******************************************
-- Exercise 4
-- *******************************************

INSERT INTO Products
    (category_id, product_code, product_name, description, list_price, discount_percent, date_added)
VALUES
    (4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', 799.99, 0, NOW());

SET @new_product_id = LAST_INSERT_ID();

SELECT product_id, category_id, product_code, product_name, list_price, discount_percent, date_added
FROM Products
WHERE product_id = @new_product_id;

-- *******************************************
-- Exercise 5
-- *******************************************

UPDATE Products
SET discount_percent = 35
WHERE product_id = @new_product_id;

SELECT product_id, product_name, list_price, discount_percent
FROM Products
WHERE product_id = @new_product_id;

-- *******************************************
-- Exercise 6
-- *******************************************

DELETE FROM Products
WHERE category_id = (
    SELECT category_id
    FROM Categories
    WHERE category_name = 'Keyboards'
);

DELETE FROM Categories
WHERE category_name = 'Keyboards';

SELECT category_id, category_name
FROM Categories
WHERE category_name = 'Keyboards';

-- *******************************************
-- Exercise 7
-- *******************************************

INSERT INTO Customers
    (email_address, password, first_name, last_name)
VALUES
    ('rick@raven.com', '', 'Rick', 'Raven');

SELECT customer_id, email_address, password, first_name, last_name
FROM Customers
WHERE email_address = 'rick@raven.com';

-- *******************************************
-- Exercise 8
-- *******************************************

UPDATE Customers
SET password = 'secret'
WHERE email_address = 'rick@raven.com';

SELECT customer_id, email_address, password
FROM Customers
WHERE email_address = 'rick@raven.com';

-- *******************************************
-- Exercise 9
-- *******************************************

UPDATE Customers
SET password = 'reset'
WHERE customer_id > 0
LIMIT 100;

SELECT COUNT(*) AS reset_password_count
FROM Customers
WHERE password = 'reset';

-- *******************************************
-- Exercise 10
-- *******************************************

-- Run this restore script in MySQL after completing Exercises 1-9.
-- Replace the path with your local path to mgs_ex_starts.
-- SOURCE C:/path/to/mgs_ex_starts/create_my_guitar_shop.sql;
