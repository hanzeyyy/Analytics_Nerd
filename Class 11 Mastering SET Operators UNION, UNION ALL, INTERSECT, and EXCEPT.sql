-------set operators-------
-----union-----
--gives common records and deletes duplicate records
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary  
from emp2_2 e1
left join emp_inc e2 on e1.eid = e2.eid
union 
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary  
from emp2_2 e1
right join emp_inc e2 on e1.eid = e2.eid
--132 records

-----union all-----
--gives all records including duplicates records
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary  
from emp2_2 e1
left join emp_inc e2 on e1.eid = e2.eid
union all
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary  
from emp2_2 e1
right join emp_inc e2 on e1.eid = e2.eid
--211 records

-----intersect-----
--gives records which are common in both tables
--returns matched records
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary  
from emp2_2 e1
left join emp_inc e2 on e1.eid = e2.eid
intersect
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary  
from emp2_2 e1
right join emp_inc e2 on e1.eid = e2.eid
--79 records

-----except-----
--table 1 records - table 2 records
--returns unmatched records
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary  
from emp2_2 e1
left join emp_inc e2 on e1.eid = e2.eid
except
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary  
from emp2_2 e1
right join emp_inc e2 on e1.eid = e2.eid
--53 records
