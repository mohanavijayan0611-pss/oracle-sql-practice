
SQL NOTES:
SQL stands for Structured Query Language.
It is a standard language used to communicate with databases.
Using SQL, we can store, retrieve, update, and delete data in a database.

Why SQL is used
•	To create databases and tables
•	To insert data
•	To fetch data
•	To update data
•	To delete data
•	To control access to data
________________________________________

DDL(Data Definition Language):
--this will deals with structure of the database

1. CREATE statement
2. ALTER statement
3. TRUNCATE statement
4. DROP statement

1. CREATE statement:
is used to create various structures (table, view, procedure, trigger, function, package etc)
within the database

create table students(
    id number(5),
    name varchar(50),
    doj date,
    loginttimestamp timestamp(6)

);

2. ALTER STATEMENT:

-- used to alter the structure (table/ view/procedure etc)
-- to make a change to the existing structure (table or view or index)
--In case of table what will be the change? 
--Below changes are considered for the alter statement.

a. Adding a new column to existing table
b. Modifying the existing column size
c. Dropping the existing column
d. Renaming the column name

alter table students add (phone number(20));
alter table students add(gender varchar2(10),age number(5));

alter table students modify(phone number(30));


alter table students drop column age;

alter table students rename column id to stuid;

3. TRUNCATE statement
--is used to clear/wipe out all the data from the table
--this will not remove the table structure

truncate table students;

create table dummy(
    Stu_id number(5)
);

4. DROP STATEMENT:
--is used to remove the table structure along with all the data present in it

drop table dummy;

--DML-Data manupulation language 

contains 4 types of statement
1. INSERT STATEMENT
2. UPDATE STATEMENT
3. DELETE STATEMENT
4. SELECT STATEMENT


create table student(
    id number(3),
    name varchar2(20),
    email varchar2(50),
    doj date

);

--syntax - 1

insert into student(id,name,email,doj)
values(1,'Mohana','mohana@gmail.com','12-10-2025');

--syntax-2

insert into student values(2,'Sanjana','san@gmail.com','12-5-2025');
insert into student values(3,'sahana','saha@gmail.com','10-01-2025');
insert into student(id,name)values(4,'prabu');

2. UPDATE STATEMENT:
--is used to update the existing data present in the table

update student set email='prabu@gmail.com' where id=1;
update student set email='mohana2@gmail.com',doj='22-10-2025' where id=1;

update student set name='Mohana';

3. DELETE STATEMENT:
--is used to delete one or more record from the table

delete from student where id=4;
delete from student where id in (3,4);

4. SELECT STATEMENT:
--is used to fetch or retrieve or view the data from the table
select*from student;
select*from student where id=1;
select id,name from student where id=1;

Comparison Operator:
In Oracle SQL, comparison operators are used to compare two values in a condition (mainly in WHERE, HAVING, JOIN, etc.).

--comparison symbol used in where condition:
--= => equal to --this will check for the exact value present in the table column
--!= => not equal to
--<> => not equal to
--> => greater than
--< => less than
-->= => greater than equal to
--<= => less than equal to

select * from student where id=4;
select* from student where id!=4;
select * from student where id<>3;
select*from student where id>5;
select * from student where id<5;
select*from student where id>=5;
select * from student where id<=4;

--Keywords used in where clause:
--in
--not in
--between
--like

select * from student where id in (1,3);
select * from student where id not in (1,3);
select * from student where id between 1 and 4;--both startrange and endrange values are inclusive
select * from student where name like 'M%';
select * from student where name like 'S%';
select * from student where id like '4%';
select * from student where name like 'Moh%';
select * from student where id like '1%';
--

select * from student where name like '%a';
select * from student where name like '%u';

select * from student where name like '%sa%';


