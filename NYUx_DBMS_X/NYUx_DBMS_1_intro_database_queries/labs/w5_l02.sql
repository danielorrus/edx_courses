/* Write an UPDATE statement that modifies the drums category in the Categories table. This statement should
change the category_name column to “Woodwinds”, and it should use the category_id to identify the row. */

-- USE my_guitar_shop;
UPDATE categories
SET category_name = 'Woodwinds'
WHERE category_id IN
      (SELECT * FROM
      (SELECT category_id FROM categories WHERE category_name = 'Drums') AS t);
       
-- UPDATE table SET a=value WHERE x IN
--    (SELECT * FROM (SELECT x FROM table WHERE condition) as t)