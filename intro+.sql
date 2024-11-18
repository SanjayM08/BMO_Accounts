-- 07/11/2024

select * from employees;

select first_name,salary from employees;

select first_name,salary from employees
where salary > 10000;

select first_name,salary from employees
where salary < 10000;

select first_name,salary from employees
where salary < 10000 order by salary;

-- Relational Operators
-- < > <= >=  =  !=
-- between like all in any


-- between

select first_name,salary from employees where salary >10000 and salary < 15000;
--instead of we use 
select first_name,salary from employees where salary between 10000 and 15000;


