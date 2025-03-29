create or replace package pk1
as
procedure p1 (a in  number);
function f1 return number;        -- Specification Part
procedure p2;
end;
/



create or replace package body pk1
as
procedure p1 (a in number)
as
begin
dbms_output.put_line('Inside P1 '  a);
end p1;

function f1 return number
as 
v_out number;
begin
dbms_output.put_line('Inside F1 ');   -- Declaration
return 5;
end f1;

procedure p2
as
begin
dbms_output.put_line('Inside P2 ');
end p2;
end;
/


declare
v_out number;
begin 
pk1.p1(6);
pk1.p2;
v_out :=pk1.f1;
dbms_output.put_line(v_out);
end;
/


set serveroutput on;



create or replace package pk2
as
procedure p1;
function f1 return number;        -- Specification Part
end;
/



create or replace package body pk2
as
procedure p2;
procedure p1
as
begin
dbms_output.put_line('Inside P1 ');
p2;
end p1;

function f1 return number
as 
v_out number;
begin
dbms_output.put_line('Inside F1 ');   -- Declaration
return 5;
end f1;

procedure p2
as
begin
dbms_output.put_line('Inside P2 ');
end p2;
end;
/


declare
v_out number;
begin 
pk2.p1;
v_out :=pk2.f1;
dbms_output.put_line(v_out);
end;
/
exec pk2.p1;






-- OverLoading



create or replace package pk3
as
procedure p1;
procedure p1(a in number);
procedure p1(a in number ,b in number);
procedure p1(a in number , b in varchar2);
end;
/


create or replace package body pk3
as

procedure p1
as
begin
dbms_output.put_line('Inside PK3 P1');
end p1;

procedure p1(a in number)
as 
begin
dbms_output.put_line('Inside PK3 P1 ' a);
end p1;

procedure p1(a in number ,b in number)
as 
begin
dbms_output.put_line('Inside PK3 P1 ' a  b);
end p1;

procedure p1(a in number , b in varchar2)as 
begin
dbms_output.put_line('Inside PK3 P1 ' a  b);
end p1;
end;
/

declare
begin
pk3.p1;
pk3.p1(4);
pk3.p1(4,4);
pk3.p1(4,'sanju');
end;
/