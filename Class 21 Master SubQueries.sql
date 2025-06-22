---subquery---
--query within a query
select *
from emp2_2 
where EID in (select eid
			 from emp_inc
			 where DESI = 'Associate') 
;
--works for only one sub column


/*
select *
from emp2_2 
where EID = (select eid
			 from emp_inc
			 where DESI = 'Associate') 
;
--error: Subquery returned more than 1 value. 
This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
*/


select *
from emp2_2 
where EID = (select eid
			 from emp_inc
			 where DESI = 'Director') 
;
--returns only one record

/*
we cannot use order by clause in inner query of a sub query
select *
from emp2_2 
where EID in (select eid
			 from emp_inc
			 where DESI = 'Associate'
			 order by city)	 
;
--error: The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries,
and common table expressions, unless TOP, OFFSET or FOR XML is also specified.
because rows in a table (or in a subquery in the FROM clause) do not come in any specific order.
*/
select *
from emp2_2 
where EID in (select eid
			 from emp_inc
			 where DESI = 'Associate')
order by city;

select * from emp_inc;
select * from emp2_2;
--write a query to find the salary structure of employee in pune born in 2020
select eid, dept, desi, salary
from emp_inc
where eid in (select eid from emp2_2 
			  where city = 'Pune' and year(dob) = 2020)
order by salary asc;

--with joins
select salary 
from emp_inc e1
inner join (select eid
	   from emp2_2
	   where city = 'Pune' and year(dob) = 2020) e2 
on e1.eid = e2.eid
order by e1.SALARY asc;

--write a query to find the salary structure of employee in pune in HRD dept
select eid, dept, desi, salary
from emp_inc
where eid in (select eid
			  from emp2_2
			  where city = 'Pune') and dept = 'HRD'
order by salary asc;

---correlated subquery---
--'exits' operator: multiple sub columns
select eid, desi, dept, salary
from emp_inc
where exists (select * 
			  from emp2_2
			  where dept = 'MISC')
;

select eid, desi, dept, salary
from emp_inc
where exists (select * 
			  from emp2_2
			  where dept = 'Operns')
;


--insert through subquery
create table upskilling
(
	emp_id char(5), 
	emp_name varchar(40),
	emp_dept varchar(35),
	sub_name varchar(35)
);

insert into upskilling (emp_id, emp_name, emp_dept)
select eid, name, dept
from (select e1.eid, e1.name, e2.dept 
	  from emp2_2 e1
	  inner join emp_inc e2
	  on e1.eid = e2.eid
	  where e2.dept = 'misc') as subquery
;

select * from upskilling;


--delete operation using subquery
delete from upskilling
where emp_id in (select eid from emp_inc
				 where desi = 'associate')
;

select * from upskilling;

--update query using subquery
--increment the salaries of employees from pune
update emp_inc 
set salary = salary + 35000
where eid in (select eid 
			  from emp2_2
			  where city = 'pune')
;

select * from emp_inc
where eid in (select eid 
			  from emp2_2
			  where city = 'pune')
;
