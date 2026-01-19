Default function in oracle sql:
there are certain readily available functions exist in oracle sql.

there are two types
1.single row function
2.multiple row function

1.single row function
--each and every will processed and separate output will be returned for each row.

there are multiple functions avilable under this:

1. Case functions 
a.upper function:
--used to convert the values to uppercase

Example:
select upper('test one'),upper('Test One'),upper('TEST ONE')from dual;

b.lower function:
--used to convert the values to lowercase characters

Example:
select lower('test one'),lower('Test One'),lower('TEST ONE')from dual;

c.Initcap function:
--used to convert the first character to upper case character and rest 
--all characters converted to lowercase

Example:

select initcap('test one'),initcap('TEST ONE'),initcap('TEST ONE')from dual;

2.Trim function:
--used to remove extra space in a text

select '         kanna       ', trim('         kanna       '), trim('   Good morning    ') from dual;

--ltrim-left trim:
--It will remove the space at the left side of the text.

select '         kanna       ', ltrim('         kanna       '), ltrim('   Good morning    ') from dual;

--rtrim-right trim:

select '         kanna       ', rtrim('         kanna       '), rtrim('   Good morning    ') from dual;

3.concat function:
--is used to combine multiple text together

syntax:
select concat(text1,text2)from dual;

select concat('Hello',' everyone')from dual;
select concat('Hello',' everyone','How are you')from dual;--It will not work,since we passed three inputs here


To solve this more than 2 input issue, we are using ||

select 'Hello '||'everyone' from dual;

select 'Hello '||'everyone '||'How are you' from dual;

4.Instring function:
--used to find the text occuring position.

select instr(source text,findable text) from tablename;

select instr('Hello','o')from dual;--It will occurance of the first letter

select instr('Hello everyone','o')from dual;

select instr('Good morning','n')from dual;

select instr('Have a good day','d')from dual;

5.substring function:
--used to takeout/split some partial text out of the source text

syntax:

select substring(source text,starting position,number of characters from starting position)from dual/table name;

select substr('Good evening',1,4)from dual;
select substr('Hello how are you how was the day',6,20) from dual;


--take out the email address from the following text "bharathi@gmail.com_21_10122004_Chennai"
select substr('bharathi@gmail.com_21_10122004_chennai',1,18)from dual;

select substr('kavin@gmail.com_21_10122004_Chennai',1,15)
from dual;

select instr('kavin@gmail.com_21_10122004_Chennai','_')-1 from dual;

select substr('lakshmi@gmail.com_21_10122004_Banglore',1,instr('lakshmi@gmail.com_21_10122004_Banglore','_')-1)from dual;

select substr('lakshmi@gmail.com_21_10122004_Banglore',1,instr('lakshmi@gmail.com_21_10122004_Banglore','_')-1)
from dual;

select substr('kavin@gmail.com_21_10122004_Chennai',1,instr('kavin@gmail.com_21_10122004_Chennai','_')-1)
from dual;

select substr('krishnapadmanaban@gmail.com_21_10122004_Banglore',1,
instr('krishnapadmanaban@gmail.com_21_10122004_Banglore','_')-1)
from dual;

6.Padding function:
--Used to append some characters
It is of types left pad -lpad and right pad - rpad

a.Lpad(left pad):
syntax:
select lpad(source text,expected length of the source text,appendable text)from dual/tablename;
--will add te shortage text to the left part of the source text
select lpad('test',6,1)from dual;--11Test
select lpad('test',6,'go')from dual;
select lpad('test',7,'go')from dual;
select lpad('Good evening',4,'s')from dual;--Good


b. rpad (left pad):
syntax:
select rpad(Source text,expected length of the source text, appendable text) from dual/tablename;
--will add the shortage text to the right part of the source text
select rpad('Test',6,'1') from dual;--Test11
select rpad('Test',6,'Go') from dual;--TestGo
select rpad('Test',7,'Go') from dual;--TestGoG
select rpad('Good evening', 4 ,'s') from dual;--Good

7.NVL function:
--used to find the null value and replace it with some text/column
syntax:
select nvl(columnname/text, replace text/columnname) from dual/tablename;
select nvl('Raj','Raj Kumar')from dual;--output will be Raj
select nvl('','Raj Kumar')from dual;--output will be Raj kumar, since first input is null
select nvl(null,'Raj Kumar')from dual;

8.Coalesce function:
--this provide multiple substitution

select*from employee;

alter table employee add
( emp_address varchar2(50),
  emp_state varchar2(20),
  emp_city1 varchar2(20),
  emp_postalcode varchar2(6)
);
syntax:
select coalesce(source_column,substitude_column1,substitute_column2, ... substitute_columnn)
from dual/tablename[where_clause];

select emp_id,emp_name,emp_address,emp_city1,emp_state,emp_postalcode,
coalesce(emp_address,emp_city1,emp_state,emp_postalcode,'no address available')
from employee where emp_id<1006;

--dual uses
In Oracle SQL, DUAL is a special one-row, one-column dummy table provided by Oracle.
It is mainly used when you want to select a value, function result, or expression without using a real table.
select 10+348, 37654-233, 34*876, 23432/56, 'Good morning' from dual;

9.nullif function:
--is used to compare value between two columns/inputs

syntax:
select nullif(argument1,argument2)from dual/tablename;

--if both the arguements are same then it will return null as output
--if both the arguements are different then it will return first arguement as the output
select nullif('first','first')from dual;
select nullif('first','second')from dual;
select nullif('second','first')from dual;
select nullif(emp_name,emp_email)from employee;

alter table employee add emp_name_duplicate varchar2(50);
select emp_id,emp_name,emp_name_duplicate from employee;
update employee set emp_name_duplicate = emp_name;--copying the value of emp_name to emp_name_duplicate
select emp_name,emp_name_duplicate,nullif(emp_name,emp_name_duplicate)from employee;

Multiple row function:
--uses value from multiple rows and process it and provides us one output
some of the functions are min,max,sum,avg

sum:
--this is appliend against number datatype column
--will provide the sum of all the values in this column

select*from employee;
example:
select sum(emp_id)from employee;

avg:
--this function also applied against number datatype column
--will provide the average of the values present in the row
average = total sum / no of rows;
select 15120/15 from dual;
example:
select avg(emp_id)from employee;


Min function:
--will gives the minimum value present in the column

example:
select min(emp_id)from employee;

Max function:
--will give the maximum value present in the column
select max(emp_id) from employee;

select round(10.44444444444) from dual;
select round(10.44444444444,4) from dual;
select round(10.44444444444,2) from dual;