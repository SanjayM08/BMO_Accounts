DDL -- auto commit

create
drop
alter
trunacte


DML  -- user commit

update
insert
delete

DQL  

select

DCL

rollback
savepoint
commit

TCL

grant
revoke


--datatype

char
varchar
varchar2  -- 4000 bytes

number
int
decimal

date        -- DD-MM-YYYY
timpstamp   -- DD-MM-YYYY HH:MM:SS

select systimestamp from dual;

long - 2gb
clob - character larger object -- 4gb
blob - binary large object -- 4gb -- video file, audio file, image file, doc


--constraints; it will set some rules before insering data into the table

primary key     - it will satisfy both unique and not null constraints property -- we can use only one PK in a table
unique          - it will allow only unique values to the table
not null        - it will not allow to insert null
check           - 
foreign key     - 



create table students_01
(
std_id number primary key,
std_name varchar2(30),
age number  check (age >= 18),
joining_date date,
address varchar2(50)
);


drop table students_01;


insert into students_01 values (01,'praveen',20,'20-11-2024','erode');
insert into students_01 values (02,'keshav',30,'20-11-2024','erode');
insert into students_01 values (03,'murali',18,'20-11-2024','erode');
insert into students_01 values (100,'murali',17,'20-11-2024','erode');


select * from students_01;


-- foreign key



create table persons  -- parent table 
(
PersonID number primary key,
person_name varchar2(100)
);

select * from  persons;

CREATE TABLE Orders ( ---- child table
    OrderID number NOT NULL,
    PersonID number,
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

select * from Orders;

alter table orders drop constraint FK_PersonOrder;


select * from user_constraints
where constraint_name = 'FK_PersonOrder';


insert into persons values (01,'murali');
insert into persons values (02,'praveen');
insert into persons values (03,'shankar');
insert into persons values (04,'sanjay');

insert into orders values (1001, 01);
insert into orders values (100871, 02);
insert into orders values (1032451, 04);

select * from persons;

delete persons where personid = 04;
delete orders where personid = 04;


select * from persons;
select * from orders;



drop table persons;

drop table orders;


select * from locations;


normalization;

1 NF
2 NF

security
data volume



create table POP(
POP_ID number unique,
POP_name varchar2(100) not null,
POP_pho_no  number,
Pop_Domain varchar2(100),
Pop_managerID number Primary key,
POP_date date,
POP_emails varchar2(100),
POP_reminder_name varchar2(100));

drop table ppopp;

insert into pop values(1,'pravin',5380273875,'mech',100,'07-02-2002','pravindia345@gmail.com','M');
insert into pop values(2,'kavin',5380273875,'civil',101,'08-02-2002','kavinndia345@gmail.com','M');


select * from pop;


create table mpop(
MPOP_ID number unique,
MPOP_name varchar2(100) not null,
MPOP_pho_no  number,
MPop_Domain varchar2(100),
MPOP_date date,
MPOP_emails varchar2(100),
MPOP_reminder_name varchar2(100),
Pop_managerID number,
    
CONSTRAINT FKK FOREIGN KEY(Pop_managerID)
REFERENCES POP(Pop_managerID));

select * from mpop;
select * from pop;


insert into mpop values(1,'pravin',5380273875,'cse','07-02-2002','pravindia345@gmail.com','M',100);
insert into mpop values(2,'kavin',5380273875,'eee','08-02-2002','kavinndia345@gmail.com','M',100);

select * from mpop;
select * from pop;

truncate table pop;

alter table mpop drop constraint FKK;

alter table mpop add constraint FKK foreign key (POP_managerID) references pop(POP_managerID);

-- ALTER TABLE mpop
-- ADD CONSTRAINT FKK FOREIGN KEY (POP_managerID) REFERENCES AnotherTable(ManagerID);


select * from user_constraints
where table_name = 'MPOP';


drop table mpop;
drop table pop;