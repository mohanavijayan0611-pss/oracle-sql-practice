--Conditional statement:

--we have four types of conditional statements

1.simple if
2.if else
3.if else if
4.nested if

1.simple if:
--used to check a condition whether if it is true or false

syntax:
    declare
    
    begin
        if condition then
            --line of code
        end if;
    end;
    /
    
    Find the greatest of two numbers
    declare
        n1 number(4):=300;
        n2 number(4):=200;
    begin
        if n1>n2 then
            dbms_output.put_line('n1 is greater than n2');
        end if;
    end;
    /
2.if else:

syntax:
    if condition then
        --line of code
    else
        --line of code
    end if;
    
    declare
        n1 number(4):=300;
        n2 number(4):=500;
    begin
        if n1>n2 then
            dbms_output.put_line('n1 is greater than n2');
        else
            dbms_output.put_line('n2 is greater than n1');
        end if;
    end;
    /

3. if else if
    syntax:
    
        if condition1 then
        
        elsif condition2 then
        
        else
        
        end if;
        
        Example:
        Find the greater of three numbers:
        
        declare
            n1 number(4):=100;
            n2 number(4):=200;
            n3 number(4):=300;
        begin
            if n1>n2 then
                dbms_output.put_line('n1 is greater than n2');
            elsif n2>n3 then
                dbms_output.put_line('n2 is greater than n3');
            else 
                dbms_output.put_line('n3 is greater than n1 and n2');
            end if;
        end;
        /
4. Nested if :
    --using a if or if else condition inside another if condition 
    syntax:
    
        if condition then
            if condition then
            
            else
            
            end if;
        end if;
        
        Example:
        
        declare
            n1 number(4):=500;
            n2 number(4):=800;
            n3 number(4):=300;
        begin
            if n1>n2 then
                if n1>n3 then
                    dbms_output.put_line('n1 is greater than n2 and n3');
                else
                    dbms_output.put_line('n3 is greater than n1 and n2');
                end if;
            elsif n2>n3 then
                dbms_output.put_line('n2 is greater than n1 and n3');
            else
                dbms_output.put_line('n3 is greater than n1 and n2');
            end if;
        end;
        /

--
alter table employee add (emp_age number(3),
                        emp_status varchar2(50));
                    
select*from employee;

update employee set emp_age=

age<18 mminor
age>=18 and age<60 major
age>=60 senior citizen

declare
    id_in number(4);
    name_in varchar2(50);
    age_in number(3);
    cursor emp_cursor is select emp_id,emp_name,emp_age from employee;
begin
    open emp_cursor;
        loop
            fetch emp_cursor into id_in,name_in,age_in;
            exit when emp_cursor%notfound;
            if age_in < 18 then
                update employee set emp_status='Minor'where emp_id=id_in;
            elsif age_in between 18 and 59 then
                update employee set emp_status='Major' where emp_id=id_in;
            else
                update employee set emp_status='Senion Citizen' where emp_id=id_in;
            end if;
        end loop;
end;
/

select*from employee;