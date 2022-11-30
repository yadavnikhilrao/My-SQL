# create databse
 create database db1;

# use database
use db1;

# create table 
create table students (id int not null, name varchar(50), city varchar(30), branch varchar(25));
 
 # alter for adding new column for modifying/change the column
 alter table students add (DOB date);
 alter table students drop column dob;
 alter table students modify id int unique not null;
# delete all the data stored in this table
# drop table students;
 
 # INSERT: Used to insert data in the row of a table
 insert into students ( id, name, city, branch) values 
 (1,'Nikhil','Noida','DS'),
 (2,'Prakriti','Bulandshahr','CS'),
 (3,'Chunmun','Gulaothi','IT'),
 (4,'Vinay','Mathura','IT'),
 (5,'Akhil', 'Bulandshahr','Civil'),
 (6,'Yogi','Delhi','Mechanical'),
 (7,'Himanshu','Ghaziabad','Electrical'),
 (8,'Tanu','Ghaziabad','Mechanical'),
 (9,'Aabhinav','Delhi','CS'),
 (10,'Rajat','Bulandshahr','IT'),
 (11,'Priyanshu','Dehradoon','Civil'),
 (12,'Meghana','Rishikesh','CS'),
 (13,'Priya','Delhi','IT'),
 (14,'Kajal','Delhi','Electrical'),
 (15,'Shivam','Hapur','Mechanical'),
 (16,'Nikhil','Delhi','IT'),
 (17,'Arun','Rishikesh','CS'),
 (18,'Nitin','Delhi','CS');
 
# select * from table / column for showing the data 
 select * from students;
 
# UPDATE: Used to update value of a table’s column.
update students set name = 'Tanuj' where id = 3;

# DELETE: Used to delete one or more rows in a table.
delete from students where name = 'himanshu';
delete from students where id = 3;

# Data Query language
select * from students where branch = 'cs';
select name from students where city = 'Delhi';




