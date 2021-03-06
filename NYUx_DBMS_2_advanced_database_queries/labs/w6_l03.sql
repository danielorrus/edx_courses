/* Write a SELECT statement that returns one row for each customer that has orders with these columns:
   - The email_address column from the Customers table
   - The sum of the item price in the Order_Items table multiplied by the quantity in the Order_Items table aliased as item_price_total
   - The sum of the discount amount column in the Order_Items table multiplied by the quantity in the Order_Items table aliased as discount_amount_total

Sort the result set in descending sequence by the item price total for each customer. */

-- USE my_guitar_shop;
SELECT email_address, SUM(item_price * quantity) AS item_price_total, SUM(discount_amount * quantity) AS discount_amount_total
FROM customers
	JOIN orders
		ON customers.customer_id = orders.customer_id
	JOIN order_items
		ON orders.order_id = order_items.order_id
GROUP BY email_address -- , item_price_total, discount_amount_total
HAVING count(*) > 0
ORDER BY item_price_total DESC;