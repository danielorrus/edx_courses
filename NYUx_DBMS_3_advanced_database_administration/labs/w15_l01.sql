/* Write a script that creates a stored procedure named test. This stored procedure should declare a variable and set it to the count of all
products in the Products table. The stored procedure should accept an OUT  parameter where a message is passed out of the procedure.  If the count
is greater than or equal to 7, the stored procedure should return the value “The number of products is greater than or equal to 7”. Otherwise, it should
return the value “The number of products is less than 7”. */

USE my_guitar_shop;

DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test
(
		OUT message VARCHAR(60)
)
BEGIN
	DECLARE contador INT DEFAULT 0;
    SET contador = (SELECT COUNT(*) FROM products);
    IF contador > 6 THEN
		SET message = "The number of products is greater than or equal to 7";
    ELSE
		SET message = "The number of products is less than 7";
	END IF;
END //
    
DELIMITER ;

CALL test(@message);