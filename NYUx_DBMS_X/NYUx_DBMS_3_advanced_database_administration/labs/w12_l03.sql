/* Create a view named product_summary that uses the same table you used in in exercise 2. This view should return
summary information about each product.
Each row should include product_name, order_count (the quantity of the product that has been ordered)
and order_total (the total sales revenue for the product). */

USE my_guitar_shop;
/* VISTA CREADA EN LAB ANTERIOR:
CREATE OR REPLACE VIEW order_item_products AS
	SELECT
		o.order_id,
		o.order_date,
        o.tax_amount,
        o.ship_date,
        p.product_name,
        oi.item_price,
        oi.discount_amount,
        (oi.item_price - oi.discount_amount) AS item_total
	FROM orders AS o
		INNER JOIN order_items AS oi 
			ON o.order_id  = oi.order_id
		INNER JOIN products AS p
			ON oi.product_id  = p.product_id */

CREATE OR REPLACE VIEW product_summary AS
	SELECT
		product_name,
        COUNT(*) AS order_count,
        SUM(item_total) AS order_total
	FROM order_item_products
    GROUP BY product_name