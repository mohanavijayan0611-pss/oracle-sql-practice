Set operator:
--is using output of multiple select statements to get the output

also we should follow certain rules.
1.Number of columns used in multiple select statement should be same
2.datatype of the columns used in ultiple select statement should be same

syntax:

syntax:
select column1, column2.....column from table1 [where_clause]
set operator
select column1, column2.....column from table2 [where_clause];

This set operator is classified into 4 types 

1. Union
2. Union all
3. Intersect
4. Minus

1. Union set operator:
--is used to fetch the common and uncommon from the multiple select statements
--in case if we are getting same result multiple time, then it will be ignored and shown only once


syntax:
select column1, column2.....column from table1 [where_clause]
union
select column1, column2.....column from table2 [where_clause];

select emp_id,emp_name from employee where emp_id=1001;
select emp_id,emp_name from employee_duplicate1 where emp_id in (1001,1002);

select emp_id,emp_name from employee where emp_id=1001
union
select emp_id,emp_name from employee_duplicate1 where emp_id in (1001,1002);


2. Union all set operator:
--is used to fetch the common and uncommon from the multiple select statements
--in case if we are getting same result multiple time, then it will not be ignored and shown
syntax:
select column1, column2.....column from table1 [where_clause]
union all
select column1, column2.....column from table2 [where_clause];

select emp_id,emp_name from employee where emp_id=1001
union all
select emp_id,emp_name from employee_duplicate1 where emp_id in (1001,1002,1003);

3. Intersect operator:
--will fetch the common data from the multiple select statements
syntax:
select column1, column2.....column from table1 [where_clause]
intersect
select column1, column2.....column from table2 [where_clause];

select emp_id,emp_name from employee where emp_id=1001
intersect
select emp_id,emp_name from employee_duplicate1 where emp_id in (1001,1002);

4. Minus operator:
--will fetch the uncommon data from the first subset or select statements
syntax:
select column1, column2.....column from table1 [where_clause]
minus
select column1, column2.....column from table2 [where_clause];

select emp_id,emp_name from employee where emp_id=1001
minus
select emp_id,emp_name from employee_duplicate1 where emp_id in (1001,1002);

select emp_id, emp_name from employee where emp_id = 1003
minus
select emp_id, emp_name from employee_duplicate1 where emp_id in (1001, 1002);

--1003 is the uncommon data, so it will returned in the result


select emp_id, emp_name from employee where emp_id in (1001, 1003)
minus
select emp_id, emp_name from employee_duplicate1 where emp_id in (1001, 1002);


select emp_id, emp_name from employee where emp_id in (1001, 1003)
minus
select emp_id, emp_name from employee_duplicate1 where emp_id in (1001, 1002, 1004);

select emp_id, emp_name from employee where emp_id in (1001, 1004)
minus
select emp_id, emp_name from employee_duplicate1 where emp_id in (1001, 1002, 1003);