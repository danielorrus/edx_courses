/* Write a script that adds an index to the my_guitar_shop database for the last_name and first_name fields in the Customers table.
You can name the index anything you like. */

CREATE INDEX index_customers ON my_guitar_shop.customers (first_name, last_name);