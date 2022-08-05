/* Write an UPDATE statement that modifies the 'Fender Stratocaster' product.
This statement should change the discount_percent column from 30% to 35%. */

-- USE my_guitar_shop;
UPDATE products
SET discount_percent = 35
	WHERE product_name =  'Fender Stratocaster';