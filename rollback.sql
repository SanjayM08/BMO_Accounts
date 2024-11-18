DDL - data definition language  -- auto commit

create
drop
alter
truncate


DML - data manupulation language  -- user commit or manual commit

insert
update
delete   

DCL - data control language

commit
savepoint
rollback

DQL - data query language

select

TCL - transaction control language

grant
revoke




create table student_15 
(
std_id number,
std_name varchar2(100),
joining_date date,
address varchar2(100)
);

drop table student_15;

select * from student_15;

insert into student_15 values (01,'keshav','15-11-2024','erode'); 
insert into student_15 values (02,'murali','15-11-2024','chennai'); 
insert into student_15 values (03,'ragul','15-11-2024','chennai');
insert into student_15 values (04,'shankar'); 

insert into student_15 (std_id,std_name) values (04,'shankar');

insert all
into student_15 values (01,'keshav','15-11-2024','erode')
into student_15 values (02,'murali','15-11-2024','chennai')
into student_15 values (03,'siva','15-11-2024','chennai')
select * from dual;


--update
select * from student_15;

update student_15 set joining_date = '10-11-2024' where std_id = 1;

update student_15 set joining_date = '10-11-2024' ;

update student_15 set joining_date = '30-11-2024',address = 'madurai' where std_id = 1;


--delete

select * from student_15;

delete from student_15 where std_name = 'siva' and address = 'trichy';

delete from student_15;

rollback;

truncate table student_15;

commit;


select * from student_15;

update student_15 set joining_date = '10-11-2000' where std_id = 1;

savepoint s1;

delete from student_15 where std_name = 'murali' ;

savepoint s2;

insert into student_15 values (10,'ragul','15-11-2024','chennai');

savepoint s3;

update student_15 set address = 'karur' where std_id = 10;


rollback to s1;


table -1  -- ddl -- auto commi
insert -- dml
update -- dml
delete -- dml -- wrong
delete -- dml

table -2  -- auto commit

rollback;
