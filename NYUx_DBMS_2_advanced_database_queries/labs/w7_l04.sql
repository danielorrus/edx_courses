/* Use a correlated subquery to return one row per customer, representing the customer’s
oldest order (the one with the earliest date). Each row should include these three columns:
email_address, oldest_order_id, and oldest_order_date. Only include customers who have placed an order.
Sort the result set by the oldest_order_date and oldest_order_id columns. */

SELECT email_address, order_id AS oldest_order_id, order_date AS oldest_order_date
FROM customers AS T NATURAL JOIN orders
WHERE order_date = 
  (SELECT min(order_date)
  FROM orders AS S
  WHERE T.customer_id = S.customer_id
)