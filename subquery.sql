part of a select statement:
select column1, column2,...columnn  --select clause
from tablename1, tablename2         --table clause
where condition1 and condition2;    --where clause

Sub queries:
--Using a select statement as part of the another select or update or delete statement

syntax:
select * from tablename where condition;
select * from tablename where (sub query);

we are going to implement the sub queries in all the above 3 parts of the select statement

It is of three types
1. Sub query in select clause
2. Sub query in table clause
3. Sub query in where clause

create table employee(
    emp_id number(4),
    emp_name varchar2(50),
    emp_email varchar2(50)
);

Example for what a subquery is:
Requirement : find the details of the recently joined employee in the company?

select * from employee order by emp_id desc;

Now the recently joined employee is 1003.

select * from employee where emp_id = (select max(emp_id) from employee);

Lets implement the subquery concept in all three parts of the select statement.

1. Sub query in select clause
--writing a subquery in the select clause 

create table contract_employee(
    cemp_id number(4),
    cemp_name varchar2(50)
);

insert into contract_employee values(1001, 'Raj');
insert into contract_employee values(1002, 'Ram');

select * from contract_employee;

Employee = Permanent employee + Contract employee
           (More benefits -     (less benefits +  
           less salary)          more salary)

select * from employee;

syntax:
select columnname1, (sub query), ... columnnamen
from tablename
where condition;

Requirement is find the contract employee id, name and email information

select cemp_id, cemp_name from contract_employee;

select emp_email from employee where emp_id=1001;

select cemp_id, cemp_name, 
(select emp_email from employee where emp_id=1001) 
from contract_employee;

select cemp_id, cemp_name, 
(select emp_email from employee where emp_id=cemp_id) 
from contract_employee;

2. Sub query in table clause:
--creating a sub query as part of the table
syntax:
select columnname1, columnname2...... columnnamen
from tablename1, tablename2
where condition;

select columnname1, columnname2...... columnnamen
from (sub query)
where condition;

create table employee_leave_info(
    eli_id number(4),
    eli_tot_lev number(3),
    eli_lev_taken number(3)
);


insert into employee_leave_info values(1001, 10, 4);
insert into employee_leave_info values(1002, 12, 3);
insert into employee_leave_info values(1003, 8, 5);


select * from employee_leave_info;

Requirement is get the employee id, name, total leave and leave taken

select emp_id, emp_name, eli_tot_lev, eli_lev_taken, emp_email
from employee, employee_leave_info
where emp_id = eli_id
;

select emp_id, emp_name, eli_tot_lev, eli_lev_taken
from 
(select emp_id, emp_name, eli_tot_lev, eli_lev_taken, emp_email
from employee, employee_leave_info
where emp_id = eli_id);

3. Sub query in where clause:
here we are going to setup subquery in where condition.

syntax:
select * from tablename where (sub query);

--Requirement find the recent joined employee to the company
select * from employee where emp_id = (select max(emp_id) from employee);
--this below query will gives us the very first employee joined the company
--we are considering that emp_id smaller is the first employee and larger value is 
--the recently joined employee
select * from employee where emp_id = (select min(emp_id) from employee);

Lets see another example for writing sub query in where condition.
Add manager column to the employee table:

alter table employee add emp_mgr number(4);


select emp_id, emp_name, emp_mgr from employee;

update employee set emp_mgr=1007 where emp_id<1007;

update employee set emp_mgr=1008 where emp_id between 1009 and 1020;

In a company, 
fresher / new joinee
lead / manager
Director / CEO

but all of them are employee and each employee will hold one employee id.

Requirement : Find out employees who assigned with manager.
step 1 :
select emp_id from employee where emp_mgr is not null;
step 2 :
select * from employee where emp_id in
(select emp_id from employee where emp_mgr is not null);

Requirement : Find out employees who are not assigned with manager.
step 1:
select emp_id from employee where emp_mgr is null;

step 2 :
select * from employee where emp_id in
(select emp_id from employee where emp_mgr is null);

Subquery in update query:

alter table employee add emp_city varchar2(20);

update employee set emp_city='Chennai'
where emp_id in (select emp_id from employee where emp_id<1006);

Subquery in delete query:

delete from employee 
where emp_id in (select emp_id from employee where emp_id=1014 or emp_id=1012);

creating table backup:

select * from employee where emp_id<1010;

create table employee_duplicate as 
(select * from employee where emp_id<1010);

select* from employee_duplicate;




