PLSQL - Programming language/SQL

Block of code:
--is used to allow multiple DML statements to execute together

Gmail
steps on logging into gmail.
step 1: goto url www.gmail.com
step 2: input username and password
step 3: click sign button
        a. data entered by will cross checked gmail_user table
            select count(*) from gmail_user where username='kannan' and password='kannan@2343_#'
            if count(*)=1
                success case
                a. update query will be executing to update the last login timestamp
                update gmail_user set lastlogin_timestamp = current_timestamp;
                b. get all the emails received by the user
                select statement will be execute.
            if count = 0
                failed case => login failed => reason invalid username or password
          =>in the above sign in we see minimum three queries used.
          
In order to execute multiple dml statements together we need the help of block of code

syntax:
1. declaration seciton -- variables will be declared here
2. execution section --code /logic will be written here
3. exception handling section --any exceptions could be handled here

syntax:

declare
    --variable declaration goes here
begin
    --line of code / logic
    --exception handling goes here
end;
/

Addition of two numbers:
set serveroutput on;
declare
    n1 number(4):=1000;
    n2 number(4):=600;
    n3 number(4);
begin
    n3:=n1+n2;
    dbms_output.put_line('Value of n3='||n3);--dbms_output.put_line is default inbuilt package used to print the output
end;
/

Let use select statement as part of the block of code:
select emp_name from employee where emp_id=1001;

declare
    name_in varchar2(50);
begin
    select emp_name into name_in from employee where emp_id=1001;
    dbms_output.put_line('name_in='||name_in);
end;
/    

select emp_name,emp_email from employee where emp_id=1001;

declare
    name_in varchar2(50);
    email_in varchar2(50);
begin
    select emp_name,emp_email into name_in,email_in from employee where emp_id=1001;
    dbms_output.put_line('name='||name_in||' email='||email_in);
end;
/  

select emp_name from employee where emp_id=1001; 
select emp_id,emp_name,emp_email from employee;

set serveroutput on;

declare
    id_in number(20);
    name_in varchar2(50);
    email_in varchar2(50);
    cursor emp_cursor is select emp_id,emp_name,emp_email from employee;
begin
    open emp_cursor;
        loop
            fetch emp_cursor into id_in,name_in,email_in;
            exit when emp_cursor%notfound;
            dbms_output.put_line('Id='||id_in||' Name='||name_in||'Email='||email_in);
        end loop;
end;
/
