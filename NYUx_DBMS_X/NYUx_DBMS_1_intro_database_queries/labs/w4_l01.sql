/* Write a SELECT statement that joins the Categories table to the Products table and
returns these columns: category_name, product_name, list_price.
Sort the result set by the category_name column and then by the product_name column in ascending sequence. */

-- USE my_guitar_shop;
SELECT category_name, product_name, list_price
FROM categories INNER JOIN products
	ON categories.category_id = products.category_id
ORDER BY category_name, product_name;