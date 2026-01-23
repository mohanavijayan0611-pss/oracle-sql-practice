--What is an Index in SQL?
--
--An index in SQL is a database object that improves the speed of data retrieval from a table—similar to an index in a book that helps you find information faster.
--
--Instead of scanning the entire table, the database uses the index to quickly locate rows.
--
--? Why Index is Used?
--
--Speeds up SELECT queries
--
--Improves performance for WHERE, JOIN, ORDER BY, and GROUP BY
--
--Reduces time to find records in large tables
--
--? How Index Works (Simple Idea)
--
--Without index ? Database scans all rows
--With index ? Database jumps directly to matching rows


select * from employee;
--
--if we have 10 million in a table then if we execute a select then it will take more time 
--to fetch the result say for example 50 seconds or minutes
--
--where as when add an index to a column of the table then it will process faster and fetch 
--the records quickly.
--
--index will using seperate table to maintain the index related information.
--adding or deleting an index will not affect the data present in the table.
--Index:
--syntax:
--create index index name on table(column);--to create the index on single column
--create index index name on table(column1,column2,...columnn)--to create index on multiple column

create index employee_emailindex on employee(emp_email);
create index employee_indexes on employee(emp_email,emp_name);

select*from employee where emp_email='pooja@gmail.com';
select*from employee where emp_email='ro@gmail.com' and emp_name='Rohit';

removing an index:
drop index indexname;
drop index employee_indexes;

--renaming an index:
alter index old_indexname rename to new_indexname;
alter index employee_emailindex rename to i_employee_emailidx;
