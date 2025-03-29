create or replace function f1 (a number) return number as 
b number;
begin
b := a*2;
return b;

--dbms_output.put_line(c);
end;
/
select f1(2) from dual;

set serveroutput on;

declare
d number;
c number := &c;
begin
p1(c,d);
end;
/


/**/



declare 
a number;
s varchar2(50);
begin
select first_name into s from employees where employee_id = (select length('sanjay')*(100-70) from dual);
select salary into a from employees where employee_id = (select length('sanjay')*(100-70) from dual);
-- a:=10;
-- s:='Sanjay';
dbms_output.put_line(s|| ' salray ' ||a);
end;
/

select * from employees where employee_id = (select length('sanjay')*30 from dual);

select length('sanjay')*(100-70) from dual;















-- %type

declare 
v_name employees.first_name%type;
v_sal employees.salary%type;
begin
select first_name,salary into v_name,v_sal from employees where employee_id = 101;
dbms_output.put_line(v_name||' '||v_sal);
end;
/

-- %rowtype
declare 
v_name employees%rowtype;
begin
select * into v_name from employees where employee_id = 101;
dbms_output.put_line(v_name.first_name || '"s ' || v_name.salary);
end;
/



-- %records
declare 
type r is record (first_name varchar2(30),salary number);
v_name r;
begin
select first_name,salary into v_name from employees where employee_id = 101;
dbms_output.put_line(v_name.first_name || '"s ' || v_name.salary);
end;
/





-- if 

declare
a number :=10;
begin
if mod(a,2)=0 then 
dbms_output.put_line('Even');
end if;
end;
/

-- if else

declare
a number :=&a;
begin
if mod(a,2)=0 then 
dbms_output.put_line('Even');
else
dbms_output.put_line('Odd');
end if;
end;
/

-- elsif

declare
a number :=&a;
begin
if mod(a,2)=0 then 
dbms_output.put_line('Even');
elsif mod (a,2)!=0 then
dbms_output.put_line('Odd');
else 
dbms_output.put_line('Null');
end if;
end;
/


-- Nested If

declare
num1 number :=null;
begin
if num1 is not Null then
    if num1 >= 18 and num1 <=60 then 
        dbms_output.put_line('Eligible coz your age is '|| num1);
    elsif num1 < 18 then
        dbms_output.put_line('Not Eligible coz your age is '|| num1);
    else
        dbms_output.put_line('Not Eligible coz your age is '|| num1);
    end if;
else
dbms_output.put_line('Null');
end if;
end;
/



-- Loop


declare
a number := 10;
begin
loop
    a := a-1;
    dbms_output.put_line(a);
    exit when a = 1;
end loop;
end;
/


declare
a number := 10;
begin
loop
a := a-1;
exit when a = 1; 
dbms_output.put_line(a);
end loop;
end;
/

-- while 

declare 
a number := 10;
begin
while a > 0 loop
dbms_output.put_line(a);
a:=a-1;
end loop;
end;
/

set serveroutput on;


-- for loop 

begin 

for i in 1..10 loop
dbms_output.put_line(i);
end loop;
end;
/


declare
a number;
begin 
for i in 1..10 loop
a:=0;
while a<2 loop
a:=a+1;
dbms_output.put_line(a);
end loop;
dbms_output.put_line(i);
end loop;
end;
/


-- Triggers
-- DML Table level Triggers
create or replace trigger tri_simple
before update on superheroes
for each row 
enable
declare 
v_user varchar2(30);
begin
select user into v_user from dual;
dbms_output.put_line('You update a row in superherowes '|| v_user);
end;
/

create table superheroes(hero_name varchar2(30));

insert into superheroes values ('Iron man');

select e.*,rowid from superheroes e;

delete from superheroes where rowid = 'AAASWrAAEAAAAKUAAA';

update superheroes set hero_name  = 'ANT MAN' where rowid = 'AAASWrAAEAAAAKUAAE' ;


-- DDL Triggers Shcema Level Triggers

