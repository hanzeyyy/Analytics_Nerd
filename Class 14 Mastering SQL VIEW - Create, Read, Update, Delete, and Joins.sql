-----view-----
--a virtual table used to store output of sql queries 
--using views,we an do data manipulation with respect to the actual table
--syntax: create view view_name as select * from table_name
select * from emp_inc;

create view my_view 
as
select * from emp_inc
where dept = 'misc';

select * from my_view;

insert into my_view values ('I1136', 'MISC', 'Asisstent', '70000'); 
--error: 'The INSERT statement conflicted with the FOREIGN KEY constraint "fk01". The conflict occurred in database "Analytic_Nerd", table "dbo.emp2_2", column 'EID''

select * from emp2_2; --parent table
--since employee id 'I1136' donot exists in parent table (i.e., emp2_2)
--it cannot be inserted into child table (i.e., emp_inc)

insert into emp2_2 values ('I1136', 'ARYAN SHAH', 'HOSTEL 5', 'POWAII', 'SANGLI', '587767657', 'ar@xyz.com', '2020-07-27', '27-07-2020'); 

select * from emp2_2;

insert into my_view values ('I1136', 'MISC', 'Asisstent', '70000'); 

select * from my_view;

-----update-----
update my_view
set salary = 85000
where eid = 'I1136';

select * from my_view;
select * from emp_inc;
--updated on both tables

-----delete-----
delete from my_view
where eid = 'I1136';

select * from my_view;
select * from emp_inc;
--deleted from both tables

insert into emp2_2 values ('I1137', 'ARYAN BISWAS', 'HOSTEL 5', 'POWAII', 'MUMBAI', '587767658', 'ab@xyz.com', '2020-07-28', '28-07-2020'); 

select * from emp2_2;

insert into my_view values ('I1137', 'OPERNS', 'MANAGER', 150000); 

select * from my_view;
--not inserted since view only allow dept = 'MISC' records

select * from emp_inc;
--inserted into the parent table

delete from emp_inc
where eid = 'I1137';


--we have created views to manipulate the virtual table instead of the actual table
--but as we see that the actual table is also getting affected
--what to do?

alter view my_view
as
select * from emp_inc
where dept = 'MISC'
with check option;
--with check option -> restrict entry of records into the actual table

select * from my_view;

insert into my_view values ('I1137', 'Operns', 'MANAGER', 150000); 
--error: 'The attempted insert or update failed because the target view either specifies WITH CHECK OPTION or spans a view that specifies WITH CHECK OPTION and one or more rows resulting from the operation did not qualify under the CHECK OPTION constraint.'

select * from my_view;
select * from emp_inc;
--neither inserted into any table


create view my_view1 
as
select distinct city from emp2_2;

select * from my_view1;
--just a 'read only' view

delete from my_view1
where city = 'CHANDIGARH';
--error: 'Cannot update the view or function 'my_view1' because it contains aggregates, or a DISTINCT or GROUP BY clause, or PIVOT or UNPIVOT operator.'

delete from emp2_2
where eid = 'I1136';

delete from emp2_2
where eid = 'I1137';

select * from emp_inc; --79 records
select * from emp2_2; --132 records
-----joins-----
create view my_view2
as
select e1.eid, e1.name, e1.city, e1.phone, e2.dept, e2.desi, e2.salary,
e2.salary*0.11 as extra_allowance1, 
e2.salary*0.17 as extra_allowance2
from emp2_2 e1
inner join emp_inc e2 on e1.EID = e2.EID;

select * from my_view2;
--79 records

/*
in joins, we cannot do insert, update, delete because
1. the data is coming from two different tables
2. there are some tempoary columns which cannot be changed/manipulated
*/
