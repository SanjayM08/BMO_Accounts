-- 13/11/2024

select * from employees;

-- Padding 
-- rpad and lpad


select rpad('oracle',10,'*') from dual;==> 'oracle****'
select lpad('oracle',10,'*') from dual;==> '****oracle'

select lpad('oracle',4,'*') from dual;==> 'orac'

spit a data with single row functions

create table emp(details varchar2(20));

insert into emp values('100/john');

select substr(details,1,instr(details,'/')-1)id, 
       substr(details,instr('/',details),+1) name from emp;

select * from emp;




-- Number Function
-- Round, Trunc,Floor, Ceil, Mod, Power.


-- Round Nearest Integer

select round(45.6) from dual; ==> 46
select round(45.4) from dual; ==> 45

select round(-45.6) from dual; ==> -46
select round(-45.3) from dual; ==> -45


-- Trunc terminate decimal values

select trunc(45.6) from dual; ==> 45
select trunc(45.4) from dual; ==> 45

select trunc(-45.6) from dual; ==> -45
select trunc(-45.3) from dual; ==> -45


-- Floor goes to the lowest integer

select floor(45.6) from dual; ==> 45
select floor(45.4) from dual; ==> 45

select floor(-45.6) from dual; ==> -46
select floor(-45.3) from dual; ==> -46


-- Ceil Goes to the highest integer

select ceil(45.6) from dual; ==> 46
select ceil(45.4) from dual; ==> 46

select ceil(-45.6) from dual; ==> -45
select ceil(-45.3) from dual; ==> -45


-- Mod to find Remainder

select mod(14,3) from dual;==> 2


-- Power to find power of the number

select power(2,3) from dual;==> 8
select power(5,3) from dual;==> 125



-- Null Functions
-- NVL, NVL2, COALESCE, NULLIF

-- NVL

-- nvl (1st arg, 2nd arg)
-- 1st arg => null then 2nd arg
-- 1st not arg => null then 1nd arg

select nvl(5,4) from dual;    ==> 5
select nvl(null,4) from dual; ==> 4
select nvl(5,null) from dual; ==> 5
select nvl(null,null) from dual; ==> null

select SALARY,COMMISSION_PCT,SALARY + SALARY * nvl(COMMISSION_PCT,0) from employees;
select * from employees;



