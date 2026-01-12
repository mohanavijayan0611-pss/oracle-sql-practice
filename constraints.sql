Constraints:
Based on the different conditions we have six types of constraints
1. Unique constraint
2. Not null constraint
3. Primary key constraint
4. Foreign key constraint
5. Check constraint
6. Default constraint

create table employee_unique(
    emp_id number(4) unique,
    emp_name varchar2(20),
    emp_email varchar2(50),
    emp_address varchar2(50)

);

insert into employee_unique values(1001, 'Raj', 'raj@gmail.com', 'Chennai');
insert into employee_unique values(1002, 'Sutha', 'sutha@gmail.com', 'Pune');

select*from employee_unique

insert into employee_unique values(1001, 'Mohan', 'mohan@gmail.com', 'Chennai');
--the above query will fail since the id 1001 or 1002 already exist in the table

insert into employee_unique values(1003, 'Pradeep', 'pr@gmail.com', 'Mumbai');
--now the above query will be inserted without any problem since the id is unique and new one.
 
2. not null or nullable constraint:
--is used to eliminate null value into table column.

syntax:
 create table tablename(
    columnname1 datatype not null,
    columnname2 datatype,
    ...
    columnnamen datatype
 );
 
 create table employee_notnull(
    emp_id number(4) not null,
    emp_name varchar2(50),
    emp_email varchar2(50)
 );
 
 insert into employee_notnull values(1001, 'Raj', 'raj@gmail.com');
 insert into employee_notnull values(1002, 'Ram', 'ram@gmail.com');
 select * from employee_notnull;
 
 insert into employee_notnull values('', 'Pradeep', 'pr@gmail.com');
 
 --the above query insert will fail, since the id column is supplied with a null value
 
 insert into employee_notnull values(null, 'Pradeep', 'pr@gmail.com');
 
 3. Primary key constriant:
 --is the combination of both unique and not null constraint
 --we no need to set the keywords(unique & not null) separate in one column 
 syntax:
 create table tablename(
    columnname1 datatype primary key,
    columnname2 datatype,
    ...
    columnnamen datatype
 );
 
 create table employee_primarykey(
    emp_id number(4) primary key,
    emp_name varchar2(50),
    emp_email varchar2(50)
 );
 
 insert into employee_primarykey values(1001, 'Raj', 'raj@gmail.com');
 insert into employee_primarykey values(1002, 'Ram', 'ram@gmail.com');
 
 select * from employee_primarykey;
 
 1. check unique constraint
 insert into employee_primarykey values(1001, 'Pradeep', 'pr@gmail.com');
 
 2.check not null constraint 
 insert into employee_primarykey values('', 'Pradeep', 'pr@gmail.com');
 --the above query will fail since the primary key constraint prevents the addition of null value
 
 so from above two example we confirmed that the primary key is a combination
 of unique and not null constraint.
 
 4. Foreign key constraint:
 --is used to maintain the data integrity between the tables
 --is set betweent two or more tables
 
 Employee(Parent table)                 Employee_leave_info(Child table)
 id     name        email               id      totalleave leavetaken
 1001   Ram         ram@gmail.com       1001       10        8
 1002   Raj         raj@gmail.com       1002       12        4
 1003   Kannan      kannan@gmail.com    1003       14        6   
                                        1005       10        4
who is 1005?
we dont the information for 1005 in employee table, so it creates a orphon record in the child table
or also we call it as junk record. this data spoils the integriy of data.

To solve the above issue we are going with foreign key constraint.

Syntax for table1:
    create table parent_table(
        columnname1 datatype primary key,
        columnname2 datatype,
        ...
        columnnamen datatype
    );
    
create table child_table(
        ch_columnname1 datatype,
        ch_columnname2 datatype,
        ..
        ch_columnnamen datatype,
        constraint constraintname foreign key (ch_columnname1) references parent_table(columnname1)
    );
    
create table parent_table(
        id number(4) primary key,
        name varchar2(50),
        email varchar2(50)
    );
create table child_table(
        ct_id number(4),
        ct_total_leave number(3),
        ct_leave_taken number(3),
        constraint ct_fk foreign key (ct_id) references parent_table(id)
    );
insert into parent_table values(1,'Raj','raj@gmail.com');
insert into parent_table values(2,'Ram','ram@gmail.com');
insert into parent_table values(3,'Pooja','pooja@gmail.com');

select * from parent_table;
insert into child_table values(1, 10, 4);
insert into child_table values(2, 14, 4);
insert into child_table values(3, 11, 5);
select * from child_table;
insert into child_table values(4, 10, 3);--The query will give the error because we have given foreign key constraint
 
5. Check constraint
--is used to check for a condition before inserting data into the table

syntax:
    create table tablename(
        columnname1 datatype,
        columnname2 datatype,
        ...
        columnnamen datatype,
        check condition
    );
create table employee_check(
        emp_id number(4),
        emp_name varchar2(50),
        emp_age number(3),
        emp_gender varchar2(20),
        check (emp_age>18 and emp_gender='Male')
    );
insert into employee_check values(1001, 'Ram', 21, 'Male');
select * from employee_check;
insert into employee_check values(1002, 'Swathi', '25', 'Female');--since Gender is not matching this insert failed
insert into employee_check values(1003, 'Krishna', '15', 'Male');--insert failed

6. Default constraint:
--is used to set some default values on the table column
syntax:
    create table tablename(
        columnname1 datatype,
        columnname2 datatype default 'value',
        ...
        columnnamen datatype
    );
create table employee_default(
        emp_id number(4),
        emp_name varchar2(50),
        emp_country varchar2(50) default 'India'
    );

insert into employee_default values(1001, 'Ram', 'India');

 select * from employee_default;
insert into employee_default values(1002, 'Raj', 'USA');
insert into employee_default(emp_id, emp_name) values(1003, 'Krishna');
insert into employee_default(emp_id) values(1004);







