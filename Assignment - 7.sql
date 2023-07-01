
# LAB ASSIGNMENT 7

use assignments;

# Implement the date functions of SQL.

# There are various date functions available in SQL such as DATE, MONTH, YEAR, DAY, DATEDIFF, DATEADD, GETDATE, CURRENT_DATE, etc. You can use these functions to manipulate and retrieve date-related information from the database.

# Create the following table and perform the following queries:

-- Create the Employee__ table
CREATE TABLE Employee__ (
  EmpId VARCHAR(3) PRIMARY KEY CHECK (EmpId LIKE 'E%'),
  Ename VARCHAR(25) NOT NULL,
  DOB DATE NOT NULL,
  DOJ DATE NOT NULL,
  Salary decimal(7) NOT NULL CHECK (Salary > 0),
  Adhar decimal(12) UNIQUE CHECK (LENGTH(Adhar) = 12)
);

-- 2.1 List the employee details who joined on a particular date.
SELECT * FROM Employee WHERE DOJ = '2023-06-24';

-- 2.2 Write a query to list the employees with Hiredate in the format like February 22, 1991.
SELECT EmpId, Ename, DATE_FORMAT(DOJ, '%M %d, %Y') AS Hiredate FROM Employee__;

-- 2.3 Write a query to list the employees who joined before 2018.
SELECT * FROM Employee__ WHERE YEAR(DOJ) < 2018;

-- 2.4 Write a query to list the employees who joined in the month January.
SELECT * FROM Employee__ WHERE MONTH(DOJ) = 1;

-- 2.5 Write a query to list the employees who have joined in the year 2019.
SELECT * FROM Employee__ WHERE YEAR(DOJ) = 2019;

-- 2.6 Write a query to list the employee details according to the date of joining (recent joining should come first).
SELECT * FROM Employee__ ORDER BY DOJ DESC;

-- 2.7 Write a query to list the employee details along with their experience.
SELECT EmpId, Ename, TIMESTAMPDIFF(YEAR, DOJ, CURDATE()) AS Experience FROM Employee__;

-- 2.8 Write a query to list those employees whose salary is an odd value.
SELECT * FROM Employee__ WHERE Salary % 2 = 1;

-- 2.9 Write a query to list the employees of id E001 or E10, joined in the year 1991.
SELECT * FROM Employee__ WHERE (EmpId = 'E001' OR EmpId = 'E10') AND YEAR(DOJ) = 1991;

-- 2.10 Write a query to list the employees who joined in any year except the month February.
SELECT * FROM Employee__ WHERE MONTH(DOJ) != 2;

-- 2.11 Write a query to display happy birthday to those employees who are eligible to get this message.
SELECT EmpId, Ename, DATE_FORMAT(DOB, '%M %d') AS Birthday FROM Employee__ WHERE MONTH(DOB) = MONTH(CURDATE()) AND DAY(DOB) = DAY(CURDATE());

-- 2.12 Display the employee id, Name, and Date of birth of all the employees (Note - if the dob is 3-jan-1985 then it should be displayed as 3rd January 1985)
SELECT EmpId, Ename, CONCAT(DAY(DOB), CASE WHEN DAY(DOB) IN (1, 21, 31) THEN 'st' WHEN DAY(DOB) IN (2, 22) THEN 'nd' WHEN DAY(DOB) IN (3, 23) THEN 'rd' ELSE 'th' END, ' ', DATE_FORMAT(DOB, '%M %Y')) AS DOB FROM Employee__;
