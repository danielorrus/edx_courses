/* Write an ALTER TABLE statement that adds two new columns to the Products table in the my_guitar_shop database.

- Add one column for product price named “product_price” that provides for three digits to the left of the decimal
	point and two to the right. This column should have a default value of 9.99.
- Add one column for the date and time named "new_date_added" that the product was added to the database. */

ALTER TABLE my_guitar_shop.products
	ADD product_price DECIMAL(5,2) DEFAULT 9.99,
	ADD new_date_added DATETIME;