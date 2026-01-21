--Joins:
--used to combine more than one table together to get the needed information

--Traditional /normal join:

create table employee_leave_info1(
    eli_id number(4),
    eli_tot_lev number(3),
    eli_lev_taken number(3)
);

insert into employee_leave_info1 values(1001,10,4);
insert into employee_leave_info1 values(1002,8,6);

select*from employee_leave_info1;

Requirement:
I want to get employee id, name, email, total leave, leave taken

select emp_id,emp_name,emp_email,eli_tot_lev,eli_lev_taken 
from employee,employee_leave_info1
where emp_id=eli_id;

--this query only fetch the common record between the two table.

Types of joins:
--here we are going to use join keyword in the query

1. Inner join
2. Self join
3. Cross join
4. Outer join

1.Inner join

--is used to fetch the common data between the two table
--the inner keyword is optional,so we can simply call it as join

syntax:

select column1,column2,.....column
from table1 inner join table2 on
table1.column1=table2.column1[where_clause];

select emp_id,emp_name,emp_email,eli_tot_lev,eli_lev_taken
from employee inner join employee_leave_info1
on emp_id=eli_id;

2.Self join
--using the same table multiple time to comeup with a desired result

Requirement:
find the employee id, employee name, Manager id, Manager name.

select emp_id,emp_name,emp_mgr from employee;

syntax:
select column1,column2,...column
from table1 a inner join table1 b on
a.column1 = b.column2;

select emp.emp_id Employee_id,emp.emp_name Employee_name,
mgr.emp_id Manager_id,mgr.emp_name Manager_name
from employee emp inner join employee mgr on 
emp.emp_mgr=mgr.emp_id order by emp.emp_id asc;


3.cross join or cartesian join:
--when we join multiple table together this join provokes us all possible
--combination of the results

syntax:

select column1,column2....column 
from table1 cross join table2;

select emp_id,emp_name,emp_email,eli_tot_lev,eli_lev_taken
from employee cross join employee_leave_info1;

what is the output of cross join?
number of rows present in table1*number of rows present in table2
16*3
=48

Outer join:
--this join is used to fetch data from either one table or both the table
--three types
1.left outer join or left join 
2.right outer join or right join
3.full outer join or full join

1.left outer join or left join:
--outer keyword is optional so also call this as simply left join.

syntax:

select column1,column2,...column
from table1 left outer join table2
on table1.column = table2.column1;

or

select column1, column2.....column
from table1 left join table2
on table1.column1 = table2.column1;

select emp_id, emp_name, eli_tot_lev, eli_lev_taken,eli_lev_type
from employee left outer join employee_leave_info1
on emp_id = eli_id
;

output will be => all the data from left side table + common data from right side table

select*from employee;
select*from employee_leave_info1;

alter table employee_leave_info1
add eli_lev_type varchar(20);

2.right outer join or right join:
syntax:
select column1,column2...column
from table1 right join table2
on table.column1 = table2.column1;

select emp_id,emp_name,eli_id,eli_tot_lev,eli_lev_taken,eli_lev_type
from employee right join employee_leave_info1
on emp_id = eli_id;

3.Full outer join or full join:

syntax:
select column1, column2.....column
from table1 full join table2
on table1.column1 = table2.column1;

select*from employee;

select emp_id, emp_name, eli_id, eli_tot_lev, eli_lev_taken, eli_lev_type
from employee full outer join employee_leave_info1
on emp_id = eli_id;

select emp_id, emp_name, eli_id, eli_tot_lev, eli_lev_taken, eli_lev_type
from employee full join employee_leave_info1
on emp_id = eli_id;