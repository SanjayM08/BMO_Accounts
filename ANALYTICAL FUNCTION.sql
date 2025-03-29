ANALYTICAL FUNCTION:

It compute an aggregate values based on group of rows;

1--RANK()
2--DENSE_RANK()
3--ROW_NUMBER()
4--LEAD()
5--LAG()


RANK:

It is used to return the rank of the values in a group of values.
It skip the ranking if there is tie between ranks.

Syntax:
Select rank()
Over(PARTITION BY partition column ORDER BY order by column asc|desc)
From table_name;

Example 1
Select first_name,department_id,salary,
Rank() over(order by salary desc) as salary_rank
From employees;

Example 2
Select first_name,department_id,salary,
Rank() over(partition by department _id order by salary desc) as salary_rank
From employees;


Dense_rank:
It is used to return the rank of the values in a group of values.
It generate ranks continuously even if there is a tie between ranks.

Syntax:
Select dense_rank()
Over(PARTITION BY partition column ORDER BY order by column asc|desc)
From table_name;

Example:
Select first_name,department_id,salary,
Dense_Rank() over(partition by department _id order by salary desc) as salary_rank
From employees;

LEAD:
It returns values form the next row the table 

Syntax:
Select lead(expression,offset)
Over(order by ordering_columns asc|desc)
From table_name;

Example:
Select first_name,department_id,salary,
lead (salary,1) over(order by salary asc) as sal_lead
From employees;

Select first_name,department_id,salary,
lead (salary,1) over(partition by department_id order by salary asc) as sal_lead
From employees;


LAG:
It returens values from the previous row in the table
Syntax:
Select lead(expression,offset)
Over(order by ordering_columns asc|desc)
From table_name;

Example:
Select first_name,department_id,salary,
lag (salary,1) over(order by salary asc) as sal_lead
From employees;


Row_number():
It returns unique row number to each row within the partition of a result set


Example:
Select first_name,department_id,salary,
row_number() over(partition by department_id order by salary desc) as emp_row_num
From employees;





