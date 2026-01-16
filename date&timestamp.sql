Date & Timestamp:

what is date?

08-12-2025
day - month- year

what is timestamp:

08-12-2025 20  14    34     34       PM
day-month-year hour minutes seconds  AM/PM

Default date & timestamp:

the below date,timestamp functions are readily avalilable in oracle sql.

sysdate,current_date - default date
systimestamp,current_timestamp - deafault timestamp

select sysdate,current_date from dual;
select systimestamp,current_timestamp from dual;

select*from employee;
alter table employee add(emp_doj date,emp_logintimestamp timestamp(6));

select emp_id,emp_name,emp_doj,emp_logintimestamp
from employee where emp_id=1009;

update employee set emp_doj=sysdate,emp_logintimestamp = systimestamp
where emp_id=1009;

Date/Timestamp components:

DD => 01-31
MM => 01-12
MON =>JAN - DEC
MONTH- JANUARY - DECEMBER
YYYY- 2025
YYY-025
YY-25
y-5
YEAR => TWENTY-TWENTY-FIVE
DAY=>SUNDAY- SATURDAY
D=> 1-7(day of the week)
HH => 00-11
HH12 =>00-11
HH24 =>00-23
MI=>00-59
SS=>00-59
AM/PM => AM/PM
A.M/P.M => A.M/P.M

While writing some where in note or any ledger we are writing date in 
different formats how we can achive those?

We have two inbuild functions help us to convert the standard to various date formats

1.to_char =>to_char(date,'format to be converted')=>will converted the date to the character
2.to_date =>to_date('date in character','format of the date in character')=>will converts the character to a date

select sysdate,'08-12-25' from dual;
        date    character

Using to_char function:
select sysdate, to_char(sysdate,'DD/MON/YY')
                ,to_char(sysdate,'DD MONTH YY')
                ,to_char(sysdate,'DD MONTH YYYY')
                ,to_char(sysdate,'D MON YEAR HH:MI:SS')
                ,to_char(sysdate,'YYYY-MONTH-DD')
                ,to_char(sysdate,'MM-DD-YY')
                ,to_char(sysdate,'MONDDYYYY')
                ,to_char(sysdate,'DD MON YY, DAY')
from dual;

select sysdate, to_date('13/JAN/22','DD/MON/YY')
                ,to_date('10 DECEMBER 24','DD MONTH YY')
                ,to_date('28 APRIL 2030','DD MONTH YYYY')
                ,to_date('MAY 2023 10 10:02:44','MON YYYY DD HH:MI:SS')
                ,to_date('2023-SEPTEMBER-22','YYYY-MONTH-DD')
                ,to_date('03-11-25','MM-DD-YY')
                ,to_date('DEC162024','MONDDYYYY')
                ,to_date('29 FEB 24','DD MON YY')
from dual;

lets explore more about to_char:

select to_char(sysdate, 'DD'),
        to_char(sysdate, 'MON'),
        to_char(sysdate, 'YEAR'),
        to_char(sysdate, 'YYYY'),
        to_char(sysdate, 'HH'),
        to_char(sysdate, 'MI'),
        to_char(sysdate, 'SS'),
        to_char(sysdate, 'MONTH'),
        to_char(sysdate, 'D'),
        to_char(sysdate, 'DAY')
        from dual;
YEAR
MONTH(01)
DATE(01)
HOUR(00)
MINUTE(00)
SECOND(00)

tranc function => means truncate
is used to remove the extra information from date

select sysdate, trunc(sysdate), current_date, trunc(current_date),
systimestamp, trunc(systimestamp), current_timestamp, trunc(current_timestamp)
from dual;

select trunc(10.35),trunc(10.99)from dual;

similar to to_date => we have to_timestamp

select systimestamp, '08-12-25 8:58:06.950000000 PM +05:30' from dual;
        timestamp           character
        
syntax:
    to_timestamp('timestamp character','format of the timestamp character')
    
Example:
select '08-12-25 08:58:06.950000000 PM',
        to_timestamp('08-12-25 08:58:06 PM',
                'DD-MM-YY HH:MI:SS AM')
        from dual;
        
what about the implecation of to_char in timestamp:
select to_char(systimestamp,'DD'),
        to_char(systimestamp,'MON'),
        to_char(systimestamp,'MM'),
        to_char(systimestamp,'YYYY'),
        to_char(systimestamp,'YEAR'),
        to_char(systimestamp,'HH'),
        to_char(systimestamp,'MI'),
        to_char(systimestamp,'SS')
        from dual;

--to_timestamp => converts the character to the timestamp
--what is the feature of timestamp - a calender will be given to get it 
--associated to the particular column.

select '13-09-25 07:33:45',
to_timestamp('12-09-25 07:33:45','MM-DD-YY HH:MI:SS AM')
from dual;

select to_char(to_timestamp('12-09-25 07:33:45 AM', 'MM-DD-YY HH:MI:SS AM'), 'HH'),
to_char(to_timestamp('12-09-25 07:33:45 AM', 'MM-DD-YY HH:MI:SS AM'), 'HH12'),
to_char(to_timestamp('12-09-25 07:33:45 AM', 'MM-DD-YY HH:MI:SS AM'), 'HH24')
from dual;

select to_char(to_timestamp('12-09-25 03:33:45 PM', 'MM-DD-YY HH:MI:SS AM'), 'HH'),
to_char(to_timestamp('12-09-25 03:33:45 PM', 'MM-DD-YY HH:MI:SS AM'), 'HH12'),
to_char(to_timestamp('12-09-25 07:33:45 PM', 'MM-DD-YY HH:MI:SS AM'), 'HH24')
from dual;

select to_char(systimestamp, 'HH'),to_char(systimestamp, 'HH12'),
to_char(systimestamp, 'HH24') from dual;




