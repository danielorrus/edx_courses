/* Create a view named best_products that uses the same table you used in in exercise 3.
The view should have the same columns returned. The view should only return the five best selling products by order_total. */

USE my_guitar_shop;
/* VISTA CREADA EN LAB 2:
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

/* VISTA CREADA EN LAB 3:
CREATE OR REPLACE VIEW product_summary AS
	SELECT
		product_name,
        COUNT(*) AS order_count,
        SUM(item_total) AS order_total
	FROM order_item_products
    GROUP BY product_name
*/

-- CREATE OR REPLACE VIEW best_products AS
	SELECT *
    FROM product_summary
    ORDER BY order_total DESC LIMIT 5