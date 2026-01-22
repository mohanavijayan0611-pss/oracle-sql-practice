Procedure or Stored procedure:
     --is a named object
     --the procedures are used as name objects.
     
     syntax:
     create or replace procedure procedure_name
     as
        --varaiable declaration
     begin
        --line of codes
     end;
     /
        
     
     Example:
     
     create or replace procedure addtwonumbers
     as
        n1 number(4):=100;
        n2 number(4):=200;
        n3 number(4);
     begin
        n3:=n1+n2;
        dbms_output.put_line('n3='||n3);
     end;
     /
     
      There are three approach through which we can see the output
     1.execute procedure_name;
     execute addtwonumbers;
     
     2. exec procedure_name;
     exec addtwonumbers;
     
     3.open the procedure and click the play button. 
     
 Lets use a select statement inside the procedure:
 
 select emp_name,emp_email from employee where emp_id=1001;
 
 create or replace procedure getEmployeeDetails
 
as
    name1 varchar2(50);
    email1 varchar2(50);
begin
    select emp_name,emp_email into name1,email1 from employee where emp_id=1001;
    dbms_output.put_line('Name is'||name1||'Email is'||email1);
end;
/

select emp_name,emp_email from employee;

create or replace procedure getEmpDetails
as
    name1 varchar2(50);
    email1 varchar2(50);
    cursor emp_cursor is select emp_name,emp_email from employee;
begin
    open emp_cursor;
        loop
            fetch emp_cursor into name1,email1;
            exit when emp_cursor%notfound;
            dbms_output.put_line('Name is'||name1||'Email is'||email1);
        end loop;
end;
/

procedure are further classified into two types based on the usage of arguments.

1.procedure without arguments:
-all the above three examples are of this kind

2.procedure with arguments:
----when a procedure takes in one or more input then it is said to be procedure
with arguments

create or replace procedure getEmployeeNameForId(id_in in number)
as
    name_in varchar2(50);
begin
    select emp_name into name_in from employee where emp_id=id_in;
    dbms_output.putline('Name='||name-in||'For the id'||id_in)
end;
/

Lets see one example where we can use out param

create or replace procedure getEmpNameForId(id_in in number,
                                            name_out out varchar2)
as

begin
    select emp_name into name_out from employee where emp_id=id_in;
    dbms_output.put_line('Name = '||name_out||' For the id '||id_in);
end;
/

set serveroutput on;

declare
    id number(4):=1003;
    name varchar2(50);
begin
    getempnameforid(id,name);
    dbms_output.put_line('id='||id||', name='||name);
end;
/
