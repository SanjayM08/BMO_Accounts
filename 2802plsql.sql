-- Collection variables .

declare 
type t_tab is table of varchar2(100) INDEX BY BINARY_INTEGER;
vvar t_tab;
begin 
select first_name bulk collect into vvar
from employees;
DBMS_OUTPUT.PUT_LINE('count'||vvar.count);
DBMS_OUTPUT.PUT_LINE('last'||vvar.last);
DBMS_OUTPUT.PUT_LINE('first'||vvar.first);
DBMS_OUTPUT.PUT_LINE('prior'||vvar.prior(5));
DBMS_OUTPUT.PUT_LINE('next'||vvar.next(5));
vvar.delete(5);
vvar.delete(4,7);
DBMS_OUTPUT.PUT_LINE('count'||vvar.count);
DBMS_OUTPUT.PUT_LINE('last'||vvar.last);
DBMS_OUTPUT.PUT_LINE('first'||vvar.first);
DBMS_OUTPUT.PUT_LINE('prior'||vvar.prior(5));
DBMS_OUTPUT.PUT_LINE('next'||vvar.next(5));
end;
/

declare 
type t_tab is table of varchar2(100) INDEX BY BINARY_INTEGER;
vvar t_tab;
begin 
select first_name bulk collect into vvar
from employees;
vvar.delete(4,7);
for i in 1..vvar.last loop
if vvar.exists(i) then
DBMS_OUTPUT.PUT_LINE(vvar(i)||i);
end if;
end loop;
end;
/

--Cursor 
/*
cursor is not using the runnig buffer of the session, it is using its own memory area
its called private work area.

it is a record by record processing mechanism, it is not using the bulk collect mechanism, it is using the fetch mechanism.
it is using the implicit cursor mechanism, it is using the implicit cursor attributes like %found, %notfound, %rowcount, %isopen.

implicit cursor
explicit cursor

*/

-- life cycle of the cursor
/*
1. declare the cursor --> query to the cursor 
2. open the cursor --> execute the query and populate the cursor with the result set
3. fetch the cursor --> fetch the data from the cursor and store it in the variables or record or collection
4. close the cursor --> release the memory allocated for the cursor
*/  

declare 
cursor c1 is select first_name from employees;
vvar varchar2(100);
begin 
open c1;
fetch c1 into vvar;
DBMS_OUTPUT.PUT_LINE(vvar);
close c1;
end;
/



declare 
cursor c1 is select first_name from employees;
vvar varchar2(100);
begin 
open c1;
for i in 1..30 loop
fetch c1 into vvar;
DBMS_OUTPUT.PUT_LINE(vvar);
end loop;
close c1;
end;
/

--cursor attributes
/*
%found --> returns true if the last fetch operation returned a row, otherwise it returns false. 
%notfound --> returns true if the last fetch operation did not return a row, otherwise it returns false.
%rowcount --> returns the number of rows fetched so far.
%isopen --> returns true if the cursor is open, otherwise it returns false.
*/  


declare 
cursor c1 is select first_name from employees;
vvar varchar2(100);
begin 
open c1;
loop
fetch c1 into vvar;
exit when c1%notfound;
DBMS_OUTPUT.PUT_LINE(vvar);
end loop;
close c1;
end;
/





declare 
cursor c1 is select first_name from employees;
vvar varchar2(100);
begin 
open c1;
if c1%isopen then
DBMS_OUTPUT.PUT_LINE('cursor is open');
close c1;
open c1;
end if;
loop
fetch c1 into vvar;
exit when c1%notfound;
DBMS_OUTPUT.PUT_LINE(vvar);
end loop;
close c1;
end;
/

set SERVEROUTPUT ON;
declare 
cursor c1 is select first_name from employees;
vvar varchar2(100);
begin 
open c1;
fetch c1 into vvar;
WHILE c1%found loop
DBMS_OUTPUT.PUT_LINE(vvar);
fetch c1 into vvar;
end loop;
dbms_output.put_line(c1%rowcount);
close c1;
end;
/



--implicit cursor 
/*
when ever is a dml operation a cursor is automatically created by the oracle server, it is called implicit cursor.
it is used to execute a single sql statement, it is not used to execute multiple sql statements
*/

create table emp as select * from employees;

begin
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (300, 'john', 'doe', 'john.doe@company.com', sysdate, 'IT_PROG');
dbms_output.put_line(sql%rowcount);
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (301, 'jane', 'doe', 'jane.doe@company.com', sysdate, 'IT_PROG');
dbms_output.put_line(sql%rowcount);
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (302, 'jack', 'doe', 'jack.doe@company.com', sysdate, 'IT_PROG');
dbms_output.put_line(sql%rowcount);

update emp set salary = salary * 1.1 where job_id = 'IT_PROG';

if sql%found then
dbms_output.put_line('salary updated for '||sql%rowcount||' emp');
else    
dbms_output.put_line('no emp found with job_id IT_PROG');
end if;

delete from emp;
dbms_output.put_line(sql%rowcount);
update emp set salary = salary * 1.1 where job_id = 'IT_PROG';
if sql%found then
dbms_output.put_line('salary updated for '||sql%rowcount||' emp');
else
dbms_output.put_line('no emp found with job_id IT_PROG');
end if;
end;
/



--explicit cursor 
    /*normal
    paramitarized
    for loop
    ref cursor*/


--parameterized cursor
/*cursor with parameters is a cursor that accepts parameters, it is used to execute a query with different parameters without having to declare multiple cursors. it is also used to execute a query with user input parameters.*/



declare
cursor c1 (depat_id number) is select first_name from employees where department_id = depat_id;
vvar varchar2(100); 
begin
open c1(10);
dbms_output.put_line('cursor is open');
fetch c1 into vvar; 
dbms_output.put_line(vvar);
close c1;
open c1(20);
dbms_output.put_line('cursor is open');
fetch c1 into vvar;
dbms_output.put_line(vvar);
close c1;
end;
/

--for loop cursor
/*cursor for loop is a loop that automatically opens, fetches and closes the cursor. it is used to simplify the code and reduce the chances of errors. it is also used to iterate through the result set of a cursor without having to write the code for opening, fetching and closing the cursor.

for loop will break the life cycle of the cursor automatically.
that i will be represet as record type*/



begin
for i in (select first_name, salary from employees) loop
dbms_output.put_line(i.first_name||' '||i.salary);
end loop;
end;
/


declare
cursor c1 is select first_name from employees;
type t1 is table of varchar2(100) index by binary_integer;
vvar t1;
begin
open c1;
LOOP
    fetch c1 bulk collect into vvar limit 10;
    exit when vvar.count = 0;
    for i in 1..vvar.count loop
        dbms_output.put_line(vvar(i));
    end loop;
    DBMS_OUTPUT.PUT_LINE('fetched ' || vvar.count || ' rows');
end loop;
close c1;
end;
/

declare
cursor c1 is select first_name from employees;
type t1 is table of varchar2(100) index by binary_integer;
vvar t1;
begin
open c1;
LOOP
    fetch c1 bulk collect into vvar limit 10;
    exit when vvar.count = 0;
    for i in 1..vvar.count loop
        dbms_output.put_line(vvar(i));
    end loop;
    DBMS_OUTPUT.PUT_LINE('fetched ' || vvar.count || ' rows');
end loop;
close c1;
end;
/