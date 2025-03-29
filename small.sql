select * from employees;


select sysdate from dual;

select months_between ('01-01-2024', sysdate) from dual;

select hire_date,round( abs(months_between (hire_date, sysdate))) as Count, sysdate from employees;


select months_between ('14-12-24','15-11-24') from dual;

select months_between ('15-11-24','30-12-24') from dual;

select sysdate + 8 from dual;

select to_char(systimestamp) from dual;  --  14-12-24 4:13:38.723000000 PM +05:30


select systimestamp,substr(systimestamp,9,12) from dual;

select systimestamp,substr(systimestamp,9,12) from dual;


select next_day(sysdate,1) from dual;
select next_day(sysdate,2) from dual;
select next_day(sysdate,'Monday') from dual;
select next_day(sysdate,'Tuesday') from dual;
select next_day(sysdate,'Sunday') from dual;
select next_day(sysdate,'Sat') from dual;

