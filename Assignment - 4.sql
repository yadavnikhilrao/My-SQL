
# LAB ASSIGNMENT 4

use assignments;

CREATE TABLE EMPLOYEE (
  ID INT,
  F_NAME VARCHAR(50),
  L_NAME VARCHAR(50),
  DEPT VARCHAR(50),
  SALARY INT,
  DOJ DATE,
  ADDRESS VARCHAR(50),
  Married VARCHAR(1)
);

INSERT INTO EMPLOYEE (ID, F_NAME, L_NAME, DEPT, SALARY, DOJ, ADDRESS, Married)
VALUES
(1, 'VINAY', 'KUMAR', 'MCA', 25000, '2001-09-27', 'GHAZIABAD', 'Y'),
(2, 'SUMAN', 'VERMA', 'MCA', 15000, '2006-10-17', 'MEERUT', 'Y'),
(3, 'AKASH', 'SINGH', 'CS', 20000, '2005-01-15', 'KANPUR', 'Y'),
(4, 'SAGAR', 'KUMAR', 'IT', 20000, '2019-02-12', 'GHAZIABAD', 'N'),
(5, 'ROHAN', 'SHARMA', 'CS', 21000, '2005-09-18', 'GHAZIABAD', NULL),
(6, 'ROBIN', 'SINGH', 'IT', 18000, '2021-10-22', 'MEERUT', 'N'),
(7, 'AKASH', 'RANJAN', 'CS', 22000, '2019-11-14', 'GHAZIABAD', NULL);


# Find the employee details who are from Ghaziabad.
SELECT * FROM EMPLOYEE WHERE ADDRESS = 'GHAZIABAD';

# Find the Department names.
SELECT DISTINCT DEPT FROM EMPLOYEE;

# List the employee id, complete name, and the department of all the employees.
SELECT ID, CONCAT(F_NAME, ' ', L_NAME) AS FULL_NAME, DEPT FROM EMPLOYEE;

# List all the employees' first name along with the department name. (Note the result should be displayed as "Vinay is working in MCA Department".)
SELECT CONCAT(F_NAME, ' is working in ', DEPT, ' Department') AS EMPLOYEE_DETAILS FROM EMPLOYEE;

# Display the employee names who joined after 15-01-2005.
SELECT CONCAT(F_NAME, ' ', L_NAME) AS EMPLOYEE_NAME FROM EMPLOYEE WHERE DOJ > '2005-01-15';

# Update the salary of employee to 25000 whose employee id is 2.
UPDATE EMPLOYEE SET SALARY = 25000 WHERE ID = 2;

# Display the employee id, name, and Annual salary of all the employees. The column name showing annual salary should be "Annual Salary".
SELECT ID, CONCAT(F_NAME, ' ', L_NAME) AS NAME, SALARY * 12 AS `Annual Salary` FROM EMPLOYEE;

# List employee details with gross salary if every employee is getting a commission of Rs. 300.
SELECT *, SALARY + 300 AS GROSS_SALARY FROM EMPLOYEE;

# List the employee details who are getting a salary between 15000 and 30000.
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 15000 AND 30000;

# List the employee details who joined between 27-09-2001 and 12-02-2019.
SELECT * FROM EMPLOYEE WHERE DOJ BETWEEN '2001-09-27' AND '2019-02-12';

# List the employees who work in MCA, CS Department.
SELECT * FROM EMPLOYEE WHERE DEPT IN ('MCA', 'CS');

# List the employees who are not working in the MCA department.
SELECT * FROM EMPLOYEE WHERE DEPT != 'MCA';

# List the employees whose first name starts with 'R'.
SELECT * FROM EMPLOYEE WHERE F_NAME LIKE 'R%';

# List the employees whose first name starts with 'Ro'.
SELECT * FROM EMPLOYEE WHERE F_NAME LIKE 'Ro%';

# List the employees whose first name must be 5 characters long and starts with 'R'.
SELECT * FROM EMPLOYEE WHERE F_NAME LIKE 'R____';

# List the employees whose first name where the 2nd character must be 'o'.
SELECT * FROM EMPLOYEE WHERE F_NAME LIKE '_o%';

# List the employees who are married.
SELECT * FROM EMPLOYEE WHERE Married = 'Y';

# List the employees who are unmarried.
SELECT * FROM EMPLOYEE WHERE Married = 'N';

# List the employees whose marriage status is not known.
SELECT * FROM EMPLOYEE WHERE Married IS NULL;

# List the employees who belong to the MCA department and are married.
SELECT * FROM EMPLOYEE WHERE DEPT = 'MCA' AND Married = 'Y';


