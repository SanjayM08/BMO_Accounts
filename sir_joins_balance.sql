-- 19/11/2024

-- QNS

create table tablea(c1 number);
create table tableb(c2 number);

select * from tablea;
select * from tableb;


insert all
into tablea values(1)
into tablea values(2)
into tablea values(1)
into tablea values(3)
into tablea values(6)
into tablea values(1)
into tablea values(null)
select * from dual;

select * from tablea;


insert all
into tableb values(1)
into tableb values(4)
into tableb values(2)
into tableb values(1)
into tableb values(2)
into tableb values(5)
into tableb values(null)
into tableb values(null)
select * from dual;

select * from tableb;


select * from tablea;
select * from tableb;


-- INNER JOIN
select a.c1,b.c2
from tablea a inner join tableb b
on a.c1=b.c2
order by b.c2;

/*
c1  c2
1	1
1	1
1	1
1	1
1	1
1	1
2	2
2	2
*/



-- LEFT OUTER JOIN
select a.c1,b.c2
from tablea a left outer join tableb b
on a.c1=b.c2
order by b.c2;

/*

c1 c2
1	1
1	1
1	1
1	1
1	1
1	1
2	2
2	2
3	null
6	null
null null

*/


-- RIGHT OUTER JOIN
select a.c1,b.c2
from tablea a right outer join tableb b
on a.c1=b.c2
order by b.c2;

/*

c1      c2
1	    1
1	    1
1	    1
1	    1
1	    1
1	    1
2	    2
2	    2
null	4
null	5
null    null	
null	null

*/


-- FULL OUTER JOIN

select a.c1,b.c2
from tablea a full outer join tableb b
on a.c1=b.c2;

/*

c1      c2
1	    1
1	    1
1	    1
1	    1
1	    1
1	    1
2	    2
2	    2
null    4
null    5
null   null	
6      null	
3	   null
null   null
null   null

*/








-----

/*
CROSS JOIN
Inner Join without joining condition
cortesion product ==> output will tablea x tableb
*/


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
into course values (1,'sql')
into course values (2,'plsql')
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

select s.sname, c.cname
from course c cross join students s;

/*

sname cname
a   	sql
b   	sql
c   	sql
d   	sql
e   	sql
a   	plsql
b   	plsql
c   	plsql
d   	plsql
e	    plsql
a	    python
b	    python
c	    python
d   	python
e   	python
a   	java
b   	java
c   	java
d   	java
e   	java
a	    html
b   	html
c	    html
d	    html
e	    html

*/




/*
SELFT JOIN 
    Joinig the table with it self is called self join
*/


select * from employees;

select e.employee_id, e.first_name, e.manager_id 
from employees e;

select m.employee_id, m.first_name
from employees m;


select e.employee_id, e.FIRST_NAME, m.FIRST_NAME
from employees e inner join employees m
on e.manager_id = m.employee_id
order by e.employee_id;




/*

101	Neena	Steven
102	Lex	Steven
103	Alexander	Lex
104	Bruce	Alexander
105	David	Alexander
106	Valli	Alexander
107	Diana	Alexander
108	Nancy	Neena
109	Daniel	Nancy
110	John	Nancy
111	Ismael	Nancy
112	Jose Manuel	Nancy
113	Luis	Nancy
114	Den	Steven
115	Alexander	Den
116	Shelli	Den
117	Sigal	Den
118	Guy	Den
119	Karen	Den
120	Matthew	Steven
121	Adam	Steven
122	Payam	Steven
123	Shanta	Steven
124	Kevin	Steven
125	Julia	Matthew
126	Irene	Matthew
127	James	Matthew
128	Steven	Matthew
129	Laura	Adam
130	Mozhe	Adam
131	James	Adam
132	TJ	Adam
133	Jason	Payam
134	Michael	Payam
135	Ki	Payam
136	Hazel	Payam
137	Renske	Shanta
138	Stephen	Shanta
139	John	Shanta
140	Joshua	Shanta
141	Trenna	Kevin
142	Curtis	Kevin
143	Randall	Kevin
144	Peter	Kevin
145	John	Steven
146	Karen	Steven
147	Alberto	Steven
148	Gerald	Steven
149	Eleni	Steven
150	Peter	John
151	David	John
152	Peter	John
153	Christopher	John
154	Nanette	John
155	Oliver	John
156	Janette	Karen
157	Patrick	Karen
158	Allan	Karen
159	Lindsey	Karen
160	Louise	Karen
161	Sarath	Karen
162	Clara	Alberto
163	Danielle	Alberto
164	Mattea	Alberto
165	David	Alberto
166	Sundar	Alberto
167	Amit	Alberto
168	Lisa	Gerald
169	Harrison	Gerald
170	Tayler	Gerald
171	William	Gerald
172	Elizabeth	Gerald
173	Sundita	Gerald
174	Ellen	Eleni
175	Alyssa	Eleni
176	Jonathon	Eleni
177	Jack	Eleni
178	Kimberely	Eleni
179	Charles	Eleni
180	Winston	Matthew
181	Jean	Matthew
182	Martha	Matthew
183	Girard	Matthew
184	Nandita	Adam
185	Alexis	Adam
186	Julia	Adam
187	Anthony	Adam
188	Kelly	Payam
189	Jennifer	Payam
190	Timothy	Payam
191	Randall	Payam
192	Sarah	Shanta
193	Britney	Shanta
194	Samuel	Shanta
195	Vance	Shanta
196	Alana	Kevin
197	Kevin	Kevin
198	Donald	Kevin
199	Douglas	Kevin
200	Jennifer	Neena
201	Michael	Steven
202	Pat	Michael
203	Susan	Neena
204	Hermann	Neena
205	Shelley	Neena
206	William	Shelley

*/



------------------------


select * from employees;
select * from departments;
select * from locations;
select * from jobs;


select e.first_name, j.job_title, d.department_name, l.city
from employees e inner join departments d on e.department_id = d.department_id
inner join locations l on d.location_id= l.location_id
inner join jobs j on e.job_id = j.job_id;

/*

Steven	President	Executive	Seattle
Lex	Administration Vice President	Executive	Seattle
Neena	Administration Vice President	Executive	Seattle
Jennifer	Administration Assistant	Administration	Seattle
Nancy	Finance Manager	Finance	Seattle
Luis	Accountant	Finance	Seattle
Jose Manuel	Accountant	Finance	Seattle
Ismael	Accountant	Finance	Seattle
John	Accountant	Finance	Seattle
Daniel	Accountant	Finance	Seattle
Shelley	Accounting Manager	Accounting	Seattle
William	Public Accountant	Accounting	Seattle
Eleni	Sales Manager	Sales	Oxford
Gerald	Sales Manager	Sales	Oxford
Alberto	Sales Manager	Sales	Oxford
Karen	Sales Manager	Sales	Oxford
John	Sales Manager	Sales	Oxford
Charles	Sales Representative	Sales	Oxford
Jack	Sales Representative	Sales	Oxford
Jonathon	Sales Representative	Sales	Oxford
Alyssa	Sales Representative	Sales	Oxford
Ellen	Sales Representative	Sales	Oxford
Sundita	Sales Representative	Sales	Oxford
Elizabeth	Sales Representative	Sales	Oxford
William	Sales Representative	Sales	Oxford
Tayler	Sales Representative	Sales	Oxford
Harrison	Sales Representative	Sales	Oxford
Lisa	Sales Representative	Sales	Oxford
Amit	Sales Representative	Sales	Oxford
Sundar	Sales Representative	Sales	Oxford
David	Sales Representative	Sales	Oxford
Mattea	Sales Representative	Sales	Oxford
Danielle	Sales Representative	Sales	Oxford
Clara	Sales Representative	Sales	Oxford
Sarath	Sales Representative	Sales	Oxford
Louise	Sales Representative	Sales	Oxford
Lindsey	Sales Representative	Sales	Oxford
Allan	Sales Representative	Sales	Oxford
Patrick	Sales Representative	Sales	Oxford
Janette	Sales Representative	Sales	Oxford
Oliver	Sales Representative	Sales	Oxford
Nanette	Sales Representative	Sales	Oxford
Christopher	Sales Representative	Sales	Oxford
Peter	Sales Representative	Sales	Oxford
David	Sales Representative	Sales	Oxford
Peter	Sales Representative	Sales	Oxford
Den	Purchasing Manager	Purchasing	Seattle
Karen	Purchasing Clerk	Purchasing	Seattle
Guy	Purchasing Clerk	Purchasing	Seattle
Sigal	Purchasing Clerk	Purchasing	Seattle
Shelli	Purchasing Clerk	Purchasing	Seattle
Alexander	Purchasing Clerk	Purchasing	Seattle
Kevin	Stock Manager	Shipping	South San Francisco
Shanta	Stock Manager	Shipping	South San Francisco
Payam	Stock Manager	Shipping	South San Francisco
Adam	Stock Manager	Shipping	South San Francisco
Matthew	Stock Manager	Shipping	South San Francisco
Peter	Stock Clerk	Shipping	South San Francisco
Randall	Stock Clerk	Shipping	South San Francisco
Curtis	Stock Clerk	Shipping	South San Francisco
Trenna	Stock Clerk	Shipping	South San Francisco
Joshua	Stock Clerk	Shipping	South San Francisco
John	Stock Clerk	Shipping	South San Francisco
Stephen	Stock Clerk	Shipping	South San Francisco
Renske	Stock Clerk	Shipping	South San Francisco
Hazel	Stock Clerk	Shipping	South San Francisco
Ki	Stock Clerk	Shipping	South San Francisco
Michael	Stock Clerk	Shipping	South San Francisco
Jason	Stock Clerk	Shipping	South San Francisco
TJ	Stock Clerk	Shipping	South San Francisco
James	Stock Clerk	Shipping	South San Francisco
Mozhe	Stock Clerk	Shipping	South San Francisco
Laura	Stock Clerk	Shipping	South San Francisco
Steven	Stock Clerk	Shipping	South San Francisco
James	Stock Clerk	Shipping	South San Francisco
Irene	Stock Clerk	Shipping	South San Francisco
Julia	Stock Clerk	Shipping	South San Francisco
Douglas	Shipping Clerk	Shipping	South San Francisco
Donald	Shipping Clerk	Shipping	South San Francisco
Kevin	Shipping Clerk	Shipping	South San Francisco
Alana	Shipping Clerk	Shipping	South San Francisco
Vance	Shipping Clerk	Shipping	South San Francisco
Samuel	Shipping Clerk	Shipping	South San Francisco
Britney	Shipping Clerk	Shipping	South San Francisco
Sarah	Shipping Clerk	Shipping	South San Francisco
Randall	Shipping Clerk	Shipping	South San Francisco
Timothy	Shipping Clerk	Shipping	South San Francisco
Jennifer	Shipping Clerk	Shipping	South San Francisco
Kelly	Shipping Clerk	Shipping	South San Francisco
Anthony	Shipping Clerk	Shipping	South San Francisco
Julia	Shipping Clerk	Shipping	South San Francisco
Alexis	Shipping Clerk	Shipping	South San Francisco
Nandita	Shipping Clerk	Shipping	South San Francisco
Girard	Shipping Clerk	Shipping	South San Francisco
Martha	Shipping Clerk	Shipping	South San Francisco
Jean	Shipping Clerk	Shipping	South San Francisco
Winston	Shipping Clerk	Shipping	South San Francisco
Diana	Programmer	IT	Southlake
Valli	Programmer	IT	Southlake
David	Programmer	IT	Southlake
Bruce	Programmer	IT	Southlake
Alexander	Programmer	IT	Southlake
Michael	Marketing Manager	Marketing	Toronto
Pat	Marketing Representative	Marketing	Toronto
Susan	Human Resources Representative	Human Resources	London
Hermann	Public Relations Representative	Public Relations	Munich

*/

drop table course;
drop table students;
drop table tablea;
drop table tableb;