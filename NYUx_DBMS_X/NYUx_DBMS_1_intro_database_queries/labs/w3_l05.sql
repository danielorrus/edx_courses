/* Write a SELECT statement that returns these column names and data from the Order_Items table:
    1. item_id 
    2. item_price The item_price column
    3. discount_amount The discount_amount column
    4. quantity The quantity column
    5. price_total A column that’s calculated by multiplying the item price by the quantity
    6. discount_total A column that’s calculated by multiplying the discount amount by the quantity
    7. item_total A column that’s calculated by subtracting the discount amount from the item price and then multiplying by the quantity

Only return rows where the item_total is greater than 500.
Sort the result set by the item_total column in descending sequence. */

-- USE my_guitar_shop;
SELECT item_id, item_price, discount_amount, quantity, item_price * quantity AS price_total,
	discount_amount * quantity AS discount_total, (item_price - discount_amount) * quantity AS item_total
FROM order_items
	HAVING (item_total > 500)
ORDER BY item_total DESC;