-- Exercise 3
SELECT product_name, list_price, date_added
FROM Products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC;

-- Exercise 4
SELECT product_name,
	   list_price,
	   discount_percent,
	   ROUND(list_price * (discount_percent / 100), 2) AS discount_amount,
	   ROUND(list_price - (list_price * (discount_percent / 100)), 2) AS discount_price
FROM Products
ORDER BY discount_price DESC
LIMIT 5;
