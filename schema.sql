--Schema:
--What is a Schema in SQL?
--
--An SQL Schema can be defined as a collection of database objects such as triggers, indexes, views, stored
--procedures, etc, which were associated with one specific database username. Simply, a Schema can be logical
--structure collection of data. Generally, a SQL Schema can be owned by some database user which contains the
--same database user name.
--
--A Schema could be a container of objects (an independent entity) that differs from a user who creates such an
--object. Schemas are separate namespaces or containers were similar to one another which were used to save the
--database objects. As per the privileges are given to a user, we can have complete control over the database
--objects. So that he/she can create, manipulate or delete a database object.
--
--A Schema in SQL will have one table and there is no limit for the number of objects present in it unless there is a
--restriction by a particular DB implementation.
--
--Lets say, for example, a DB administrator provides you user name and password for a database.
--Your username is EMPLOYEEDB. Lets say you logged on to the DB and created a table named EMP_TABLE. 
--EMPLOYEEDB will be schema name for that table and it is the owner of the table as well.

select *from EMPLOYEEDB.EMP_TABLE;

select*from employee;
select*from mohana.employee;
select*from mohana.student;
select*from mohana.employee where id>5;

exec schemaname.procedure_name;
insert into schema_name.tablename()....
update schema_name.tablename set...
delete from schema_name.tablename....


