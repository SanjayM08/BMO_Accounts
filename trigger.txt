Triggers:
         when we want any process to take place during some other transaction we will go for triggers
         
Types:
        DDL
        DML
        SYSTEM LEVEL
        
                                    TRIGGERS
                ROW                                                               STATEMENT
    BEFORE                      AFTER                                   BEFORE                  AFTER
    
    INSERT                     INSERT                                   INSERT                      INSERT   
    UPDATE                      UPDATE                   
    DELETE
    
    
    
    
    
    CREATE OR REPLACE TRIGGER TRIGGER_NAME
    BEFORE / AFTER
    INSERT OR UPDATE OR DELETE
    ON TABLE_NAME
    FOR EACH ROW --- ROW LEVEL
    DECLARE
    
    
    BEGIN
    
    
    END;
    /
    
    


CREATE TABLE T1(C1 NUMBER);

CREATE TABLE T2(C1 NUMBER);

INSERT INTO T1 VALUES (1);

SELECT * FROM T1;
SELECT * FROM T1;

CREATE OR REPLACE TRIGGER TRG_T1
BEFORE
INSERT OR UPDATE OR DELETE
ON T1
BEGIN
INSERT INTO T2 VALUES(1);
END;
/

INSERT INTO T1 VALUES(5);


UPDATE T1
SET C1 = 6;

UPDATE EMPLOYEES
SET SALARY = SALARY + 1000; ===> 107 ROWS AFFECTED

TRIGGERS 107 TIMES RUN ===> ROW LEVEL
TRIGGERS 1 TIMES RUN ===> STATEMENT LEVEL



CREATE OR REPLACE TRG_T1_ROW
BEFORE
INSERT OR UPDATE OR DELETE
ON T1
FOR EACH ROW 
BEGIN
INSERT INTO T2 VALUES (7);
END;
/


SELECT * FROM T1;
SELECT * FROM T2;


UPDATE T1 
SET C1 = 5;

TRIGGER ATTRIBUTES

:OLD
:NEW

CREATE TABLE EMP(EID NUMBER, ENAME VARCHAR, SAL NUMBER);

SELECT * FROM EMP;

CREATE TABLE E_EMP_LOG (EID NUMBER, ODL_SAL NUMBER, NEW_SAL NUMBER, USER_ID NUMBER);

CREATE OR REPLACE TRIGGER TRG_EMP
BEFORE
INSERT OR UPDATE OR DELETE
ON EMP
FOR EACH ROW 
BEGIN
INSERT INTO T_EMP_LOG VALUES(:OLD.EID, :OLD.SAL, UID);
END;
/

UPDATE EMP
SET SAL = SAL+1000
WHERE EID=1;

SELECT * FROM T_EMP_LOG;

UPDATE EMP
SET SAL = SAL + 1000;



