DDL - 

create      -- it is used to create table in the database
drop        -- it is used to remove table in the database permanantly
alter       -- it is used to alter or modify the the structure of the table
truncate    -- it will remove all the data's in the table permanently



syntax:

create table table_name (col_1 datatype constraints,..................n);


create table students_01 
(
std_name varchar2(50),
std_age number,
joining_date date,
address varchar2(50)
);


datatypes:


--character

char        -- a-z,A-Z,1-0,!@#$%^&*()_(   ) -- 2000 bytes --  'siva' -- s-1 byte, i-1byte, v-1bytes,, char(10) -- siva -- it will reserve the memory
varchar     -- a-z,A-Z,1-0,!@#$%^&*()_(   ) -- 2000 bytes --   varchar2(2000) -- siva - 4bytes  -- balence 6 bytes free -- older version
varchar2    -- a-z,A-Z,1-0,!@#$%^&*()_(   ) -- 4000 bytes --   varchar2(10) -- siva - 4bytes  -- balence 6 bytes free
nvarchar2   -- a-z,A-Z,1-0,!@#$%^&*()_(   ) -- 4000 bytes --   varchar2(10) -- siva - 4bytes  -- balence 6 bytes free  -- it will support unicode data
nvarchar    -- a-z,A-Z,1-0,!@#$%^&*()_(   ) -- 4000 bytes --   varchar2(10) -- siva - 4bytes  -- balence 6 bytes free  -- it will support unicode data  -- older version
long varchar  -- a-z,A-Z,1-0,!@#$%^&*()_(   ) -- 2gb bytes --   varchar2(10) -- siva - 4bytes  -- balence 6 bytes free  -- for extentable 32k bytes



--numeric

number          -- 1-0 ,, 37 -- 1234567891234567891234567891234567890 ,, 1 , 1.0
int (integers)  -- 1-0 ,, 37 -- 1234567891234567891234567891234567890  ,, 1
decimal         -- 1-0 ,, 37 -- 1234567891234567891234567891234567890  , 1.000

--date

date            -- DD-MM-YYYY
timestamp       -- DD-MM-YYYY HH-MM-SS


long                                    -- a-z,A-Z,1-0,!@#$%^&*()_(   ) -- 2gb bytes --   varchar2(10) -- siva - 4bytes  -- balence 6 bytes free
BLOB - binary large object              -- video, audio, image, doc     -- 4gb
CLOB(a table have only one clob) - character large object           -- a-z,A-Z,1-0,!@#$%^&*()_(   ) -- 4gb bytes --   varchar2(10) -- siva - 4bytes  -- balence 6 bytes free



--constraints

primary key     -- it is an combination of unique and not null,, we can use only one PK in a table
unique          -- it will allow only unique data into the table
not null        -- it will not allow null into the table
check           -- it will check the data befor it insert based on the give logic
foreign key     --


select * from employees;

desc employees;


create table students_01 
(
std_id number primary key,
std_name varchar2(50) not null,
std_age number check (std_age >= 18),
joining_date date,
address varchar2(50)
subject varchar2(50)
);


drop table students_01;

select * from students_01;

desc students_01;





insert into students_01 values (01,'siva',20,'12-11-2024','chennai');
insert into students_01 values (02,'murali',19,'12-11-2024','chennai');
--insert into students_01 values (03,'kesavan',18,'12-11-2024','chennai');
insert into students_01 values (100,'rage',30,'12-11-2024','chennai');

truncate table students_01;


select * from students_10;

desc employees;


--alter syntax for add new column in existing table:

alter table students_01 add subject varchar2(50);

--alter syntax for drop or remove existing column in existing table:

alter table students_01 drop column address;

-- alter syntax for renaming existing column

alter table students_01 rename column std_id to students_id;

-- alter syntax for renaming existing table

alter table students_01 rename to students_10;

rename students_10 to students_20;
