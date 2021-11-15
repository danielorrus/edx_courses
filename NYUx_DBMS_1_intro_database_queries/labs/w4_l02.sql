/* Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns:
first_name, last_name, line1, city, state, zip_code.
Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com
Sort the result set by the zip_code column in ascending sequence. */

-- USE my_guitar_shop;
SELECT first_name, last_name, city, state, zip_code
FROM customers INNER JOIN addresses
	ON customers.customer_id = addresses.customer_id
WHERE customers.email_address = 'allan.sherwood@yahoo.com'
ORDER BY zip_code ASC;