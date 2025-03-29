

/*You want to find the top 5 highest-paid employees in the company.*/


WITH RankedEmployees AS( SELECT first_name, salary,RANK() OVER (ORDER BY salary DESC) AS ranks FROM employees )
SELECT first_name, salary, ranks
FROM RankedEmployees
WHERE ranks <= 5;

select first_name,salary
from employees e1
where ( select count(distinct salary) from employees e2 where e2.salary > e1.salary)<4
order by salary desc;

/*
You have a table named Orders with columns OrderID, OrderDate, CustomerID, and Amount.
You need to find the total amount of orders placed by each customer,
and you also want to include customers who haven't placed any orders.
*/
select CustomerID ,count(OrderID)as count from orders -- where orderid is not null
group by CustomerID
order by 1;

/*
You have two tables, Employees and Departments, with columns EmployeeID, Name, DepartmentID in the Employees table,
and DepartmentID and DepartmentName in the Departments table. 
You need to retrieve the names of employees along with their corresponding department names.
*/

select e.employee_id,e.first_name, e.department_id,d.Department_Name
from employees e inner join Departments d
on e.Department_id=d.Department_id;


/*•	You have two tables, Orders and Customers, with columns OrderID, CustomerID, and OrderDate in the Orders table, 
and CustomerID and CustomerName in the Customers table. 
You need to retrieve the names of customers along with the total number of orders they have placed.*/

select c.CustomerName,count(o.OrderID) from Customers c inner join Orders o
on c.CustomerID=o.CustomerID group by CustomerName order by 2 desc;

/*
You have a table named Employees with columns EmployeeID, Name, and Salary. 
You want to find employees who earn more than the average salary.
*/
select avg(salary) from employees ;

(select first_name,salary from employees where salary > (select avg(salary) from employees))

/*You have a table named Products with columns ProductID, ProductName and Price. 
You want to find products with a price higher than any product in the 'Electronics' category.*/


create table Products( ProductID number, ProductName varchar2(20), Price number);

insert all 
into Products values (101,'Electronics',100000)
into Products values (102,'Electronics',100000)
into Products values (103,'cricate',1000)
into Products values (104,'pen',100000)
into Products values (109,'pencil',100000)
into Products values (109,'Electronics',1009900)
into Products values (100,'Electronics',1000)
select * from dual;


select * from Products;

select max(Price),PRODUCTNAME from Products group by PRODUCTNAME
having PRODUCTNAME='Electronics';

/*
You have two tables, Sales2019 and Sales2020, 
with the same structure containing columns ProductID, ProductName, and SalesAmount. 
Combine the sales data from both years into a single result set.
*/

select * from Sales2019 union  select * from Sales2020;

select s19.ProductID as ProductID_2019, s19.ProductName as ProductName_2019, s19.SalesAmount SalesAmount_2019, 
s20.ProductID as Productid_2020, s20.ProductName as ProductName_2020, s20.SalesAmount as SalesAmount_2020
from sales2019 s19 inner join sales2020 s20
on s19.productid = s20.productid;


drop table sales2020;
/*
You have two tables, Employees and Departments, with columns 
EmployeeID, Name,salary and DepartmentID in the Employees table, 
and DepartmentID and DepartmentName in the Departments table. 
Write a query to rank employees within each department based on their salaries.
*/

select e.first_name,e.department_id,d.department_name,e.salary,
rank() over(order by salary desc) 
from employees e inner join departments d
on e.department_id = d.department_id;

/*
You have two tables, Sales and Customers, with columns CustomerID and SalesAmount in the Sales table, 
and CustomerID and Region in the Customers table. 
Write a query to calculate the total sales amount for each region.*/

select c.region,sum(s.SalesAmount) 
from Sales s inner join Customerss c 
on s.CustomerID=c.CustomerID
group by c.region ;

drop table products;

-- 3.Write a query to find the highest and lowest salary in each department,
--   along with the difference between them.

select department_id,max(salary) as max,min(salary) as min 
from employees group by department_id order by 1;



-- 6.How would you handle NULL values in a column when calculating 
--   the average salary, ignoring NULLs

select first_name,avg(salary) from employees group by first_name order by 1;

select first_name,salary, from employees where first_name like 'Steven';

select first_name,avg(salary) from employees group by first_name having first_name like 'Steven';



select rowid ,first_name from employees order by 2;

Given four teams India, Australia, Europe, and Indonesia, 
	write a SQL query using only JOINs to generate all possible unique pairs of teams, 
	ensuring that each team is paired with every other team exactly once.

Output
This corrected query will produce unique pairs of teams

team1	team2
Australia	Europe
Australia	India
Australia	Indonesia
Europe	India
Europe	Indonesia
India	Indonesia



select t1.team_name as team_name1,  t2.team_name as team_name2 
from team t1 cross join team t2 
where t1.team_name < t2.team_name
order by 1;



-- 8.Write a SQL query to find all pairs of employees who report to the same manager.

select e.employee_id,e.first_name,e.manager_id ,d.first_name 
from employees e inner join employees d
on d.employee_id = e.manager_id
order by 1;


-- 9.Write a SQL query to find departments that have more employees than the average 
--       number of employees across all departments.

select department_id,count(first_name) from employees group by department_id
having count(employee_id) > (select avg(employee_count) 
from (select count(employee_id) as employee_count from employees  group by department_id) subquery)
order by 2 desc;

select  d.department_id, d.department_name, count(e.employee_id) as employee_count
from  departments d join employees e
on d.department_id = e.department_id
group by  d.department_id, d.department_name 
having count(e.employee_id) > (select avg(employee_count) 
from (select count(employee_id) as employee_count from employees  group by department_id) subquery)
order by  employee_count desc;






--  10.Write a SQL query to calculate the difference in salary between each employee 
--    and the next one, ordered by salary.

select first_name,salary,lag(salary) over (order by salary) as second,
( salary - lag(salary) over (order by salary)) as diff from employees order by 2 desc;



-- 11.Write a SQL query to rank departments based on their total salary expenditure

with sumsum as (select department_id,sum(salary) as sums 
from employees group by department_id)

select department_id,sums, rank()over(order by sums desc) from sumsum ;





select e.department_id ,d.department_name, e.salary, rank() over (partition by e.department_id order by e.salary desc)
from employees e inner join departments d
on e.department_id=d.department_id;



