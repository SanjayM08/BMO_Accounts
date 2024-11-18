-- JOINS  
--  in order to fetch te records from more than one table we will go with joins

-- 1 INNER JOINS
-- 2 OUTER JOINS
--       LEFT OUTER JOINS
--      RIGHT OUTER JOINS
--       FULL OUTER JOINS
-- 3 CROSS JOINS
-- 4 SELF JOINS

create table course(
cid number,
cname varchar2(20));

select * from course;

create table students(
sid number,
sname varchar2(20),
cid number);

select * from students;

insert all 
into course values (1,'slq')
into course values (2,'plslq')
into course values (3,'python')
into course values (4,'java')
into course values (5,'html')
select * from dual;

select * from course;

/*
CID  CNAME
1	 sql
2	 plsql
3	 python
4	 java
5	 html
*/




insert all 
into students values (1,'a',1)
into students values (2,'b',1)
into students values (3,'c',3)
into students values (4,'d',4)
into students values (5,'e',null)
select * from dual;

select * from students;

/*
SID SNAME CID
1	 a	  1 
2	 b	  1
3	 c	  3
4	 d	  4
5	 e	  null
*/


update course
set cname = 'sql'
where cid =1;

update course
set cname = 'plsql'
where cid =2;




-- INNER JOINS
-- only matched recods from both tables

-- " select students.sname, course.cname, students.cid
-- from course, students
-- where course.cid = student.cid; "

select s.sname, c.cname, s.cid
from  students s inner join course c
on s.cid =  c.cid
order by s.sname;

/*
SNAME CNAME   CID
a	  sql	  1
b  	  sql     1
c  	  python  3
d	  java	  4
*/



-- OUTER JOINS
-- LEFT OUTER JOINS
-- matched records from both the tables and unmatched records from left side tables
-- all records from left side table and matched records from right side table 

-- " select students.sname, course.cname, students.cid
-- from students,course
-- where student.cid = course.cid(+); "

select s.sname, c.cname, s.cid
from  students s left outer join course c
on c.cid =  s.cid
order by s.sname;

/*
SNAME CNMAE  CID
a	 sql	  1
b	 sql	  1
c	 python	  3
d	 java	  4
e	 null	  null
*/

-- OUTER JOINS
-- RIGHT OUTER JOINS
-- matched records from both the tables and unmatched records from right side tables
-- all records from right side table and matched records from left side table 

-- " select students.sname, course.cname, students.cid
-- from students,course
-- where student.cid;(+) = course.cid "

select s.sname, c.cname, s.cid
from  students s right outer join course c
on c.cid =  s.cid
order by s.sname;

/*
SNAME CNAME    CID
a	   sql   	1
b	   sql	    1
c	  python	3
d	   java	    4
NULL   html	   NULL
NULL   plsql   NULL
*/


-- OUTER JOINS
-- FULL OUTER JOINS
-- matched and unmatched records from both tables

select s.sname, c.cname, s.cid
from  students s full outer join course c
on c.cid =  s.cid
order by s.sname;

/*
SNAME  CNAME   CID
a	    sql	    1
b	    sql	    1
c	   python	3
d	   java	    4
e		NULL    NULL
NULL    html	NULL
NULL    plsql	NULL
*/

drop table course;
drop table students;