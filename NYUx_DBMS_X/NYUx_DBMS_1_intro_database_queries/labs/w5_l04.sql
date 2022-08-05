/* Write an INSERT statement that adds this row to the Products table:

    - product_id: The next automatically generated ID 
    - category_id: 4
    - product_code: dgx_640
    - product_name: Yamaha DGX 640 88-Key Digital Piano
    - description: Long description to come.
    - list_price: 799.99
    - discount_percent: 0
    - date_added: Today’s date/time.

Use a column list for this statement. */

-- USE my_guitar_shop;
INSERT INTO products
	(category_id, product_code, product_name, description,
    list_price, discount_percent, date_added)
VALUES
	(3, 'dgx_460', 'Yamaha DGX 640 88-Key Digital Piano',
    'Long description to come', 799.99, 0, '2021-11-20 11:12:59');