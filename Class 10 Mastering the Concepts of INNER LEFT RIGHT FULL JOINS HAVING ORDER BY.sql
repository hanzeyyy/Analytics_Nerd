---having clause---
--write a query to display department name, average salary of manager whose avg salary > 170000
select dept,
count(1) as no_of_managers,
avg(salary) as avg_salary 
from emp_inc
where desi = 'Manager' 
group by dept
having avg(salary) > 170000;

--write a query to display department name, average salary of manager whose avg salary > 170000 in desc order
select dept,
count(1) as no_of_managers,
avg(salary) as avg_salary 
from emp_inc
where desi = 'Manager' 
group by dept
having avg(salary) > 170000
order by avg(salary) desc;

---inner join---
--joins common columns in two tables
select e1.eid, e1.name, e1.city, e1.phone, e2.DESI, e2.DEPT, e2.SALARY
from emp2_2 e1
inner join emp_inc e2 on e1.eid =  e2.EID;

---left join---
--joins table 1 columns with table 2 columns 
select e1.eid, e1.name, e1.city, e1.phone, e2.DESI, e2.DEPT, e2.SALARY
from emp2_2 e1
left join emp_inc e2 on e1.eid =  e2.EID;

---right join---
--joins table 2 columns with table 1 columns 
select e1.eid, e1.name, e1.city, e1.phone, e2.DESI, e2.DEPT, e2.SALARY
from emp2_2 e1
right join emp_inc e2 on e1.eid =  e2.EID;

---full outer join---
--joins table 2 columns with table 1 columns and any additional columns
select e1.eid, e1.name, e1.city, e1.phone, e2.DESI, e2.DEPT, e2.SALARY
from emp2_2 e1
full outer join emp_inc e2 on e1.eid =  e2.EID;
