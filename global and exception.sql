-- GLOBAL VARIABLE DECLARAION


create or replace package pk1
as 
a number;
procedure p1;
procedure p2;
end;
/

create or replace package body pk1
as

procedure p1
as 
begin a:=5;
dbms_output.put_line(' Procedure P1 is Inside Package '||a);
end p1;

procedure p2
as 
begin 
a:=a+a;
dbms_output.put_line(' Procedure P2 is Inside Package '||a);
end p2;

end;
/

exec pk1.p1;
exec pk1.p2;

create or replace procedure p3
as
begin
dbms_output.put_line(' Procedure P3 is Outside Package '||pk1.a);
end;
/

exec p3;









--------------------------
-- GLOBAL VARIABLE DECLARAION


create or replace package pkp1
as 
a number;
procedure p1;
procedure p2;
procedure p3;
end;
/

create or replace package body pkp1
as

procedure p1
as 
begin a:=5;
dbms_output.put_line(' Procedure P1 is Inside Package '||a);
end p1;

procedure p2
as 
begin 
a:=a+a;
dbms_output.put_line(' Procedure P2 is Inside Package '||a);
p3;
p4;
end p2;

procedure p3
as 
begin 
dbms_output.put_line(' Procedure P3 is Inside Package '||a);
end p3;

end;
/

create or replace procedure p4
as 
begin 
dbms_output.put_line(' Procedure P4 is outside Package ');
end;
/

exec pkp1.p1;
exec pkp1.p2;
exec pkp1.p3;
exec p4;



--  Exception with Others

CREATE OR REPLACE PROCEDURE P1 
AS 
V_NUM NUMBER;
BEGIN 
SELECT DEPARTMENT_ID INTO V_NUM  FROM EMPLOYEES  WHERE EMPLOYEE_ID=101;
DBMS_OUTPUT.PUT_LINE(V_NUM);
V_NUM  := V_NUM/0;
EXCEPTION WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE(SQLERRM);
--DBMS_OUTPUT.PUT_LINE('ERROR');
END;
/

EXEC P1;



exec p1;



