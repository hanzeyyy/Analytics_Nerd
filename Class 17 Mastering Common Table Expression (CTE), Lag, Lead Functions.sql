---common table expression (CTE)---
--with CTE, we can create temporary table which is valid for that session
with cte 
as
	( select *,
	  row_number() over(order by score desc) as row_num
	  from trainees1
	)
select * from cte
where row_num < 3;

with cte 
as
	( select *,
	  row_number() over(order by score desc) as row_num
	  from trainees1
	)
select id_no, row_num from cte
where row_num <= 4;

create table emp_sales
(
	emp_id int,
	emp_name varchar(20),
	sales_cost int	
);

insert into emp_sales values (1, 'Joy Bandy', 72000);
insert into emp_sales values (2, 'Johnny Smith', 70400);
insert into emp_sales values (3, 'Arjun Kambli', 84700);
insert into emp_sales values (4, 'Sriparna Jovi', 63000);
insert into emp_sales values (1, 'Dhiman Smith', 78995);
insert into emp_sales values (1, 'Manju Gowth', 46180);

select * from emp_sales;

---lag(column name)---
select emp_id,
sales_cost as present_sales,
lag(sales_cost) over(order by sales_cost) as previous_sales
from emp_sales;

--lead(column name)
select emp_id, emp_name,
sales_cost as present_sales,
lag(sales_cost) over(order by sales_cost) as previous_sales,
lead(sales_cost) over(order by sales_cost) as next_sales
from emp_sales;

--what is the difference between present and next sales
select emp_id, emp_name,
sales_cost as present_sales,
lag(sales_cost) over(order by sales_cost) as previous_sales,
lead(sales_cost) over(order by sales_cost) as next_sales,
sales_cost - lag(sales_cost) over(order by sales_cost) as difference_of_sales
from emp_sales;
