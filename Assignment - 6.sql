# LAB ASSIGNMENT 6

-- Create CLIENT_MASTER table
CREATE TABLE CLIENT_MASTER_ (
  Client_No VARCHAR(6) PRIMARY KEY,
  Name VARCHAR(20) NOT NULL,
  CITY VARCHAR(20) CHECK (CITY IN ('Delhi', 'Mumbai', 'Chennai')),
  Pincode INT,
  State VARCHAR(20),
  BALDUE DECIMAL(10,2),
  Email VARCHAR(30) UNIQUE
);


-- Insert records into CLIENT_MASTER table
INSERT INTO CLIENT_MASTER_ VALUES
('C00001', 'Pankaj Sharma', 'Delhi', 400054, 'Delhi', 15000, 'pk@gmail.com'),
('C00002', 'Yogesh Sharma', 'Delhi', 780001, 'Delhi', 0, 'ys@gmail.com'),
('C00003', 'Aditya Singh', 'Mumbai', 400057, 'Maharashtra', 5000, 'as@gmail.com'),
('C00004', 'Ashwini Joshi', 'Chennai', 560001, 'Tamil Nādu', 0, 'aj@gmail.com'),
('C00005', 'Neha Sharma', 'Mumbai', 400060, 'Maharashtra', 2000, 'ns@gmail.com'),
('C00006', 'Divya Gupta', 'Chennai', 560050, 'Tamil Nādu', 0, 'dg@gmail.com');

-- Create PRODUCT_MASTER table
CREATE TABLE PRODUCT_MASTER_ (
  Product_No VARCHAR(6) PRIMARY KEY,
  Name VARCHAR(20) NOT NULL,
  UnitMeasure VARCHAR(10) NOT NULL,
  QtyOnHand INT NOT NULL,
  ReorderLevel INT NOT NULL,
  SellPrice DECIMAL(8,2) NOT NULL CHECK (SellPrice > 0),
  CostPrice DECIMAL(8,2) NOT NULL CHECK (CostPrice > 0)
);


-- Insert records into PRODUCT_MASTER table
INSERT INTO PRODUCT_MASTER_ VALUES
('P00001', 'T-Shirt', 'Piece', 200, 50, 350, 250),
('P03453', 'Shirt', 'Piece', 150, 50, 500, 350),
('P06734', 'Cotton Jeans', 'Piece', 100, 20, 600, 450),
('P07865', 'Jeans', 'Piece', 100, 20, 750, 500),
('P07868', 'Trouser', 'Piece', 150, 50, 850, 550),
('P07885', 'Pull Over', 'Piece', 80, 30, 700, 450),
('P07965', 'Denim Shirts', 'Piece', 100, 40, 350, 250),
('P07975', 'Lycra Tops', 'Piece', 70, 30, 300, 175),
('P08865', 'Skirts', 'Piece', 75, 30, 450, 300);

-- Create SALESMAN_MASTER table
CREATE TABLE SALESMAN_MASTER (
  Salesman_No VARCHAR(6) PRIMARY KEY,
  Sal_name VARCHAR(20) NOT NULL,
  Address VARCHAR(40) NOT NULL,
  City VARCHAR(20),
  State VARCHAR(20),
  Pincode INT(6),
  Sal_Amount DECIMAL(8,2) NOT NULL CHECK (Sal_Amount > 0),
  Tgt_to_get DECIMAL(8,2) NOT NULL CHECK (Tgt_to_get > 0),
  Ytd_Sales DECIMAL(8,2) NOT NULL CHECK (Ytd_Sales > 0),
  Remarks VARCHAR(30)
);


-- Insert records into SALESMAN_MASTER table
INSERT INTO SALESMAN_MASTER VALUES
('S00001', 'Kiran', 'A/14 worli', 'Mumbai', 'Mah', 400002, 3000, 100, 50, 'Good'),
('S00002', 'Manish', '65, nariman', 'Mumbai', 'Mah', 400001, 3000, 200, 100, 'Good'),
('S00003', 'Ravi', 'P-7 Bandra', 'Mumbai', 'Mah', 400032, 3000, 200, 100, 'Good'),
('S00004', 'Ashish', 'A/5 Juhu Bombay', 'Mumbai', 'Mah', 400044, 3500, 200, 150, 'Good');


-- Create SALES_ORDER table
CREATE TABLE SALES_ORDER (
  Order_NO VARCHAR(6) PRIMARY KEY,
  Order_Date DATE NOT NULL,
  Client_No VARCHAR(6),
  Dely_add VARCHAR(25),
  Salesman_No VARCHAR(6),
  Dely_type CHAR(1) DEFAULT 'F' CHECK (Dely_type IN ('P', 'F')),
  Billed_yn CHAR(1) CHECK (Billed_yn IN ('Y', 'N')),
  Dely_Date DATE,
  Order_Status VARCHAR(10) CHECK (Order_Status IN ('In Process(IP)', 'Fulfilled(F)', 'Canceled(C)')),
  FOREIGN KEY (Client_No) REFERENCES CLIENT_MASTER_ (Client_No),
  FOREIGN KEY (Salesman_No) REFERENCES SALESMAN_MASTER (Salesman_No)
);

DELIMITER //
CREATE TRIGGER check_dely_date
BEFORE INSERT ON SALES_ORDER
FOR EACH ROW
BEGIN
  IF NEW.Dely_Date < NEW.Order_Date THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Delivery date must be greater than or equal to order date';
  END IF;
END //
DELIMITER ;



-- Insert records into SALES_ORDER table
INSERT INTO SALES_ORDER (Order_NO, Order_Date, Client_No, Dely_add, Salesman_No, Dely_type, Billed_yn, Dely_Date, Order_Status)
VALUES
('O19001', '2021-01-12', 'C00001', 'Address 1', 'S00001', 'F', 'N', '2021-01-20', 'In Process(IP)'),
('O19002', '2021-01-25', 'C00002', 'Address 2', 'S00002', 'P', 'N', '2021-01-27', 'Canceled(C)'),
('O16865', '2021-02-18', 'C00003', 'Address 3', 'S00003', 'F', 'Y', '2021-02-20', 'Fulfilled(F)'),
('O19003', '2021-04-03', 'C00001', 'Address 4', 'S00001', 'F', 'Y', '2021-04-07', 'Fulfilled(F)'),
('O46866', '2021-05-20', 'C00004', 'Address 5', 'S00002', 'P', 'N', '2021-05-22', 'Canceled(C)'),
('O10008', '2021-05-24', 'C00005', 'Address 6', 'S00004', 'F', 'N', '2021-05-26', 'In Process(IP)');

-- Create SALES_ORDER_DETAILS table
CREATE TABLE SALES_ORDER_DETAILS (
  Order_No VARCHAR(6),
  Product_No VARCHAR(6),
  Qty_Order NUMBER(8),
  Qty_disp NUMBER(8),
  PRIMARY KEY (Order_No, Product_No),
  FOREIGN KEY (Order_No) REFERENCES SALES_ORDER (Order_NO),
  FOREIGN KEY (Product_No) REFERENCES PRODUCT_MASTER (Product_No)
);

-- Insert records into SALES_ORDER_DETAILS table
INSERT INTO SALES_ORDER_DETAILS VALUES
('O19001', 'P00001', 4, 4),
('O19001', 'P07965', 2, 1),
('O19001', 'P07885', 2, 1),
('O19002', 'P00001', 10, 0),
('O46866', 'P07868', 3, 3),
('O46866', 'P07885', 10, 10),
('O19003', 'P00001', 4, 4),
('O19003', 'P03453', 2, 2),
('O46866', 'P06734', 1, 1),
('O46866', 'P07965', 1, 0),
('O10008', 'P07975', 1, 0),
('O10008', 'P00001', 10, 5);


