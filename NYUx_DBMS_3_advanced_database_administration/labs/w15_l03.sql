/* Write a script that creates a stored procedure named test. This stored procedure should create a cursor for a result set that consists of the product_name and list_price
columns for each product with a list price that’s greater than $700. The rows in this result set should be sorted in descending sequence by list price. The stored procedure
should accept an OUT  parameter where a message is passed out of the procedure.  Then, the procedure should set the out parameter to a string variable that includes the
product_name and list price for each product so it looks something like this:
*Gibson SG*,*2517.00*|*Gibson Les Paul*,*1199.00*|
Here, each value is enclosed in asterisk(*), each column is separated by a comma (,) and each row is separated by a pipe character (|). */

USE my_guitar_shop;

DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test
(
		OUT message VARCHAR(500)
)
BEGIN
	DECLARE row_not_found TINYINT DEFAULT FALSE;
    DECLARE product_name_var VARCHAR(255);
    DECLARE list_price_var DECIMAL(9, 2);
    DECLARE text_res VARCHAR(2550) DEFAULT '';

	DECLARE products_cursor CURSOR FOR
		SELECT product_name, list_price
		FROM products
		WHERE list_price > 700
		ORDER BY list_price DESC;

	DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = TRUE;

	OPEN products_cursor;

	FETCH products_cursor INTO product_name_var, list_price_var;    
	WHILE (row_not_found = FALSE) DO
        SET text_res = CONCAT(text_res, '*', product_name_var, '*,*', CONVERT(list_price_var, CHAR), '*|');
        FETCH products_cursor INTO product_name_var, list_price_var;
	END WHILE;
	SET message = text_res;
END //
    
DELIMITER ;

CALL test(@message);