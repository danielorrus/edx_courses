/* Create a view named order_item_products that returns columns from the Orders, Order_Items, and Products tables.
- This view should return these columns from the Orders table: order_id, order_date, tax_amount, and ship_date.
- This view should return the product_name column from the Products table.
- This view should return these columns from the Order_Items table: item_price, discount_amount, final_price
	(the discount amount subtracted from the item price), quantity, and item_total
    (the calculated total for the item - quantity * price). */

-- CREATE OR REPLACE VIEW order_item_products AS
	SELECT
		o.order_id,
		o.order_date,
        o.tax_amount,
        o.ship_date,
        p.product_name,
        oi.item_price,
        oi.discount_amount,
        oi.item_price - oi.discount_amount AS item_total
	FROM orders AS o
		INNER JOIN order_items AS oi 
			ON o.customer_id  = a1.customer_id
            AND c.shipping_address_id = a1.address_id
		INNER JOIN products AS p
			ON c.customer_id  = a2.customer_id
            AND c.billing_address_id = a2.address_id