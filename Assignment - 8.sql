
# LAB ASSIGNMENT 8

use assignments;

-- Create the salesman table
CREATE TABLE salesman (
  salesman_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  commission DECIMAL(4, 2) NOT NULL
);

-- Insert records into salesman table
INSERT INTO salesman (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

-- Create the customer table
CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  cust_name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  grade INT,
  salesman_id INT
);

-- Insert records into customer table
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

-- Create the orders table
CREATE TABLE orders (
  ord_no INT PRIMARY KEY,
  purch_amt DECIMAL(6, 2) NOT NULL,
  ord_date DATE NOT NULL,
  customer_id INT,
  salesman_id INT
);

-- Insert records into orders table
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


# Write a SQL statement to prepare a list with salesman name, customer name, and their cities for the salesmen and customer who belong to the same city.

SELECT s.name AS SalesmanName, c.cust_name AS CustomerName, s.city
FROM salesman s
JOIN customer c ON s.city = c.city;

# Write a SQL statement to make a list with order no, purchase amount, customer name, and their cities for those orders which order amount is between 500 and 2000.

SELECT o.ord_no, o.purch_amt, c.cust_name, c.city
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 500 AND 2000;

# Write a SQL statement to know which salesman is working for which customer.

SELECT s.name AS SalesmanName, c.cust_name AS CustomerName
FROM salesman s
JOIN customer c ON s.salesman_id = c.salesman_id;

# Write a SQL statement to find the list of customers who appointed a salesman for their jobs, and the commission received by the salesman is more than 12%.

SELECT c.cust_name, s.name AS SalesmanName
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.12;

# Write a SQL statement to find the list of customers who appointed a salesman for their jobs, who do not live in the same city where their customer lives, and the commission received by the salesman is above 12%.

SELECT c.cust_name, c.city AS CustomerCity, s.name AS SalesmanName, s.city AS SalesmanCity
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.city <> s.city AND s.commission > 0.12;

# Write a SQL statement to find the details of an order i.e. order number, order date, amount of order, which customer gives the order, which salesman works for that customer, and how much commission he gets for an order.

SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, s.name AS SalesmanName, s.commission
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN salesman s ON o.salesman_id = s.salesman_id;

# Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own.

SELECT c.cust_name, s.name AS SalesmanName
FROM customer c
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY c.cust_name ASC;

# Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own.

SELECT c.cust_name, s.name AS SalesmanName
FROM customer c
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.grade < 300
ORDER BY c.cust_name ASC;

# Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find out if any of the existing customers have placed no order or placed one or more orders.

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.cust_name ASC, o.ord_date ASC;

# Write a SQL statement to make a report with customer name, city, order number, order date, order amount, salesman name, and commission to find out if any of the existing customers have placed no order or placed one or more orders by their salesman or by themselves.

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name AS SalesmanName, s.commission
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY c.cust_name ASC, o.ord_date ASC;

# Write a SQL statement to make a list in ascending order for the salesmen who work either for one or more customers or have not yet joined under any of the customers.

SELECT s.name AS SalesmanName
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
WHERE c.customer_id IS NOT NULL
ORDER BY s.name ASC;

# Write a SQL statement to make a list for the salesmen who work either for one or more customers or have not yet joined under any of the customers, who have placed either one or more orders or no order to their supplier.

SELECT s.name AS SalesmanName
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NOT NULL OR o.ord_no IS NOT NULL
ORDER BY s.name ASC;

# Write a SQL statement to make a list for the salesmen who either work for one or more customers or have not yet joined any of the customers. The customer may have placed either one or more orders above the order amount 2000 and must have a grade, or they may not have placed any order with the associated supplier.

SELECT s.name AS SalesmanName
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_id IS NOT NULL
  AND (o.purch_amt > 2000 OR o.purch_amt IS NULL)
  AND (c.grade IS NOT NULL OR o.ord_no IS NULL)
ORDER BY s.name ASC;

# Write a SQL statement to make a Cartesian product between salesman and customer, i.e., each salesman will appear for all customers and vice versa.

SELECT s.salesman_id, s.name AS SalesmanName, c.customer_id, c.cust_name AS CustomerName
FROM salesman s
CROSS JOIN customer c;
