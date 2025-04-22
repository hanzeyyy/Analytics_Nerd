select * from emp2_2;

---foreign key---
--used to establish relationship between two tables
--we can establish relation from one table which has a column as primary key to another table with column as foriegn key
--the table with primary key column is called parent table and the table with foreign key column is called child table 
select * from emp2_2; --parent table (already has primary key)
select * from emp_inc; --child table (after inserting foreign key)

alter table emp_inc
add constraint fk01 foreign key(eid) references emp2_2(eid);

--suppose we want to give salary to employee with eid = 'I1140' but it doesn't exist
insert into emp_inc
values ('I1140', 'ADMN', 'Manager', '100000');
--since the record (eid = 'I1140') doesn't exist in the parent table (emp2_2), we can not insert it in child table (emp2_2)
--shows 'The INSERT statement conflicted with the FOREIGN KEY constraint "fk01". The conflict occurred in database "Analytic_Nerd", table "dbo.emp2_2", column 'EID'.'

select * from emp2_2;
--this table has records till eid = I1139
select * from emp_inc;
--but this table has records till eid = I1134

--we can insert records in child table with reference to parent table
insert into emp_inc
values ('I1135', 'ADMN', 'Manager', '100000');

select * from emp_inc;
--inserted one more record with eid = 'I1135'

