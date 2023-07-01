# LAB ASSIGNMENT 5

USE assignments;

# Demonstrate the use of all string functions available in SQL.
# You can refer to the documentation or resources on SQL string functions to explore and understand the various string functions available in SQL.

# Design the following table and solve the queries

# Create the STUDENT table
CREATE TABLE STUDENT (
  Roll INT,
  F_Name VARCHAR(50),
  M_Name VARCHAR(50),
  L_Name VARCHAR(50),
  Sec CHAR,
  City VARCHAR(50),
  Area VARCHAR(50),
  HouseNo VARCHAR(50),
  Div_ INT
);

# Insert data into the STUDENT table
INSERT INTO STUDENT VALUES
(1, 'Akash', 'Kumar', 'Jain', 'A', 'Ghaziabad', 'Rakesh Marg', 'C-355', 1),
(2, 'Manav', 'Mohan', 'Sharma', 'A', 'Ghaziabad', 'Raj nagar', 'D-211', 2),
(3, 'Chandra', 'Mohan', 'Batra', 'B', 'Meerut', 'Minto Road', 'A-201', 3),
(4, 'Rakesh', 'Chandra', 'Gupta', 'B', 'Kanpur', 'Nehru Marg', 'A-145', NULL),
(5, 'Sagar', 'Pratap', 'Singh', 'A', 'Meerut', 'Gandhi marg', 'C-35', 0);

# i) Display Roll Number and complete name of all the students.
SELECT Roll, CONCAT(F_Name, ' ', M_Name, ' ', L_Name) AS Full_Name FROM STUDENT;

# ii) Display Roll Number, Name, and complete address of all the students.
SELECT Roll, CONCAT(F_Name, ' ', M_Name, ' ', L_Name) AS Full_Name, CONCAT(HouseNo, ', ', Area, ', ', City) AS Address FROM STUDENT;

# iii) Display Roll number, Name of all the students. (Note – The name should be displayed as A.K.Jain)
SELECT Roll, CONCAT(LEFT(F_Name, 1), '.', LEFT(M_Name, 1), '.', L_Name) AS Name FROM STUDENT;

# iv) Display all the student information according to ascending order of Section.
SELECT * FROM STUDENT ORDER BY Sec ASC;

# v) Display all the student information according to descending order of Section.
SELECT * FROM STUDENT ORDER BY Sec DESC;

# vi) Sort all the records according to section and then according to First Name.
SELECT * FROM STUDENT ORDER BY Sec ASC, F_Name ASC;

# vii) Display Roll number, name, and city of all the students. (Note – City names should be left-padded with 5 *s).
SELECT Roll, CONCAT(F_Name, ' ', M_Name, ' ', L_Name) AS Full_Name, LPAD(City, 5, '*') AS City FROM STUDENT;

# viii) Display those student details whose division has not been awarded.
SELECT * FROM STUDENT WHERE Div_ IS NULL;

# ix) Display the cities from where the students are from.
SELECT DISTINCT City FROM STUDENT;

# x) Display Roll number, First Name, and the division got. (Note – Division should be displayed as 1- FIRST, 2 – SECOND, 3 – THIRD, 0- FAIL, NULL – NOT AWARDED)
SELECT Roll, F_Name, CASE
    WHEN Div_ = 1 THEN 'FIRST'
    WHEN Div_ = 2 THEN 'SECOND'
    WHEN Div_ = 3 THEN 'THIRD'
    WHEN Div_ = 0 THEN 'FAIL'
    ELSE 'NOT AWARDED'
  END AS Division FROM STUDENT;

# xi) Display Roll Number, First Name, Section of all the students. (Note – Section A should be displayed as 1 and Section B should be displayed as 2)
SELECT Roll, F_Name, CASE
    WHEN Sec = 'A' THEN 1
    WHEN Sec = 'B' THEN 2
  END AS Section FROM STUDENT;


# Solve the following query

# Create the EMPLOYEE table
CREATE TABLE EMPLOYEE_ (
  Empcode VARCHAR(2),
  Empname VARCHAR(50)
);

# Insert data into the EMPLOYEE table
INSERT INTO EMPLOYEE_ VALUES
('E1', '001Rajkumar'),
('E2', 'Ramkumar002'),
('E3', 'Ravikumar003');

# SELECT query to retrieve Empcode and Empname with substring of Empname
SELECT Empcode, SUBSTRING(Empname, 4) AS Empname FROM EMPLOYEE_;


# Solve the following query

# Create the NAMES table
CREATE TABLE NAMES (
  `First Name` VARCHAR(50),
  `Middle Name` VARCHAR(50),
  `Last Name` VARCHAR(50)
);

# Insert data into the NAMES table
INSERT INTO NAMES VALUES
('Pankaj', 'Kumar', 'Tiwari'),
('Ashok', 'Kumar', 'Sharma'),
('Arun', 'Kumar', 'Sharma');

# SELECT query to retrieve Name with initials
SELECT CONCAT(LEFT(`First Name`, 1), '. ', LEFT(`Middle Name`, 1), '. ', `Last Name`) AS Name FROM NAMES;


# Given the table structure with data.

# Create the RESULTS table
CREATE TABLE RESULTS (
  Sname VARCHAR(50),
  Marks INT
);

# Insert data into the RESULTS table
INSERT INTO RESULTS VALUES
('Raj', 65),
('Amit', 32),
('Sanjay', 45),
('Rohit', 40),
('Anil', 35);

# Output 1 Rule - : Pass marks are 35.
SELECT Sname, CASE
    WHEN Marks >= 35 THEN 'Pass'
    ELSE 'Fail'
  END AS Result FROM RESULTS;
