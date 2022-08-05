/* Write a script that creates a stored procedure named insert_category. Code the procedure so that it adds a new row to the
Categories table. To do that, the procedure should have a parameter for the category name. */

USE my_guitar_shop;

DROP PROCEDURE IF EXISTS insert_category;

DELIMITER //

CREATE PROCEDURE insert_category
(
		IN category_name_var VARCHAR(255)
)
BEGIN
	INSERT INTO categories (category_name) VALUES (category_name_var);
END //
    
DELIMITER ;

CALL insert_category('nueva');