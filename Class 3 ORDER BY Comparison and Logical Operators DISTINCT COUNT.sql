select * from employee

-----order by-----
--suppose we want to see the top 3 names of employee in ascending order
select top 3 * from employee
order by emp_name;

--for descending order, use desc
select top 3 * from employee
order by emp_name desc;

select * from emp_inc;
--79 records

select * from emp_inc
where salary > 200000;
--13 records

--similarly we can use <,<=,>=,!= operators

-----logical operators-----
---between---
select * from emp_inc
where salary between 100000 and 200000; 
--25 records

select * from emp_inc
where desi = 'manager' and dept = 'operns'; 
--should satisfy both conditons

select * from emp_inc
where desi = 'manager' or dept = 'operns'; 
--should satisfy anyone conditons

select * from emp_inc
where desi like 'm%';
--11 records (people who not managers)


select * from emp_inc
where desi not like 'm%';
--68 records (people who are not managers)

select * from employee
where city in ('Delhi', 'Pune', 'Chennai');
--3 records

select city from employee;
--5 records (pune, delhi, bangalore, bangalore, chennai)

select distinct city from employee;
--4 recods (pune, delhi, bangalore, chennai)

select count(emp_id) as no_of_emp
from employee;

--drop deletes the entire table
delete from employee
where emp_id  = 'E10001';

select * from employee;
--4 records now

truncate table employee;
--delete every record from table employee

select * from employee;
--0 records
