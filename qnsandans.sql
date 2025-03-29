select * from employees;

/*
You have a table named Employees with columns EmployeeID, Name, Department, and Salary.
Your task is to find the average salary of employees in each department.
*/

select employee_id, first_name, department_id, salary 
from employees;

select department_id,
avg(salary) from employees
group by Department_id;

/*
You have two tables, Students and Grades, 
with columns StudentID, Name, Age in the Students table, 
and StudentID, Subject, Grade in the Grades table.
You need to retrieve the names of students who scored an 'A' grade in Math.
*/

create table Students(
student_id number,
student_name varchar2(100),
student_age number);

create table Grades(
student_id number,
subject varchar2(100),
grade varchar2(100));

select * from students;
select * from grades;

insert all 
into  students values(01,'SANJAY',20)
into  students values(02,'RIZWAN',22)
into  students values(03,'MIRUN',23)
into  students values(04,'BK',21)
into  students values(05,'KRISH',25)
into  students values(06,'MATHI',22)
select * from dual;

select * from students;


insert all 
into  grades values(01,'MATH','A')
into  grades values(02,'MATH','B')
into  grades values(03,'MATH','A')
into  grades values(04,'MATH','A')
into  grades values(05,'MATH','B')
into  grades values(06,'MATH','C')
select * from dual;

select * from grades;

/*
You need to retrieve the names of students who scored an 'A' grade in Math.
*/

select * from students;
select * from grades;

select * 
from students s inner join grades g
on s.student_id = g.student_id
where g.grade='A';


/*You want to find the top 5 highest-paid employees in the company.*/

select * from employees;

select distinct salary from employees;

select first_name,salary
from employees e1
where (select count(distinct salary) from employees e2 where e2.salary > e1.salary) < 4
order by salary desc;

select first_name, salary from employees
where salary > 13000
order by salary desc;

---------------------------------------------------------------

/*
You have a table named Orders with columns OrderID, OrderDate, CustomerID, and Amount.
You need to find the total amount of orders placed by each customer,
and you also want to include customers who haven't placed any orders.

*/

create table main_orders(
order_id number,
order_date date,
customer_id number,
amount number);

select * from main_orders;

create table daily_orders(
order_id number,
order_date date,
customer_id number,
amount number);


select * from main_orders;
select * from daily_Orders;

insert all 
into main_orders values (1,'04-12-2024',10,10000)
into main_orders values (2,'04-12-2024',11,15000)
into main_orders values (3,'04-12-2024',12,8000)
select * from dual;

select * from main_orders;

insert all 
into daily_orders values (1,'04-12-2024',10,10000)
into daily_orders values (2,'04-12-2024',11,15000)
into daily_orders values (3,'04-12-2024',12,8000)
select * from dual;


select * from main_oredrs;
select * from daily_orders;


-- EOD

merge into main_orders m
using daily_orders d
on (d.customer_id = m.customer_id)
when matched then update set m.amount = m.amount + d.amount
when not matched then INSERT (order_id, order_date, customer_id, amount)
    VALUES (d.order_id, d.order_date, d.customer_id, d.amount);


select * from main_orders;
select * from daily_orders;



--------------------------------------------------------------------------------------------------
/*
You have two tables, Employees and Departments, with columns EmployeeID, Name, DepartmentID in the Employees table,
and DepartmentID and DepartmentName in the Departments table. 
You need to retrieve the names of employees along with their corresponding department names.
*/


select employee_id,first_name,department_id from employees;
select department_name from departments;

select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e inner join departments d 
on e.department_id= d.department_id;


/*•	You have two tables, Orders and Customers, with columns OrderID, CustomerID, and OrderDate in the Orders table, 
and CustomerID and CustomerName in the Customers table. 
You need to retrieve the names of customers along with the total number of orders they have placed.*/


create table customers (
    customerID number,
    customerName varchar2(100));

insert all
into customers (customerID, customername) VALUES (1, 'Alice')
into customers (customerID, customername) VALUES (2, 'Bob')
into customers (customerID, customername) VALUES (3, 'Charlie')
into customers (customerID, customername) VALUES (4, 'Diana')
select * from dual;

-- Create Orders table
CREATE TABLE Orders(
    orderID number,
    orderDate DATE,
    customerID number,
    amount number
);

-- Insert values into Orders table
insert all 
into orders values(101, '01-12-2024', 1, 150.00)
into orders values(102, '02-12-2024', 1, 200.00)
into orders values(103, '03-12-2024', 2, 300.00)
into orders values(104, '04-12-2024', 4, 50.00)
select * from dual;

select * from orders;

-- Query to find the total amount of orders placed by each customer, including those with no orders
select c.customerID, c.customerName, coalesce(sum(o.amount), 0)
from customers c left join orders o 
on c.customerID = o.customerID
group by c.customerID, c.customerName
order by customerid;

select * from customers;
select * from orders;
drop table Customers;
drop table Orders;
---------------------------------------------------------------------------------------
/*
You have two tables, Employees and Managers, with columns EmployeeID, Name in the Employees table, 
and ManagerID in the Managers table indicating who manages whom. 
You want to retrieve the names of employees along with the names of their managers.
*/

select * from employees;

select e.employee_id, e.first_name as emp_name,' manager is ',m.first_name as emp_manager,m.manager_id
from employees e inner join employees m
on e.manager_id = m.employee_id
order by e.employee_id;

----------------------------------------------------------------------------------------------------



/*
You have a table named Employees with columns EmployeeID, Name, and Salary. 
You want to find employees who earn more than the average salary.
*/

select employee_id,first_name,salary from employees;

select avg(salary) from employees;

select employee_id,first_name,salary
from employees
where salary > (select avg(salary) from employees);


------------------------------------------------------------------------------


You have a table named Orders with columns OrderID, OrderDate, and TotalAmount. 
You want to find orders placed on the latest date.

select * from orders;
desc orders;

select * from orders where oredredate ;


---------------------------------------------------------------------------------------


You have a table named Products with columns ProductID, ProductName and Price. 
You want to find products with a price higher than any product in the 'Electronics' category.


create table Products(
ProductID number,
ProductName varchar2(20),
Price number
);

select * from products;


-------------------------------------------------------------------------

You have a table named Employees with columns EmployeeID, Name, and DepartmentID, and 
another table named Departments with columns DepartmentID and DepartmentName. 
You want to find employees who work in the 'Sales' department.

select employee_id,first_name,department_id from employees;
select department_id,department_name from departments where department_name='Sales';

select e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name 
from employees e inner join departments d
on e.department_id = d.department_id
where d.department_name = 'Sales'
order by employee_id;

-----------------------------------------------------------------------------------------------
You have a table named Employees with columns EmployeeID, Name, DepartmentID, and Salary.
You want to create a view that shows employee names and their corresponding departments.



select employee_id,first_name, department_id,salary from employees;

select  e.first_name, d.department_name 
from employees e inner join departments d
on e.department_id = d.department_id;

-------------------------------------------------------------------------------------------

/*
You have two tables, Sales2019 and Sales2020, 
with the same structure containing columns ProductID, ProductName, and SalesAmount. 
Combine the sales data from both years into a single result set.
*/

create table Sales2019(ProductID number, ProductName varchar2(20), SalesAmount number);
create table Sales2020(ProductID number, ProductName varchar2(20), SalesAmount number);

insert all 
into sales2019 values(10,'Pen',10)
into sales2019 values(11,'Pencil',5)
into sales2019 values(12,'Scale',5)
into sales2019 values(13,'Eraser',2)
select * from dual;

select * from sales2019;

drop table sales2019;

insert all 
into sales2020 values(10,'Pen',20)
into sales2020 values(11,'Pencil',10)
into sales2020 values(12,'Scale',10)
into sales2020 values(13,'Eraser',5)
select * from dual;

select * from sales2020;

select s19.ProductID as ProductID_2019, s19.ProductName as ProductName_2019, s19.SalesAmount SalesAmount_2019, 
s20.ProductID as Productid_2020, s20.ProductName as ProductName_2020, s20.SalesAmount as SalesAmount_2020
from sales2019 s19 inner join sales2020 s20
on s19.productid = s20.productid;

-----------------------------------------------------------------------------------------------



/*
You have two tables, ActiveSubscribers and CancelledSubscribers, 
with the same structure containing columns SubscriberID, Name, and SubscriptionType.
You want to find subscribers who are still active but have also cancelled their subscriptions at some point.
*/


create table activesubscribers(Subscribersid number,sname varchar2(20),SubscribedOrNot varchar2(20),subsciptiontype varchar2(20));
create table cancelledsubscribers(Subscribersid number,sname varchar2(20),SubscribedOrNot varchar2(20),subsciptiontype varchar2(20));


select Subscribersid,sname,subsciptiontype from activesubscribers;
select Subscribersid,sname,subsciptiontype from cancelledsubscribers;

insert all 
into activesubscribers values(111,'Sanjay','subscribed','active')
into activesubscribers values(112,'Rizwan','subscribed','active')
into activesubscribers values(113,'Mirun','subscribed','active')
into activesubscribers values(114,'BK','subscribed','active')
select * from dual;

select * from activesubscribers;

insert all 
into cancelledsubscribers values(111,'ajay','subscribed','inactive')
into cancelledsubscribers values(112,'arun','subscribed','inactive')
into cancelledsubscribers values(113,'kavin','subscribed','inactive')
into cancelledsubscribers values(114,'JK','subscribed','inactive')
select * from dual;

select * from cancelledsubscribers;



select * from activesubscribers;
select * from cancelledsubscribers;


-------------------------------------------------------------------------------------


/*
You have two tables, Employees and Departments, with columns 
EmployeeID, Name,salary and DepartmentID in the Employees table, 
and DepartmentID and DepartmentName in the Departments table. 
Write a query to rank employees within each department based on their salaries.
*/

Select first_name,department_id,salary,
Rank() over(partition by department_id order by salary desc) as salary_rank
From employees;

---------------------------------------------------------------------------------
/*
You have two tables, Sales and Customers, with columns CustomerID and SalesAmount in the Sales table, 
and CustomerID and Region in the Customers table. 
Write a query to calculate the total sales amount for each region.*/

create table Sales(CustomerID number, SalesAmount number);
create table Customerss(CustomerID number, Region varchar2(20));

select * from sales;
select * from customerss;

insert all 
into sales values (11,1000)
into sales values (12,3000)
into sales values (13,7000)
into sales values (14,10000)
select * from dual;

insert all 
into CUSTOMERSS values (11,'india')
into CUSTOMERSS values (12,'uk')
into CUSTOMERSS values (13,'aus')
into CUSTOMERSS values (14,'arab')
select * from dual;

select * from sales;
select * from customerss;


/*Write a query to calculate the total sales amount for each region.*/

select c.CustomerID,c.Region,s.SalesAmount 
from customerss c inner join sales s
on c.CustomerID=s.CustomerID;



---------------------------------------------------------------------------------------------
/*
You ran some operations in the below series. 
At the end you ran ‘rollback’ without giving ‘commit’.
What will happened? Give your ans in a statement.


Update operation in table ‘B’
Delete operation in table ‘B’
Create a new table ‘A’
Insert operation in table’A’
Update operation in table ‘C’
Delete operation in table ‘B’
Insert operation in table ‘C’
Rollback

*/

---------------------------------------------------------------------------------------------

create table b (ename varchar2(20), phnumber number,company_name varchar2(20));


insert all 
into b values('sanjay',7708653220,null)
into b values('rathna',7708653220,'tcs')
into b values('abi',7708653220,'spark')
into b values('ravi sankar',7708653220,'data terrain')
select * from dual;

select * from b;

update b set phnumber=9095521770
where ename!='sanjay'; 

delete from b;


create table a (ename varchar2(20), phnumber number,company_name varchar2(20));

insert all 
into a values('sanjay',7708653220,null)
into a values('rathna',7708653220,'tcs')
into a values('abi',7708653220,'spark')
into a values('ravi sankar',7708653220,'data terrain')
select * from dual;

update a set phnumber=9095521770
where ename!='sanjay'; 


create table c (ename varchar2(20), phnumber number,company_name varchar2(20));

insert all 
into c values('sanjay',7708653220,null)
into c values('rathna',7708653220,'tcs')
into c values('abi',7708653220,'spark')
into c values('ravi sankar',7708653220,'data terrain')
select * from dual;

update c set phnumber=9095521770
where ename!='sanjay'; 


delete from b;

insert all 
into c values('sanjay',7708653220,null)
into c values('rathna',7708653220,'tcs')
into c values('abi',7708653220,'spark')
into c values('ravi sankar',7708653220,'data terrain')
select * from dual; 


rollback;


select * from a;
select * from b;
select * from c;
/*"so ddl cmd are auto commit and dml cmd are user commit so last qns insert so insert is dml that is user commit all c records are 
deleted and all balance a,b table's records are saved becouse i craeted the table so table create is ddl so that is auto commit so there 
were saved"*/


drop table a;
drop table b;
drop table c;
