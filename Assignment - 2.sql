
# LAB ASSIGNMENT 2

use assignments;

# Create table Client_Master:
create table CLIENT_MASTER (
	CLIENTNO varchar(20) unique not null, NAME varchar(30),	
    CITY varchar(30), PINCODE int, STATE varchar(20), BALDUE int);


# Insert the following data into CLIENT_MASTER table:
INSERT INTO Client_Master(CLIENTNO, NAME, CITY, PINCODE, STATE, BALDUE)
VALUES
('C00001', 'Ivan Bayross', 'Mumbai', '400054', 'Maharashtra', 15000),
('C00002', 'Mamta Mazumdar', 'Madras', '780001', 'Tamil Nadu', 0),
('C00003', 'Chhaya Bankar', 'Mumbai', '400057', 'Maharashtra', 5000),
('C00004', 'Ashwini Joshi', 'Bangalore', '560001', 'Karnataka', 0),
('C00005', 'Hansel Colaco', 'Mumbai', '400060', 'Maharashtra', 2000),
('C00006', 'Deepak Sharma', 'Mangalore', '560050', 'Karnataka', 0);

# Exercise on retrieving records from the table:

# a. Display the names of all the clients.
SELECT NAME FROM CLIENT_MASTER;

# b. Retrieve the entire contents of the CLIENT_MASTER table.
SELECT * FROM CLIENT_MASTER;

# c. Retrieve the list of names, city, and the state of all the clients.
SELECT NAME, CITY, STATE FROM CLIENT_MASTER;

# d. List all the clients who are located in Mumbai.
SELECT * FROM CLIENT_MASTER WHERE CITY = 'Mumbai';

# e. Find the names of clients who carry a balance of 15,000/-.
SELECT NAME FROM CLIENT_MASTER WHERE BALDUE = 15000;

# f. List the details of the clients whose name starts with 'M'.
SELECT * FROM CLIENT_MASTER WHERE NAME LIKE 'M%';

# g. List the details of clients who are staying in either Maharashtra or in Karnataka.
SELECT * FROM CLIENT_MASTER WHERE STATE IN ('Maharashtra', 'Karnataka');


# Exercise on updating records in a table:

# a. Change the city of clientno 'C00005' to Bangalore.
UPDATE CLIENT_MASTER SET CITY = 'Bangalore' WHERE CLIENTNO = 'C00005';

# b. Change the balance due of clientno 'C00001' to Rs. 1000.
UPDATE CLIENT_MASTER SET BALDUE = 1000 WHERE CLIENTNO = 'C00001';

# c. Change the city of the client whose number is 'C00006' to Pune.
UPDATE CLIENT_MASTER SET CITY = 'Pune' WHERE CLIENTNO = 'C00006';

# d. Change the balance due of all the clients to 0.
UPDATE CLIENT_MASTER SET BALDUE = 0;

# Exercise on deleting records in a table:

# a. Delete all clients from the CLIENT_MASTER.
DELETE FROM CLIENT_MASTER;

# b. Delete Client Records who are from 'Tamil Nadu'.
DELETE FROM CLIENT_MASTER WHERE STATE = 'Tamil Nadu';


