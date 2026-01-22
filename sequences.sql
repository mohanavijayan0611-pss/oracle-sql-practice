Sequences:

A Sequence is a database object used to automatically generate
unique numeric values, usually for primary keys
(like employee ID, order ID, etc.).

It helps avoid manual number entry and ensures no duplicate values.

? Why Do We Use Sequences?

To generate unique IDs

To avoid duplicate primary keys

To automate number generation

To improve performance (faster than MAX+1 logic)

select * from employee order by emp_id desc;
insert into employee(emp_id,emp_name,emp_email)
values(1010,'Rajesh','rajesh@gmail.com');

this sequence will provide us autoincremented number value.
using that we can insert data to the table.


create sequence emp_seq
    start with 1010
    increment by 1
    nocache
    nocycle;
    
select emp_seq.nextval from dual;

insert into employee(emp_id,emp_name,emp_email)
values(emp_seq.nextval,'Pooja','pooja@gmail.com');

select* from employee order by emp_id desc;

insert into employee(emp_id, emp_name, emp_email)
values(emp_seq.nextval, 'Kanis', 'kanis@gmail.com');

create or replace procedure addemployee(name_in in varchar2,
                                        email_in in varchar2)
as

begin
    insert into employee(emp_id,emp_name,emp_email)
    values(emp_seq.nextval,name_in,email_in);
end;
/

exec addemployee('swetha','swetha@gmail.com');
exec addemployee('Saroj','saroj@gmail.com');

    