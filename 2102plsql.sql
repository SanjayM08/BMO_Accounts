--PL/SQL  

/*

begin
end;
/     */


--normal printing statement
begin
dbms_output.put_line('hi');--string
end;
/

begin
dbms_output.put_line(5); -- number
end;
/

set serveroutput on;  --script out neeed to be on

--printing statement with variable 

declare
a varchar2(20);
begin
a := 'oracle';
dbms_output.put_line(a);
end;
/


declare
a number;
begin
a := 4;
a := 6;
a := 8;
dbms_output.put_line(a);---8 coz a variable can hold a only one value
end;
/


-- sql in plsql
-- normal sql statement can work in plsql but it should be in between begin and end

select first_name from employees where employee_id=100; --sql statement


begin
select first_name from employees where employee_id=100; --sql statement in plsql not working  
dbms_output.put_line(a);
end;
/
--instead of above we need to use into keyword to store the value in variable

declare
a varchar2(20);
begin
select first_name into a from employees where employee_id=100; --sql statement in plsql   
dbms_output.put_line(a);
end;
/

-- two columns two variables

declare
aaa varchar2(20);
numw number;
begin
select first_name,salary into aaa,numw from employees where employee_id=100; --sql statement in plsql   
dbms_output.put_line(aaa);
dbms_output.put_line(numw);
end;
/





--attributes
%type
%rowtype

--rowtype is used to declare a record variable that can hold an entire row of data from a table. 
--It allows you to work with multiple columns of data as a single unit.
-- single row all column

lookslike this

declare
emp_record employees%rowtype; -- declaring a record variable of type employees

emp_record.employee_id number; -- accessing specific column of the record variable
emp_record.first_name varchar2(20); -- accessing another column of the record variable
emp_record.salary number(10,2); -- accessing another column of the record variable
......
end;
/


declare
emp_record employees%rowtype; -- declaring a record variable of type employees
begin
select * into emp_record from employees where employee_id=100; -- fetching entire row into the record variable
dbms_output.put_line(emp_record.first_name); -- accessing a specific column from the record variable    
dbms_output.put_line(emp_record.salary); -- accessing another column from the record variable
end;    
/


--%type is used to declare a variable that has the same data type as a column in a table.
--It allows you to ensure that the variable has the same data type as the column it is associated
--   single row single column


declare
a employees.first_name%type; -- declaring a variable with the same data type as the first_name column in the employees table
begin
select first_name into a from employees where employee_id=100; -- fetching data into the variable
dbms_output.put_line(a); -- printing the value of the variable
end;
/


single row multiple column

type t1 is record (v_name varchar2(20), v_salary number,v_dep varchar2(20)); -- creating a record type to hold multiple columns of data

declare
type t1 is record (v_name varchar2(20), v_salary number,v_dep varchar2(20)); -- creating a record type to hold multiple columns of data
emp_record t1; -- declaring a variable of the record type   
--it acts like emp_record.v_name, emp_record.v_salary and emp_record.v_dep to access the individual columns of the record variable
begin
select first_name, salary, department_name into emp_record
from employees 
where employee_id =100; -- fetching multiple columns into the record variable
dbms_output.put_line(emp_record.v_name); -- printing the value of the first column from the record variable
dbms_output.put_line(emp_record.v_salary); -- printing the value of the second column from the record variable
dbms_output.put_line(emp_record.v_dep); -- printing the value of the third column from the record variable
end;
/


single row all column

type t1 is record (v_name varchar2(20), v_salary number,v_dep varchar2(20)); -- creating a record type to hold multiple columns of data



declare
type t1 is record (v_name varchar2(20), v_salary number,v_dep varchar2(20)); -- creating a record type to hold multiple columns of data
type t2 is table of t1 index by binary_integer; -- creating a collection type to hold multiple records of type t1
emp_record t2; -- declaring a variable of the record type   

--it acts like emp_record(1).v_name, emp_record(1).v_salary and emp_record(1).v_dep to access the individual columns of the record variable
begin
select first_name, salary, department_name bulk collect into emp_record
from employees 
where employee_id =100; -- fetching multiple columns into the record variable
dbms_output.put_line(emp_record(1).v_name); -- printing the value of the first column from the record variable
dbms_output.put_line(emp_record(1).v_salary); -- printing the value of the second column from the record variable
dbms_output.put_line(emp_record(1).v_dep); -- printing the value of the third column from the record variable
end;
/


multiple row single column    holding we can use create our own datatype


declare
a varchar2(20);
begin
select first_name into a from employees; -- fetching data into the variable 
dbms_output.put_line(a); -- printing the value of the variable but we cant print multiple rows in this way
end;
/

so we can go with

declare
type emp_table_type is table of varchar2(20) index by binary_integer; -- creating a collection type to hold multiple first names
emp_table emp_table_type; -- declaring a variable of the collection type -- its like emp_table(1), emp_table(2) and so on
begin
select first_name bulk collect into emp_table from employees; -- fetching multiple rows into the collection variable
dbms_output.put_line(emp_table(1)); -- printing the first value from the collection variable
dbms_output.put_line(emp_table(2)); -- printing the second value from the collection variable   
end;
/



multiple row all column

declare
type emp_table_type is table of employees%rowtype index by binary_integer; -- creating a collection type to hold multiple rows of employee data
emp_table emp_table_type; -- declaring a variable of the collection type   
-- its like emp_table(1).first_name, emp_table(1).salary and so on for the first employee, emp_table(2).first_name, emp_table(2).salary for the second employee and so on
-- and emp_table(2).first_name, emp_table(2).salary for the second employee and so on
begin
select * bulk collect into emp_table from employees; -- fetching multiple rows into the collection variable
dbms_output.put_line(emp_table(1).first_name); -- printing the first name of the first employee in the collection variable
dbms_output.put_line(emp_table(1).salary); -- printing the salary of the first employee in the collection variable
dbms_output.put_line(emp_table(2).first_name); -- printing the first name of the second employee in the collection variable
dbms_output.put_line(emp_table(2).salary); -- printing the salary of the second employee in the collection variable
end;    
/




-- afternooon

conditional statements
if
if else
if elsif else

if conditions then
true statements;

if conditions then
true statements;
else
false statements;  

if conditions then
true statements;
elsif conditions then
true statements;
elsif conditions then
true statements;
else
false statements;



what is if conditions?
if conditions are logical expressions that evaluate to either true or false. They are used to control the flow of execution in a program based on certain conditions.  
example of if conditions:

if salary > 5000 then   
dbms_output.put_line('high salary');
end if;

what is if else conditions?
if else conditions are used to execute different blocks of code based on whether a condition is true or false. If the condition is true, the code within the if block is executed; otherwise, the code within the else block is executed.
example of if else conditions:  
if salary > 5000 then
dbms_output.put_line('high salary');
else
dbms_output.put_line('low salary');
end if; 


what is if elsif else conditions?
if elsif else conditions are used to evaluate multiple conditions in a sequential manner. 
If the first condition is true, the corresponding block of code is executed.
If the first condition is false, the next condition is evaluated, and so on. 
If none of the conditions are true, the code within the else block is executed.
example of if elsif else conditions:    
if salary > 5000 then
dbms_output.put_line('high salary');    
elsif salary > 3000 then
dbms_output.put_line('medium salary');
else
dbms_output.put_line('low salary');
end if;



my example

declare
a number;
begin
--a:=11;
if mod(a,2)=0 then
dbms_output.put_line('even');
elsif mod(a,2)=1 then
dbms_output.put_line('odd');
else
dbms_output.put_line('not a number');
end if;
end;    
/


control statements 
loop
while loop
for loop

loop is a control structure that allows you to execute a block of code repeatedly until a certain condition is met.

example of loop:
loop 
exit when condition; -- condition to exit the loop
-- statements to be executed in each iteration of the loop
end loop;

my example

declare
a number:=1;
begin
loop
dbms_output.put_line(a);
a:=a+1;
exit when a>10;
end loop;
end;
/



while loop is a control structure that allows you to execute a block of code repeatedly as long as a specified condition is true.

example of while loop:
while condition loop
-- statements to be executed in each iteration of the loop
end loop;

my example
declare
a number:=1;    
begin
while a<=10 loop
a:=a+1;
dbms_output.put_line(a);--2..11
end loop;
end;    
/

declare
a number:=1;    
begin
while a<10 loop
a:=a+1;
dbms_output.put_line(a);--2..10
end loop;
end;    
/




for loop is a control structure that allows you to execute a block of code a specific number of times. It consists of three parts: initialization, condition, and increment/decrement.
for loop variable will be automatically incremented or decremented in each iteration based on the specified range.
for loop i will automatically take the datatype from the min max values specified in the loop declaration. and it will be automatically incremented by 1 in each iteration.and the i we cant change the value of i inside the loop it will give error if we try to change the value of i inside the loop.


example of for loop:
for i in increment/decrement loop 
-- statements to be executed in each iteration of the loop
end loop;
    

my example
declare
begin
for i in 1..10 loop
dbms_output.put_line(i);--1..10
end loop;
end;    
/



begin
for i in 1..10 loop
for j in 1..5 loop
dbms_output.put_line(i||'-'||j);--1-1,1-2,1-3,1-4,1-5,2-1,2-2 and so on
end loop;
end loop;
end;
/




--------------------------------

ij loop in while and loop 
5 tables


declare
type rec is record (fname varchar2(20),sal number);
type tab is table of rec index by binary_integer;
vemp tab;
begin
select first_name,salary bulk collect into vemp
from employees;
for i in 1..vemp.count loop
if vemp(i).sal>10000 then
dbms_output.put_line(vemp(i).fname||'-'||vemp(i).sal);
end if;
end loop;
end;
/

write a plsql block to get the all employees and print the employees whose department_id is even number and he gets more than 10K as salary

write a plsql block to get department name and number of employees woring in each department and print it









