Objects :-
is a representative of a class
so we can access all the data of the table using the objects.

Compare employee and employee_duplicate tables and find out the difference
in name value.

select emp_id, emp_name
from employee, employee_duplicate
where emp_id = emp_id;

--this above query will through error => column ambiguously defined error
meaning same column name in two different table
to solve this we are going for the concept of objects

There are 3 approaches through which we can solve this.
1. Using table name as object name
2. Using table prefix as object name
3. Using anonymous keywords as object name

1. Using table name as object name:
--making the table name as object name.
--just provide tablename. before the column name so that it will act as an object
select employee.emp_id, employee.emp_name employee_name, 
employee_duplicate.emp_name employee_duplicate_name
from employee, employee_duplicate
where employee.emp_id = employee_duplicate.emp_id;

2. Using table prefix as object name
--using few letters of the table name or first of multiple names in the table name
--as an object

select emp.emp_id, emp.emp_name, ed.emp_name
from employee emp, employee_duplicate ed
where emp.emp_id = ed.emp_id
and emp.emp_name <> ed.emp_name;

3. Using anonymous keywords as object name
--we can use some of the letters a, b, c, i,j,k
--in this example, the query constructes will be short 
--and easy to work. but it is not recommended for commit in any repo.
select a.emp_id, a.emp_name, b.emp_name
from employee a, employee_duplicate b
where a.emp_id = b.emp_id
and a.emp_name <> b.emp_name;
