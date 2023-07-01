
# LAB ASSIGNMENT 10

use assignments;

# Write a query to display the name for those employees who get a higher salary than the employee with ID 104.

SELECT Name
FROM Employee
WHERE Salary > (SELECT Salary FROM Employee WHERE EmpId = 104);

# 1.2. Write a query to display the name, salary, department ID, and job ID for those employees who work in the same designation as the employee with ID 103.

SELECT e.Name, e.Salary, e.DepartmentId, e.JobId
FROM Employee e
WHERE e.JobId = (SELECT JobId FROM Employee WHERE EmpId = 103);

# 1.3. Write a query to display the name, salary, and department ID for those employees who earn the smallest salary among all departments.

SELECT e.Name, e.Salary, e.DepartmentId
FROM Employee e
WHERE e.Salary = (SELECT MIN(Salary) FROM Employee);

# 1.4. Write a query to display the employee details who have the same date of birth as the employee with ID 106.

SELECT *
FROM Employee
WHERE DOJ = (SELECT DOJ FROM Employee WHERE EmpId = 106);

# 1.5. Write a query to display the employee details who have a date of birth after the date of birth of the employee with ID 102.

SELECT *
FROM Employee
WHERE DOJ > (SELECT DOJ FROM Employee WHERE EmpId = 102);
