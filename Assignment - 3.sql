
# LAB ASSIGNMENT 3

use assignments;

create table PRODUCT_MASTER (
PRODUCTNO varchar(6), DESCRIPTION varchar(3),
PROFITPERCENT float, UNITMEASURE varchar(10),
QTYONHAND int, REORDERLVL int,
SELLPRICE int, COSTPRICE int);

# Find out the names of all the clients.
SELECT NAME FROM CLIENT_MASTER;

# Retrieve the list of names and cities of all the clients.
SELECT NAME, CITY FROM CLIENT_MASTER;

# List the various products available from the PRODUCT_MASTER table.
SELECT DESCRIPTION FROM PRODUCT_MASTER;

# List all the clients who are located in Bombay.
SELECT * FROM CLIENT_MASTER WHERE CITY = 'Bombay';

# Display the information for client no C00001 and C00002.
SELECT * FROM CLIENT_MASTER WHERE CLIENTNO IN ('C00001', 'C00002');

# Find the products with description as '1.44 Drive' and '1.22 Drive'.
SELECT * FROM PRODUCT_MASTER WHERE DESCRIPTION IN ('1.44 Drive', '1.22 Drive');

# Find all the products whose sell price is greater than 5000.
SELECT * FROM PRODUCT_MASTER WHERE SELLPRICE > 5000;

# Find the list of all clients who stay in city 'Bombay' or city 'Delhi' or 'Madras'.
SELECT * FROM CLIENT_MASTER WHERE CITY IN ('Bombay', 'Delhi', 'Madras');

# Find the product whose selling price is greater than 2000 and less than or equal to 5000.
SELECT * FROM PRODUCT_MASTER WHERE SELLPRICE > 2000 AND SELLPRICE <= 5000;

# List the name, city, and state of clients not in the state of 'Maharashtra'.
SELECT NAME, CITY, STATE FROM CLIENT_MASTER WHERE STATE != 'Maharashtra';

# Change the selling price of '1.44 floppy drive' to Rs. 1150.00.
UPDATE PRODUCT_MASTER SET SELLPRICE = 1150.00 WHERE DESCRIPTION = '1.44 floppy drive';

# Delete the record with client 0001 from the CLIENT_MASTER table.
DELETE FROM CLIENT_MASTER WHERE CLIENTNO = 'C00001';

# Find the products whose selling price is more than 1500 and also find the new selling price as original selling price * 15.
SELECT *, SELLPRICE * 15 AS NEW_SELLPRICE FROM PRODUCT_MASTER WHERE SELLPRICE > 1500;

# Find out the clients who stay in a city whose second letter is 'a'.
SELECT * FROM CLIENT_MASTER WHERE CITY LIKE '_a%';

# Find out the name of all clients having 'a' as the second letter in their names.
SELECT NAME FROM CLIENT_MASTER WHERE NAME LIKE '_a%';

# List the products in sorted order of their description.
SELECT * FROM PRODUCT_MASTER ORDER BY DESCRIPTION;

# Count the total number of products.
SELECT COUNT(*) AS TOTAL_PRODUCTS FROM PRODUCT_MASTER;

# Calculate the average price of all the products.
SELECT AVG(SELLPRICE) AS AVERAGE_PRICE FROM PRODUCT_MASTER;

# Calculate the minimum price of products.
SELECT MIN(SELLPRICE) AS MINIMUM_PRICE FROM PRODUCT_MASTER;

# Determine the maximum and minimum prices. Rename the titles as 'max_price' and 'min_price', respectively.
SELECT MAX(SELLPRICE) AS max_price, MIN(SELLPRICE) AS min_price FROM PRODUCT_MASTER;

# Count the number of products having a price greater than or equal to 1500.
SELECT COUNT(*) AS COUNT_PRODUCT_1500_PLUS FROM PRODUCT_MASTER WHERE SELLPRICE >= 1500;

# Count the number of products having a price greater than or equal to 1500.
SELECT COUNT(*) AS COUNT_PRODUCT_1500_PLUS FROM PRODUCT_MASTER WHERE SELLPRICE >= 1500;

# List the products according to ascending order of their selling price.
SELECT * FROM PRODUCT_MASTER ORDER BY SELLPRICE ASC;

# List the products according to descending order of their selling price.
SELECT * FROM PRODUCT_MASTER ORDER BY SELLPRICE DESC;
