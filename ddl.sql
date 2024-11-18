-- 08/11/2024


select * from employees where first_name = 'Nancy';

select * from employees where first_name = 'nancy'; -- datas are case sensitive but keywords are incase sensitive

select * from employees where first_name = 'N'; -- wanna starts with n -- no output

-- so use like 

select first_name from employees where first_name like 'Nancy'; -- like and = are same but when % and _ comes its diffrents

-- starts with N all names

select first_name from employees where first_name like 'N%';

-- ends with n all names 

select first_name from employees where first_name like '%n'; -- datas are case sensitive so given by n(small n)

-- any position a 

select first_name from employees where first_name like '%a%';

-- find the a in the second position

select first_name from employees where first_name like '_a%';




-- DDL   Data Definition Language
-- Create, Alter, Rename, Truncate, Drop

-- CREATE
-- Creating a table

create table test1(id number, name varchar(20));

select * from test1;

-- copy a query result into a anothor table 

Create table test1(id number, name varchar(20));


-- copy the structure alon in one to anothor one

select * from employees; -- is the query 


create table emp_bk1
as
select * from employees;

select * from emp_bk1 where 1=2; -- a unsatisfied filters 



-- ALTER
-- to changes in the table columns which already exist

desc test1; -- describe the table

-- ADD

alter table test1 add phone_number number;
desc test1;

-- DROP 
-- drop the columns

alter table test1 drop column phone_number;
desc test1;

-- MODIFY
-- modify the columns datatypes

alter table test1 modify id varchar(20);
desc test1;

alter table test1 modify id number;
desc test1;

alter table test1 modify id varchar(200);
desc test1;

-- RENAME 

alter table test1 rename column id to TEST_ID; 
desc test1;

-- TRUNCATE
-- to remove all records and retain the structure alone

truncate table emp_bk1;
select * from emp_bk1;

-- DROP 
-- to remove entire object or table

drop table emp_bk1;
desc emp_bk;

-- TABLE RENAME 

rename TEST1 to NEW_TEST1;
desc test1;
desc new_test1;

DDL //