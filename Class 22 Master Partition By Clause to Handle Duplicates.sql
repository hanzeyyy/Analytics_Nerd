---common table expression---
with my_cte as
	(select e1.eid, e1.name, e1.city, e1.phone, 
	 e2.dept, e2.desi, e2.salary,
	 e2.salary*.11 as salary_11, 
	 e2.salary*.19 as salary_19
	 from emp2_2 e1
	 inner join emp_inc e2 on e1.eid = e2.eid)
select *,
(salary+salary_11+salary_19) as total_salary,
(salary+salary_11) as hand_salary
from my_cte

--duplicates
create table my_duplicates
(
	emp_id char(1),
	emp_name varchar(10),
	emp_age int
);

insert into my_duplicates values ('1', 'John',	41), ('1', 'John',	41), 
('2', 'Jack', 39), ('2', 'Jack', 39), ('3', 'Sam', 31), ('3', 'Sam', 31);

select * from my_duplicates;

select emp_name, 
count(*) as duplicates
from my_duplicates
group by emp_name
having count(*) > 1;

select emp_id, emp_name, emp_age,
row_number() over(partition  by emp_id, emp_name, emp_age order by (select 0)) as row_num
from my_duplicates;

with cte as
	(select emp_id, emp_name, emp_age,
	row_number() over(partition  by emp_id, emp_name, emp_age order by (select 0)) as row_num
	from my_duplicates)
select * from cte;

with cte as
	(select emp_id, emp_name, emp_age,
	row_number() over(partition  by emp_id, emp_name, emp_age order by (select 0)) as row_num
	from my_duplicates)
delete from cte
where row_num > 1;

select * from my_duplicates;
