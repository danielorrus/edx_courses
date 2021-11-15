/* Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables.
This statement should return these columns: last_name, first_name, order_date, product_name,
item_price, discount_amount, and quantity.
Use aliases for the tables.
Sort the final result set by the last_name, order_date, and product_name columns. */

-- USE my_guitar_shop;
SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM customers c
	INNER JOIN orders o
		ON c.customer_id = o.customer_id
	INNER JOIN order_items oi
		ON o.order_id = oi.order_id
	INNER JOIN products p
		ON oi.product_id = p.product_id
-- WHERE customers.shipping_address_id = addresses.address_id
ORDER BY last_name, order_date, product_name ASC;