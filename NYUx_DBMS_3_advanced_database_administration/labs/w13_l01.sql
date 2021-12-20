/* Write a script that creates a stored procedure named test. This stored procedure should declare a variable
and set it to the count of all products in the Products table. The procedure should return a 1 row, 1 column result
set with a column named result.  If the count is greater than or equal to 7, the stored procedure should return the value
“The number of products is greater than or equal to 7”.
Otherwise, it should return the value “The number of products is less than 7”. */

USE my_guitar_shop;

DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
	DECLARE product_count INT;
	SELECT COUNT(product_id)
		INTO product_count
	FROM products;
	
    IF product_count > 6 THEN SELECT 'The number of products is greater than or equal to 7' AS result;
    ELSE SELECT 'The number of products is less than 7' AS result;
    END IF;
END //
    
DELIMITER ;

CALL test();