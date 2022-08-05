/* Write a SELECT statement that returns these columns from the Orders table:
    1. order_id The order_id column
    2. order_date The order_date column
    3. ship_date The ship_date column

Return only the rows where the ship_date column contains a null value.
Sort the result set by the order_id column in descending sequence. */

-- USE my_guitar_shop;
SELECT order_id, order_date, ship_date
FROM orders
	WHERE (ship_date IS NULL)
ORDER BY order_id DESC;