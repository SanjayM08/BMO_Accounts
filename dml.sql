-- 11/11/2024

DML

create table test1(
c1 number,
c2 number);

select * from test1;

insert into test1 (c1,c2) values(11,11);,
insert into test1 values(22,22);
insert into test1 (c1) values(33);


select employee_id,salary from employees;

insert into test1 (c1,c2)
select employee_id,salary 
from employees;


select * from test1;

delete from test1;

insert all
into test1 values(11,11)
into test1 values(22,22)
into test1 values(33,33)
into test1 values(44,44)
into test1 values(55,55)
select * from dual;

select * from test1;

update test1
set c2=1000000
where c1=55;

delete from test1;


--MERGE

create table main_account(
main_id number,
main_amount number);

create table daily_account(
daily_id number,
daily_amount number);

select * from main_account;
select * from daily_account;

insert all 
into main_account values (1,10000)
into main_account values (2,15000)
into main_account values (3,8000)
select * from dual;


insert all 
into main_account values (1,10000)
into main_account values (2,15000)
into main_account values (3,8000)
select * from dual;

insert all 
into daily_account values (1,1000)
into daily_account values (2,5000)
into daily_account values (4,6000)
select * from dual;

select * from main_account;
select * from daily_account;


-- next day

merge into main_account 
using daily_account 
on (daily_id = main_id)
when matched then update set main_amount=main_amount+daily_amount
when not matched then insert values(daily_id,daily_amount);

select * from main_account;
select * from daily_account;

drop table daily_account;
drop table main_account;

