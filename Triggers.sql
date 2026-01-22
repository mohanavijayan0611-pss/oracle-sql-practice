Triggers:
--A trigger in Oracle SQL is a database object that is automatically executed when a specific event occurs on a table or view.

--Unlike procedures or functions, triggers run automatically — you do not call them manually.

Why Triggers Are Used

To enforce business rules

To maintain data integrity

To audit changes (track insert/update/delete)

To automatically update related tables

To prevent invalid operations

syntax:
create or replace trigger trigger_name
before insert or update or delete on tablename
when(columnname>0)
declare
    --variable declaration
begin
    --line of codes
end;
/

create table employee_salary(
    id number(4),
    name varchar2(50),
    salary number(8)
);

insert into employee_salary values(1,'kiris',30000);
insert into employee_salary values(2,'Ram',20000);

select*from employee_salary;

update employee_salary set salary=10000 where id=1;

select*from employee_salary;

create or replace trigger employee_trigger
before insert or update or delete on employee_salary
for each row
when (new.id>0)
declare
    diff number(6);       
begin
    diff :=:new.salary - :old.salary;
    if(:old.salary <> :new.salary) then
        dbms_output.put_line('For id '||:old.id||' Old salary='||:old.salary||' New salary'||:new.salary||' diff='||diff);
        insert into employee_salary_history values
        (:old.id, :old.salary, :new.salary, diff, systimestamp);
    end if;
end;
/

create table employee_salary_history(id number(4),
                                    old_salary number(6),
                                    new_salary number(6),
                                    diff number(6),
                                    captured_timestamp timestamp(6)
            );
            
update employee_salary set salary=50000 where id=1;

select * from employee_salary where id=1;

select*from employee_salary_history;

