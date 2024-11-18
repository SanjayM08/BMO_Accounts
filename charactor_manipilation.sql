-- 12/11/2024

-- Single Row Function

--- Charactor Manipulation
-- Upper, Lower, Initcap, Length, Substr, Instr, Replace, Translate, Concat, Trim.


-- UPPER
select upper ('oracle') from dual;

select first_name,upper(first_name) from employees;

-- LOWER
select lower ('ORACLE') from dual;

select first_name,lower(first_name) from employees;

-- INITCAP

select initcap ('apple') from dual;
select initcap ('orange') from dual;

-- LENGTH

select length ('qwertyuiopasdfghjklzxcvbnm') from dual;

-- SUBSTR

select substr ('oracle',4) from dual;

o r a c l e
1 2 3 4 5 6


select substr ('oracle', 4, 2) from dual;


-- INSTR

M A L A Y A L A M
1 2 3 4 5 6 7 8 9

select instr ('malayalam','a') from dual;   ==>2nd position

select instr ('malayalam','a',5) from dual; ==> 6th position

select instr ('malayalam','a',1,2) from dual; start from 1 and which is 2ndth position



select length (substr('oracle',instr('oracle','a'))) from dual;



-- REPLACE

select replace ('oracle','cl','@#') from dual;  ==>'ora@#e'

select replace ('oracle','cle','@#') from dual; ==>'ora@#'

select replace ('oracle','cle','#') from dual; ==>'ora#'

select replace ('oracle','cle') from dual; ==>'ora'

select replace ('claoraclalecla','cla','#') from dual; ==> '#ora#le#'

-- TRANSLATE

select translate ('oracle','oae','@#$') from dual; ==>'@r#cl$'


-- CONCAT

select concat ('hi','hello') from dual;

select concat ('hi',(concat(' ','hello'))) from dual;


select 'hi'||' '||'hello'||' ' ||'.'from dual;


-- TRIM

select trim ('  oracle  ') from dual; ==> 'oracle'

select trim ('  ora  cle  ') from dual; ==> 'ora  cle'

select trim ('a' from 'aoracleaaa') from dual; ==> 'oracle'

select trim (leading 'a' from 'aoraclea') from dual; ==> 'oraclea'

select trim (trailing 'a' from 'aoraclea') from dual; ==> 'aoracle'

select trim (trailing 'a' from 'aoracleaaaa') from dual; ==> 'aoracle'

select rtrim (' oracle ') from dual; ==> ' oracle'

select ltrim (' oracle ') from dual; ==> 'oracle '

