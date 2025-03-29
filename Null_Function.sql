-- 15/11/2024



-- Null Functions
-- NVL, NVL2, COALESCE, NULLIF

-- NVL

-- NVL (1st arg, 2nd arg)
-- 1st arg => null then 2nd arg
-- 1st not arg => null then 1nd arg

select nvl(5,4) from dual;    ==> 5
select nvl(null,4) from dual; ==> 4
select nvl(5,null) from dual; ==> 5
select nvl(null,null) from dual; ==> null

select SALARY,COMMISSION_PCT,SALARY + SALARY * nvl(COMMISSION_PCT,0) from employees;
select * from employees;


-- NVL2 will accept 3 arguments
-- 1st is null argument null ==> 3ed argument is output
-- 1st is not null argument null ==> 2nd argument is output

select nvl2(3,4,5) from dual; ==> 4
select nvl2(null,4,5) from dual; ==> 5
select nvl2(3,null,5) from dual; ==> null
select nvl2(3,5,null) from dual; ==> 5


select SALARY, COMMISSION_PCT, COMMISSION_PCT+0.05, SALARY + SALARY * nvl2(COMMISSION_PCT, COMMISSION_PCT+0.05, 0.05) from employees;
select * from employees;
  
  
  

-- COALESCE it will give the first not null argument

account
tran_id     account_id      name        bank       atm       upi     online
1               10            a                    1000         
2               10            a                                       2000         
3               20            b          1000         
4               30            c                              5000         


select coalesce (bank,atm,upi,online) 

select coalesce (null,1000,null,null);
select coalesce (null,null,null,2000);
select coalesce (1000,null,null,null);
select coalesce (null,null,1000,null);



-- NULL IF it will accept 2 arguments and give null if both are equal
-- if both are not equal then 1st argument is given as output

select nullif (5,5) from dual; ==> null
select nullif (5,4) from dual; ==> 4
select nullif (null,null) from dual; ==>ORA-00932: inconsistent datatypes: expected - got CHAR

-- 'null is not equal to null'

--is null

select * from employees;

select first_name,salary from employees where salary > 10000;

select first_name,COMMISSION_PCT from employees where COMMISSION_PCT is null;

select first_name,COMMISSION_PCT from employees where COMMISSION_PCT = null;

empty becous null is not equal to null 
it will give the structure alone



--is not null

select first_name,COMMISSION_PCT from employees where COMMISSION_PCT is not null;


select first_name,COMMISSION_PCT from employees where COMMISSION_PCT != null;

empty becous null is not equal to null 
it will give the structure alone
