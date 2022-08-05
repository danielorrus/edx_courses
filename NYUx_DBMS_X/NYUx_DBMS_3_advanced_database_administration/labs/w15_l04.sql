/* Write a script that creates a stored function named discount_price that calculates the discount price of an
item in the Order_Items table (discount amount subtracted from item price). To do that, this function should accept
one parameter for the item ID, and it should return the value of the discount price for that item. */

USE my_guitar_shop;

DROP FUNCTION IF EXISTS discount_price;

DELIMITER //

CREATE FUNCTION discount_price
(
   item_id_param INT
)

RETURNS DECIMAL(9,2)
DETERMINISTIC READS SQL DATA

BEGIN
  DECLARE discount_price_var DECIMAL(9,2);
  
  SELECT item_price - discount_amount
  FROM order_items
  WHERE item_id = item_id_param
  INTO discount_price_var;
  
  RETURN discount_price_var;
END //

DELIMITER ;