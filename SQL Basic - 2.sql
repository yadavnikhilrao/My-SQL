# Working with these topics :-

# Creating tables and database
# Relational Database model
# SQL Query Commands
# Handling null values
# Working with indexes
# Joins
# Key Constraints
# Working with SubQuery
-------------------------------------------------

# Comman Commands :-

# SELECT : Select data from database
# AS : Rename column or table
# FROM : Specific table we're pulling from 
# WHERE : Filter query to match a condition
# JOIN : Combine rows from two or more tables 
# AND : Combine conditions in a query. All must be meet
# OR : Combine conditions in a query. One must be meet
# LIKE : Search for pattern in a column
# IN : Specify multiple values when using WHERE
# IS NULL : Returns only rows with a null value 
# LIMIT : Limit the number of rows returned
# CASE : Return value on a specified condition
---------------------------------------------------
# CREATE : Create TABLE, DATABASE, INDEX OR VIEW
# DROP : Delete TABLE, DATABASE, OR INDEX
# UPDATE : Update table data
# DELETE : Delete rows from table
# ALTER TABLE : Add/Remove columns from table
---------------------------------------------------
# GROUP BY : Group rows that have same values into summary rows
# ORDER BY : Set order of result. Use DESC to reverse order
# HAVING : Same as WHERE but used for aggregate functions
# SUM : Return summ of column
# AVG : Return averege of column
# MIN : Return minimum value of column
# MAX : Return maximum value of column
# OVER : Return display along with every row value
# PARTITION BY : Used in conjunction with the OVER clause
# COUNT : Count number of rows
# DENSE_RANK : 	Same group data maintain in rank form 
# LEAD : Next value 
# LAG : Previous value 
---------------------------------------------------



create database d2;

use d2;

create table employee (
EMPID int unique not null,
NAME varchar(30),
JOB varchar(40),
SALARY int);


# INSERT :
insert into employee values
(201,'Nikhil','Data Scintist',48000),
(212,'Lakshay','Analyst',27000),
(208,'Aniruddah','Datya Engineer',30000),
(209,'Siddarth','Manager',59000),
(222,'Sunil','Analyst',25000),
(202,'Purva','Data Engineer', 26000),
(213,'Rajat','Analyst',29000),
(215,'Yogi','ML Engineer',28000),
(219,'Aabhinav','Data Scientist',42000),
(225,'Shivam','Analyst',27000),
(226,'Vinay','Manager',63000),
(231,'Nikhil','Manager',70000),
(235,'Prakriti','Manager',83000),
(205,'Ram','Analyst',25000),
(207,'Pallavi','Data Engineer',32000),
(211,'Nitin','ML Engineer',74000),
(233,'Arun','Data Engineer',41000),
(216,'Shiavam','Data Engineer',35000),
(223,'Himanshu','ML Engineer',54000);


# SELECT / FROM / WHERE :
select * from employee where job = 'ml engineer';


# SUM :
select sum(salary) from employee where job = 'Analyst';

# GROUP BY :
select job, sum(salary) from employee group by job;

# UPDATE :
update employee set job = 'Data Scientist' where job = 'Data Scintist';
update employee set job = 'Data Engineer' where job = 'Datya Engineer';

select job, sum(salary) from employee group by job;

# OVER / AS :
select *, sum(salary) over() as total_salary from employee;

# AVG :
select *, avg(salary) over() as average_salary from employee;

# PARTITION BY :
select *, sum(salary) over(partition by job) as total_salary from employee;

# ROW_NUMBER :
select *, row_number() over() as 'ROW_NUMBER' from employee;

# ORDER BY :
select *, row_number() over(partition by job order by salary) as 'partition_row_number' from employee;

# RANK BY : skipe the rank issue
select *, row_number() over(partition by job order by salary) as 'partition_row_no.',
rank() over(partition by job order by salary) as rank_row from employee;

# DENSE_RANK : rank issue solve
select *, row_number() over(partition by job order by salary) as 'partition_row_no.',
rank() over(partition by job order by salary) as rank_row,
dense_rank() over(partition by job order by salary) as dense_rank_row from employee;

# LEAD :
select *, lead(salary,1) over(partition by job order by salary) as next_salary from employee;

# LAG :
select *, lag(salary,1) over(partition by job order by salary) as perivous_salary,
salary - lag(salary,1) over(partition by job order by salary) as difference from employee;

#  Working with indexes

# Automatically creates indexes for primary key and unique columns.
# Index columns that you frequently use to retrieve the data.
# Index columns that are used for join to improve join performance.
# Avoid columns that contains many null values.
# Small table do not require indexes.

create index employee_salary on employee(salary);
show index from employee;

drop index employee_salary on employee;

-------------------------------------

create table projects (Project_ID int, EMPID int, Project_Name varchar(30));
insert into projects values
(12,212,'Project1'),
(15,207,'Project2'),
(18,211,'Project3'),
(20,201,'Project4'),
(13,230,'Project5'),
(16,210,'Project6');

select * from projects;


# Types of JOINS

# Inner Join
select employee.empid,employee.name,projects.project_id,projects.project_name from employee
inner join projects on employee.empid = projects.empid;

# Left Join
select employee.empid,employee.name,projects.project_id,projects.project_name from employee
left join projects on employee.empid = projects.empid;

# Right Join
select employee.empid,employee.name,projects.project_id,projects.project_name from employee
right join projects on employee.empid = projects.empid;

# Full Join ( not working in sql )
# select employee.empid,employee.name,projects.project_id,projects.project_name from employee
# full join projects on employee.empid = projects.empid union; 
----------------------------------------------------------------

create database d3;

use d3;

create table players ( name varchar(30), sport_natioality varchar(40), Age int, Weight int);
drop table players;

create table players ( Name varchar(30), Sport varchar(40), City varchar(40), Age int, Weight int);

select * from players; 

insert into players (name, sport, city, age, weight) values
('Akhil','Shooting','Bulandshahr',19,72),
('Rohit','Cricket','Gulaothi',20,65),
('Anurag','Badminton','Noida',22,68),
('Nitin','Hockey','Noida',21,70),
('Tanu','Badminton','Delhi',18,62),
('Shagun','Cricket','Oledha',21,69),
('Himanshu','Hockey','Bulandshahr',22,71),
('Prakriti','Badminton','Bulandshahr',18,55),
('Arun','Cricket','Delhi',25,73),
('Nikhil','Football','Delhi',21,65),
('Chunmun','Tannis','Noida',19,57),
('Aabhinav','Football','Delhi',22,81),
('Yogi','Cricket','Meerut',25,74);

insert into players values 
('Shivam','Football','Haryana',18,76),
('Vinay','Tannis','',19,null);

insert into players values 
('Parmod',null,'Delhi',null,null),
('Tanu',null,'Bulandshahr',19,72),
('Shyam','Cricket',null,20,65),
('Anurag',null,'Noida',18,74),
('Nitin','Hockey',null,21,70);

select * from players;

# NULL / NOT NULL
select * from players where sport is null;
select * from players where sport is not null;

select * from players;