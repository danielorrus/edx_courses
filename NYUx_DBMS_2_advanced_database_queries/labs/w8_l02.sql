/* Write a SELECT statement that returns these columns from the Products table:

    The date_added column
    A column that uses the CAST function to return the date_added column with its date only (year, month, and day). Name this column added_date
    A column that uses the CAST function to return the date_added column with just the year and the month.  Name this column added_char7
    A column that uses the CAST function to return the date_added column with its full time only (hour, minutes, and seconds). Name this column added_time

Sort the result set by the date_added column in ascending sequence. */

SELECT list_price, FORMAT(list_price, 1) AS price_format, CONVERT(list_price, SIGNED) AS price_convert, CAST(list_price AS SIGNED) AS price_cast
FROM products
ORDER BY list_price ASC