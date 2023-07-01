create database assignments;

# drop database assignments;

use assignments;

# LAB ASSIGNMENT 1

# Create table Client_Master:
CREATE TABLE Client_Master (
    Client_No VARCHAR(6),
    Name VARCHAR(20),
    Address1 VARCHAR(30),
    Address2 VARCHAR(30),
    City VARCHAR(15),
    State VARCHAR(15),
    Pincode INT,
    Bal_Due FLOAT
);

# Create table Product_Master:
CREATE TABLE Product_Master (
    Product_No VARCHAR(6),
    Description VARCHAR(20),
    Profit_percentage INT,
    Unit_Measure VARCHAR(10),
    Qty_On_Hand INT,
    Reorder_Lvl INT,
    Sell_Price FLOAT,
    Cost_Price FLOAT
);

# Add a new column DOB to table Client_Master:
ALTER TABLE Client_Master
ADD (DOB DATE);

# Change the data type of Client_No to number:
ALTER TABLE Client_Master
MODIFY COLUMN Client_No INT;

# Drop the newly added column DOB from Client_Master:
ALTER TABLE Client_Master
DROP COLUMN DOB;

# Rename the column Sell_Price in Product_Master table to SellPrice:
ALTER TABLE Product_Master
CHANGE COLUMN Sell_Price SellPrice FLOAT;

# Rename the table Product_Master to ProductMaster:
RENAME TABLE Product_Master TO ProductMaster;

# Delete both tables:
DROP TABLE Client_Master, ProductMaster;
