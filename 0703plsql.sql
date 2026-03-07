--what is procedure
/*A procedure is a named block of PL/SQL code that performs a specific task. It can accept parameters, execute a series of statements, and return results. Procedures are stored in the database and can be called from other PL/SQL blocks, applications, or triggers. They are used to encapsulate logic and promote code reusability.*/


create or replace procedure p1 is
begin
dbms_output.put_line('hello world');
end;
/

exec p1;

--in mode

create OR REPLACE PROCEDURE p1 (p1 IN VARCHAR2) IS
BEGIN   
DBMS_OUTPUT.PUT_LINE('hello ' || p1);
END;
/

--in and out mode

create or replace procedure p2 (emp_id in number, emp_sal out number) is
begin
select salary into emp_sal from employees where employee_id = emp_id;
end;
/

exec p2(100, :emp_sal);/*  we cannot exec a procedure with out parameters, we need to use an anonymous block to call the procedure with out parameters*/

--so we can do it like this
declare
emp_sal number; 
begin
p2(100, emp_sal);
dbms_output.put_line('salary of emp 100 is '||emp_sal);
end;
/



--inout mode

create or replace procedure p3 (v in out number) is
begin   
select salary into v from employees where employee_id = v;
end;
/

declare
v number := 100;
begin
p3(v);
dbms_output.put_line('salary of emp 100 is '||v);
end;
/



--write a procedure to update the salary by given percentage for a given department

create or replace procedure update_salary_by_percentage (p_dept_id in number, p_percentage in number) 
is
type t1 is table of number index by binary_integer;
vvar t1;
begin
select employee_id bulk collect into vvar from employees where department_id = p_dept_id;
for i in 1..vvar.count loop
update employees    
set salary = salary + (salary * p_percentage / 100)
where employee_id = vvar(i);
end loop;
commit;
end;    
/




--function

/*A function is a named block of PL/SQL code that performs a specific task and returns a value. It can accept parameters, execute a series of statements, and return results. Functions are stored in the database and can be called from other PL/SQL blocks, applications, or triggers. They are used to encapsulate logic and promote code reusability.

 Functions must return a value using the RETURN statement.*/

--it should have mandatory return data type and return statement.

create or replace function f1 return varchar2 is
begin   
return 'hello world';
end;
/

create or replace function f1 
return varchar2 
as
a varcha2r2(100);
begin
select firtst_name into a from 
employees where employee_id = 100;
dbms_output.put_line(a);
return 'Success';
end;    
/

select f1 from dual;

--or eles

declare
vvar varchar2(100);
begin
vvar := f1;---- it shows 
dbms_output.put_line(vvar);
end;
/

/*
whenever there is a return statement in a function, the function will exit immediately and return the value to the caller. 
if there are multiple return statements in a function, the first return statement that is executed will determine the value that is returned to the caller. 
if there are no return statements in a function, the function will return null by default.
*/

create or replace function f2 (p1 number) return varchar2 is
begin
if p1 > 0 then
return 'positive';  
elsif p1 < 0 then   
return 'negative';
else
return 'zero';
end if;
end;
/   

DECLARE
vvar varchar2(100);
BEGIN
vvar := f2(10);
dbms_output.put_line(vvar);
END;
/

/*in function there is a out parameter we cannot use instead of we can use return statement to return the value to the caller.*/

create or replace function f3 (p1 in number, p2 out number) return varchar2 is
begin
select salary into p2 from employees where employee_id = p1;
return 'success';
end;
/

select f3(100, :emp_sal) from dual;-- we cannot use out parameter in function, we need to use an anonymous block to call the function with out parameters

declare
emp_sal number;
vvar varchar2(100);
begin
vvar := f3(100, emp_sal);
dbms_output.put_line('salary of emp 100 is '||emp_sal);
dbms_output.put_line('function return value is '||vvar);
end;
/



--can return keyword is used in procedure
/*No, the RETURN keyword cannot be used in a procedure. The RETURN statement is used in functions to return a value to the caller. In procedures, you can use the EXIT statement to exit the procedure, but it does not return a value. If you need to return a value from a procedure, you can use OUT parameters instead.

but return can used in procedure it will exit from the statements*/

create or replace procedure p4 
is
begin
dbms_output.put_line('hello world');
dbms_output.put_line('welcome to plsql');
dbms_output.put_line('this is a procedure');
return;
-- it will exit from the procedure but it will not return any value to the caller because it is a procedure not a function.
dbms_output.put_line('this will not be executed');
end;/

/*
so it will exit from where the return present in that block so it exits from the procedure but it does not return any value to the caller because it is a procedure not a function.*/                 



/*a function inside a dml operation happen we cannot call it as in select clauses but we can use it in annonymous block or in plsql block but we cannot use it in select clause because it is a function and it returns a value but it cannot be used in select clause because it is not a table or view.*/


crerte or replae function f4 return number is
begin
update employees set salary = salary + 100 where employee_id = 100;
return 1;
end;    
/

select f4 from dual;-- it will show error because we cannot use function in select clause because it is not a table or view but it is a function and it returns a value but it cannot be used in select clause because it is not a table or view.

--inseade we can use it in an anonymous block or in a plsql block

declare
vvar number;    
begin
vvar := f4;
dbms_output.put_line('function return value is '||vvar);
end;
/



if we want the dml in function we can declare the pragma autonomous transaction in the function so that it can execute the dml statement and return the value to the caller without any error.

create or replace function f5 return number is
pragma autonomous_transaction;-- it allows the function to execute dml statements and return the value to the caller without any error.
begin
update employees set salary = salary + 100 where employee_id = 100;
commit;-- it is mandatory to commit the transaction in autonomous transaction because it is independent of the main transaction.
return 1;
end;
/

select f5 from dual;-- it will show the return value of the function because it is a function and it returns a value but it can be used in select clause because it is a function and it returns a value but it cannot be used in select clause because it is not a table or view.



/*pragma autonomous_transaction is a compiler directive that allows a function or procedure to execute independently of the main transaction. It is used when you want to perform DML operations within a function or procedure without affecting the main transaction. When a function or procedure is declared with pragma autonomous_transaction, it can commit or roll back its own transactions without affecting the main transaction. This is useful when you want to log information or perform other operations that should not be rolled back if the main transaction fails.*/

create table emp as select * from employees;

create or replace procedure p5 is
begin
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (300, 'john', 'doe', 'john.doe@company.com', sysdate, 'IT_PROG');
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (301, 'jane', 'doe', 'jane.doe@company.com', sysdate, 'IT_PROG');
end;
/


create or replace procedure p6 is
pragma autonomous_transaction;
begin
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (300, 'john', 'doe', 'john.doe@company.com', sysdate, 'IT_PROG');
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (301, 'jane', 'doe', 'jane.doe@company.com', sysdate, 'IT_PROG');
end;
/


create or replace procedure p6 is
pragma autonomous_transaction;
begin
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (300, 'john', 'doe', 'john.doe@company.com', sysdate, 'IT_PROG');
insert into emp (employee_id, first_name, last_name, email, hire_date, job_id) values (301, 'jane', 'doe', 'jane.doe@company.com', sysdate, 'IT_PROG');
commit;-- it is mandatory to commit the transaction in autonomous transaction because it is independent of the main transaction.
end;
/


exec p5;-- it will insert the records into the emp table but it will not commit the transaction because it is not an autonomous transaction so the records will be inserted but they will not be visible to other transactions until the main transaction is committed.
exec p6;-- it will insert the records into the emp table and commit the transaction because it is an autonomous transaction so the records will be inserted and they will be visible to other transactions immediately because it is an autonomous transaction.



/*so it is used to execute a single sql statement, it is not used to execute multiple sql statements because it is an autonomous transaction and it is independent of the main transaction so it can execute only one sql statement and then it will commit or roll back the transaction and then it will exit from the procedure. if we want to execute multiple sql statements we can use a normal procedure without autonomous transaction and then we can commit or roll back the transaction at the end of the procedure.*/




