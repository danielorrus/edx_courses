/* Write a SELECT statement that returns the name, list_price and discount percent of each product that has
a unique discount percent. In other words, don’t include products that have the same discount percent as another product.
Sort the result set by the product_name column. */

SELECT product_name, list_price, products.discount_percent
FROM products JOIN
	(SELECT discount_percent
    FROM products
    GROUP BY discount_percent
    HAVING COUNT(1) = 1) AS aux
	ON products.discount_percent = aux.discount_percent
ORDER BY product_name