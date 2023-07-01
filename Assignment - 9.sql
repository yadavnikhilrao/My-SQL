
# LAB ASSIGNMENT 9

use assignments;

#drop table customer;

-- Create the orders table
CREATE TABLE orders (
  ord_no INT PRIMARY KEY,
  purch_amt DECIMAL(8, 2) NOT NULL,
  ord_date DATE NOT NULL,
  customer_id INT,
  salesman_id INT
);

-- Insert records into the orders table
INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

-- Create the customer table
CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  cust_name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  grade INT,
  salesman_id INT
);

-- Insert records into the customer table
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

drop table salesman;

-- Create the salesman table
CREATE TABLE salesman (
  salesman_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  commission DECIMAL(4, 2) NOT NULL
);

-- Insert records into the salesman table
INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

-- Create the item_mast table
CREATE TABLE item_mast (
  PRO_ID INT PRIMARY KEY,
  PRO_NAME VARCHAR(50) NOT NULL,
  PRO_PRICE DECIMAL(8, 2) NOT NULL,
  PRO_COM INT
);

-- Insert records into the item_mast table
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM)
VALUES
(101, 'Mother Board', 3200, 15),
(102, 'Key Board', 450, 16),
(103, 'ZIP drive', 250, 14),
(104, 'Speaker', 550, 16),
(105, 'Monitor', 5000, 11),
(106, 'DVD drive', 900, 12),
(107, 'CD drive', 800, 12),
(108, 'Printer', 2600, 13),
(109, 'Refill cartridge', 350, 13),
(110, 'Mouse', 250, 12);



# Write a SQL query to calculate the total purchase amount of all orders. Return the total purchase amount.

SELECT SUM(purch_amt) AS TotalPurchaseAmount
FROM orders;

# Write a SQL query to calculate the average purchase amount of all orders. Return the average purchase amount.

SELECT AVG(purch_amt) AS AveragePurchaseAmount
FROM orders;

# Write a SQL query to find the number of salespeople.
SELECT COUNT(DISTINCT salesman_id) AS NumberOfSalespeople
FROM orders;

# Write a SQL query to find the maximum purchase amount.

SELECT MAX(purch_amt) AS MaximumPurchaseAmount
FROM orders;

# Write a SQL query to find the minimum purchase amount.

SELECT MIN(purch_amt) AS MinimumPurchaseAmount
FROM orders;

# Write a SQL query to find the highest purchase amount ordered by each customer. Return the customer ID and the maximum purchase amount.

SELECT customer_id, MAX(purch_amt) AS MaximumPurchaseAmount
FROM orders
GROUP BY customer_id;

# Write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return the order date and the highest purchase amount.

SELECT ord_date, MAX(purch_amt) AS HighestPurchaseAmount
FROM orders
GROUP BY ord_date;

# Write a SQL query to find the highest purchase amount on '2012-08-17' by each salesperson. Return the salesperson ID and the purchase amount.

SELECT salesman_id, MAX(purch_amt) AS HighestPurchaseAmount
FROM orders
WHERE ord_date = '2012-08-17'
GROUP BY salesman_id;

# Write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by the highest order (purchase) amount above 2000.00. Return the customer ID, order date, and maximum purchase amount.

SELECT customer_id, ord_date, MAX(purch_amt) AS MaximumPurchaseAmount
FROM orders
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) > 2000.00;

# Write a SQL query to find the maximum order (purchase) amount in the range 2000, 6000 (both inclusive) by the combination of each customer and order date. Return the customer ID, order date, and maximum purchase amount.

SELECT customer_id, ord_date, MAX(purch_amt) AS MaximumPurchaseAmount
FROM orders
WHERE purch_amt BETWEEN 2000 AND 6000
GROUP BY customer_id, ord_date;


# Write a SQL query to find the maximum order (purchase) amount by each customer. The customer ID should be in the range 3002 and 3007 (both inclusive). Return the customer ID and the maximum purchase amount.

SELECT customer_id, MAX(purch_amt) AS MaximumPurchaseAmount
FROM orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id;

# Write a SQL query to count all the orders generated on '2012-08-17'. Return the number of orders.

SELECT COUNT(*) AS NumberOfOrders
FROM orders
WHERE ord_date = '2012-08-17';

# Write a SQL query to count the number of customers.

SELECT COUNT(*) AS NumberOfCustomers
FROM customer;

# Write a SQL query to find the number of customers who got at least a gradation for their activity.

SELECT COUNT(*) AS NumberOfCustomersWithGradation
FROM customer
WHERE grade IS NOT NULL;

# Write a SQL query to find the highest grade of the customers for each city. Return the city and the maximum grade.

SELECT city, MAX(grade) AS MaximumGrade
FROM customer
GROUP BY city;

# Write a SQL query to count the number of salespeople who belong to a city. Return the number of salespeople.

SELECT COUNT(*) AS NumberOfSalespeople
FROM salesman;

# Write a SQL query to count the number of products where the product price is higher than or equal to 350. Return the number of products.

SELECT COUNT(*) AS NumberOfProducts
FROM item_mast
WHERE PRO_PRICE >= 350;

# Display the latest date on which an employee had joined.

SELECT MAX(DOJ) AS LatestJoiningDate
FROM Employee;

# Display the 1st date on which an employee had joined.

SELECT MIN(DOJ) AS FirstJoiningDate
FROM Employee;

# List out how many numbers of departments are there.

SELECT COUNT(DISTINCT Dept) AS NumberOfDepartments
FROM Employee;

# Display how many numbers of employees are there in the MCA Department.

SELECT COUNT(*) AS NumberOfEmployeesInMCADepartment
FROM Employee
WHERE Dept = 'MCA';

# Display department-wise maximum average salary.

SELECT Dept, MAX(AVG(Salary)) AS MaximumAverageSalary
FROM Employee
GROUP BY Dept;

# Display the total number of employees in the organization.

SELECT COUNT(*) AS TotalNumberOfEmployees
FROM Employee;

# Display department-wise the number of employees working.

SELECT Dept, COUNT(*) AS NumberOfEmployees
FROM Employee
GROUP BY Dept;
