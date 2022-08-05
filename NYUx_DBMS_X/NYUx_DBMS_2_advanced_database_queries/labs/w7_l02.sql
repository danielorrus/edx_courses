/* Write a SELECT statement that returns three columns: email_address, order_id, and the order total for each customer.
To do this, you can group the result set by the email_address and order_id columns. In addition, you must calculate the
order total from the columns in the Order_Items table.

Write a second SELECT statement that uses the first SELECT statement in its FROM clause. The main query should return
three columns: the customer’s email address and the largest order (aliased as max_order_total) and the smallest order_id
(aliased as min_order_id). To do this, you can group the result set by the email_address. Sort the result set by the largest
order in descending sequence. */

/* PRIMER SELECT
SELECT email_address, orders.order_id, SUM((item_price - discount_amount) * quantity) AS order_total
FROM customers JOIN orders
	ON customers.customer_id = orders.customer_id
JOIN order_items
	ON orders.order_id = order_items.order_id
GROUP BY email_address, order_id */

SELECT email_address, MAX(order_total) AS max_order_total, MIN(order_total) AS min_order_id
FROM (
	SELECT email_address, orders.order_id, SUM((item_price - discount_amount) * quantity) AS order_total
	FROM customers JOIN orders
		ON customers.customer_id = orders.customer_id
	JOIN order_items
		ON orders.order_id = order_items.order_id
	GROUP BY email_address, order_id
    ) AS T
GROUP BY email_address
ORDER BY max_order_total DESC

-- SIN TERMINAR