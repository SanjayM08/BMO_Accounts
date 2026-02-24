select * from employees;


create table t1 as select * from employees where employee_id between 101 and 110;
create table t2 as select * from employees where employee_id between 106 and 115;

select * from t1;
select * from t2;

select employee_id, first_name from t1
union
select employee_id, first_name from t2;

/*
101	Neena
102	Lex
103	Alexander
104	Bruce
105	David
106	Valli
107	Diana
108	Nancy
109	Daniel
110	John
111	Ismael
112	Jose Manuel
113	Luis
114	Den
115	Alexander

*/



select employee_id, first_name from t1
union all
select employee_id, first_name from t2;

/*

101	Neena
102	Lex
103	Alexander
104	Bruce
105	David
106	Valli
107	Diana
108	Nancy
109	Daniel
110	John
106	Valli
107	Diana
108	Nancy
109	Daniel
110	John
111	Ismael
112	Jose Manuel
113	Luis
114	Den
115	Alexander


*/


select employee_id, first_name from t1
intersect
select employee_id, first_name from t2;

/*


106	Valli
107	Diana
108	Nancy
109	Daniel
110	John

*/


select employee_id, first_name from t1
minus
select employee_id, first_name from t2;

/*
101	Neena
102	Lex
103	Alexander
104	Bruce
105	David
*/


select employee_id, null from t1
union
select employee_id,first_name from t1;

/*
id  null
101	Neena
101	
102	Lex
102	
103	Alexander
103	
104	Bruce
104	
105	David
105	
106	Valli
106	
107	Diana
107	
108	Nancy
108	
109	Daniel
109	
110	John
110	

*/

select employee_id,first_name from t1
union
select employee_id,null from t1;


/*

id  name
101	Neena
101	
102	Lex
102	
103	Alexander
103	
104	Bruce
104	
105	David
105	
106	Valli
106	
107	Diana
107	
108	Nancy
108	
109	Daniel
109	
110	John
110	

*/



