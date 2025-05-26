select * from emp2_2;
select * from emp_inc;

--we can entered a few extra records in emp2_2 table in the previous files
--let's delete them

delete from emp2_2
where EID = 'I1136';

delete from emp2_2
where EID = 'I1137';

delete from emp2_2
where EID = 'I1138';

delete from emp2_2
where EID = 'I1139';

select * from emp2_2;
--132 records 

select * from emp_inc;

delete from emp_inc
where EID = 'I1135';

select * from emp_inc;
--79 records

--in emp_inc table, salary is in varchar datatype which should be in int datatype
alter table emp_inc
alter column salary int;

select * from  emp_inc
where salary between 100000 and 200000;
--25 records

select * from  emp2_2
where city in ('Delhi', 'Pune', 'Dehradun');
--104 records

select distinct city from  emp2_2;
--7 records

select * from  emp2_2
where city not in ('Delhi', 'Pune', 'Dehradun');
--28 records

select * from  emp2_2
where city = 'Delhi';
--34 records

select * from  emp2_2
where city = 'Pune';
--58 records

select * from  emp2_2
where city = 'Dehradun';
--12 records

--write a query to see how many employees are there in each city
select city,
count(1) as no_of_emp
from emp2_2
group by city;

select * from emp_inc;
--write a query to display unique department
select dept,
count(1) as no_of_emp
from emp_inc
group by dept;

--write a query to display total amount of salary department
select dept,
sum(salary) as total_amount
from emp_inc
group by dept;

--write a query to display average amount of salary department
select dept,
avg(salary) as avg_amount
from emp_inc
group by dept;

--write a query to display maximum amount of salary department
select dept,
max(salary) as max_amount
from emp_inc
group by dept;

--write a query to display minimum amount of salary department
select dept,
min(salary) as min_amount
from emp_inc
group by dept;

--write a query to display total amount of salary department of manager
select dept,
sum(salary) as total_amount
from emp_inc
where desi = 'Manager'
group by dept;

--write a query to display average amount of salary department of manager
select dept,
avg(salary) as avg_amount
from emp_inc
where desi = 'Manager'
group by dept;

select * from emp_inc;
--write a query to display average amount of salary department of manager and average salary >50000
select dept,
avg(salary) as avg_amount
from emp_inc
where desi = 'Manager' and salary >50000
group by dept;
