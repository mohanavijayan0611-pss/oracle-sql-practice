Functions:
--We saw about certain inbuild functions
Example : trim   => remove the space present before and after the text
now we can create some user defined functions as well

the procedures and functions are almost the same except one thing.
the procedure may or maynot return a value,but the function will definitely 
return a value.

syntax:
create or replace function function_name(param1 in datatype,param2 in datatype)
is 
    return datatype;
begin
    return variable_name;
end;
/

create or replace function addthreenumbers(n1 in number,
                                        n2 in number,
                                        n3 in number)
        return number
is 
    n4 number(4);
begin
    n4:=n1+n2+n3;
    return n4;
end;
/

select trim('  test')from dual;

select addthreenumbers(100,200,300)from dual;