with a as (select department_id ,avg(salary) avg_sal from employees group by department_id),
b as (select first_name,e.department_id,salary from employees e inner join a on e.department_id = a.department_id
and e.salary>a.avg_sal)
select b.*,d.department_name
from b inner join departments d 
on b.department_id = d.department_id;

select uid from dual;


select level from dual connect by level>=-10;

from 
connect by
where
group by
having
select
order/;

select substr('SANJAY',level,1) from dual
connect by level<= length('SANJAY');

select initcap(substr('SANJAY',level,6)) from dual
connect by level<= length('SANJAY');

select level,employee_id,first_name, manager_id from employees
start with manager_id is null
connect by prior employee_id=manager_id
;

