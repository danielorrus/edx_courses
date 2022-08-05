/* Write a SELECT statement that returns one row for each category that has products with these columns:
   - The category_name column from the Categories table
   - The count of the products in the Products table aliased as product_count
   - The list price of the most expensive product in the Products table aliased as most_expensive_product

Sort the result set so the category with the most products appears first. */

-- USE my_guitar_shop;
SELECT category_name, count(*) AS product_count, MAX(list_price) AS most_expensive_product
FROM categories JOIN products
	ON categories.category_id = products.category_id
GROUP BY category_name
HAVING count(*) > 0
ORDER BY most_expensive_product DESC;