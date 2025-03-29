JOINS:

Normalization:

In real time projects, all the datas in the database will be deparated in different tables based on the data category. this is called normalization.



THERE ARE 4 TYPES OF JOINS:
1- inner join
2- outer join
		left outer join
		right outer join
		full outer join
3- cross join (or) cartesian join
4- self join

INNER JOIN: Retrieves records that have matching values in both tables. Rows without matches in either table are excluded from the result set.

LEFT (OUTER) JOIN: Retrieves all records from the left table and the matched records from the right table. If there is no match in the right table, NULL values are returned for columns from the right table.

RIGHT (OUTER) JOIN: Similar to the LEFT JOIN but retrieves all records from the right table and the matched records from the left table. If there is no match in the left table, NULL values are returned for columns from the left table.

FULL (OUTER) JOIN: Retrieves all records from both tables and includes NULL values for columns where there is no match.

SELF JOIN: A self-join is when a table is joined with itself. This is often used to find relationships within the same table.

CROSS JOIN: Also known as a Cartesian join, it combines all rows from the first table with all rows from the second table, resulting in a large result set.



there are 2 methods


1- implicite method
2- ANSI method - American National Standards Institute - thid id the method followed most.


INNER JOIN

ANSI METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a inner join country b   -- inner join or join
on a.country_id = b.country_id;
                                       -- incase of joining 3 tables
inner join city c
on b.country_id = c.country_id;



IMPLICITE METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a , country b
where a.country_id = b.country_id;

                                       --- incase of joining 3 tables
from customer a, country b, city c
where a.country_id = b.country_id and b.country_id = c.country_id;



LEFT OUTER JOIN

ANSI METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a LEFT OUTER JOIN country b   -- left outer join or left join
on a.country_id = b.country_id;

IMPLICITE METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a , country b
where a.country_id = b.country_id(+);


RIGHT OUTER JOIN

ANSI METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a RIGHT OUTER JOIN country b   -- RIGHT outer join or RIGHT join
on a.country_id = b.country_id where a.cust_id is null;

IMPLICITE METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a , country b
where a.country_id(+) = b.country_id AND a.cust_id is null;


FULL OUTER JOINS


IMPLICITE METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a , country b
where a.country_id = b.country_id(+)
UNION
select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a , country b
where a.country_id(+) = b.country_id;



ANSI METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a FULL OUTER JOIN country b   -- FULL outer join or FULL join
on a.country_id = b.country_id;


CROSS JOIN OR CARTISION JOIN

ANSI METHOD

select 
a.cust_id,
a.cust_name,
a.mob_no,
a.email_id,
b.country_id,
b.country_name
from customer a CROSS JOIN country b   
on a.country_id = b.country_id;



SELF JOINS

select 
e1.employee_id,
e1.first_name,
'reports_to',
e2.employee_id,
e2.first_name
from employees e1 self join employees e2
ON e1.manager_id = e2.employee_id
