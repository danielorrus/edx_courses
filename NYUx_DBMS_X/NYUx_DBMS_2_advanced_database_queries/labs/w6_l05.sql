/*
Modify the solution to lab 4 so it only counts and totals line items that have an item_price value that’s greater than 400.
lab4:
Write a SELECT statement that returns one row for each customer that has orders with these columns:
   - The email_address column from the Customers table
   - A count of the number of orders aliased as order_count
   - The total amount for each order aliased as order_total (Hint: First, subtract the discount amount from the price. Then, multiply by the quantity.)

Return only those rows where the customer has more than 1 order.
Sort the result set in descending sequence by the sum of the line item amounts. */

-- USE my_guitar_shop;
SELECT email_address, COUNT(DISTINCT orders.order_id) AS order_count, SUM((item_price - discount_amount) * quantity) AS order_total
FROM customers
	JOIN orders
		ON customers.customer_id = orders.customer_id
	JOIN order_items
		ON orders.order_id = order_items.order_id
WHERE item_price > 400
GROUP BY customers.customer_id
HAVING order_count > 1
ORDER BY order_total DESC;