Views:

are nothing but the virtual table
it takes data from the existing table(s), from one or more table

A View in Oracle SQL is a virtual table created from a SELECT query.
It does not store data physically — it only stores the SQL query that retrieves data from one or more tables.

? A view shows data as if it were a table, but the data always comes from the original table.

? Simple Definition

A view is a saved SQL query that behaves like a table.

? Why Do We Use Views?

To simplify complex queries

To hide sensitive columns (security)

To reuse SQL logic

To provide a customized data view for users

To improve readability and maintenance

syntax:

create or replace view viewname as
select statement;

create or replace view employeeview as
select emp_id,emp_name,emp_email from employee;

select*from employeeview
where emp_id>1004 order by emp_id;

the view acts like a table.

--view using multiple tables

create or replace view employeewithleaveinfo as
select emp_id,emp_name,ELI_TOT_LEV,ELI_LEV_TAKEN
from employee,employee_leave_info
where emp_id=eli_id;

select*from employeewithleaveinfo;

select*from employee_leave_info;

create or replace view employeeview_withfilter as
select emp_id,emp_name,emp_email,emp_address from employee where emp_id>1004;

select*from employeeview_withfilter where emp_name='manoj';


table1 => 20
table2 => 15
table3 => 8
table4 =>16

create or replace view view_employee as
select 15 columns
table1 join table2 join table3 join table4
on condition where conditions;

select * from view_employee;

there is no separate space allocated for the view or we can say the 
view will not occupy separate space in the hard disk or the database.
