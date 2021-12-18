/* Create a view named customer_addresses that shows the shipping and billing addresses for each customer.
- This view should return these columns from the Customers table: customer_id, email_address, last_name and first_name.
- This view should return these columns from the Addresses table: bill_line1, bill_line2, bill_city, bill_state, bill_zip,
ship_line1, ship_line2, ship_city, ship_state, and ship_zip. */

CREATE OR REPLACE VIEW customer_addresses AS
	SELECT
		c.customer_id,
        c.email_address,
        c.first_name,
        c.last_name,
        a1.line1 AS bill_line1,
        a1.line2 AS bill_line2,
        a1.city AS bill_city,
        a1.state AS bill_state,
        a1.zip_code AS bill_zip,
        a2.line1 AS ship_line1,
        a2.line2 AS ship_line2,
        a2.city AS ship_city,
        a2.state AS ship_state,
        a2.zip_code AS ship_zip
	FROM customers AS c
		INNER JOIN addresses AS a1 
			ON c.customer_id  = a1.customer_id
            AND c.shipping_address_id = a1.address_id
		INNER JOIN addresses AS a2
			ON c.customer_id  = a2.customer_id
            AND c.billing_address_id = a2.address_id