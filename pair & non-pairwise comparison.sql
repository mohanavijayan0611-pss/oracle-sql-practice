Pair wise comparison & Non-pairwise comparison

pairwise comparison:

select*from employee;
select *from employee_duplicate1;
I want to compare the id & name between two tables.

select *from employee_duplicate1 where emp_id in (select emp_id from employee);
select*from employee_duplicate1 where emp_name in (select emp_name from employee);

select*from employee_duplicate1
where(emp_id,emp_name)in(select emp_id,emp_name from employee);
--the above approach where comparing pair of columns against the subquery

select*from employee;

--Non-pairwise comparison:
--combining the conditions separately and checking against the data
select*from employee_duplicate1
where emp_id in (select emp_id from employee)
and
emp_name in (select emp_name from employee);




