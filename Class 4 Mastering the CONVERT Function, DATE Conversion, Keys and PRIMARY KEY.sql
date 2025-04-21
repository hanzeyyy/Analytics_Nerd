select * from emp2_2;

---convert---
-- convert(format, column name, line code)
-- converts one datetype format to another eg from dd/mm/yyyy format to yyyy/mm/dd format
update emp2_2 set dob = convert(date, dob, 105); 
--105 is default line code

select * from emp2_2;
--format of dob is changed to yyyy/mm/dd

--suppose we want date of joining (doj) also in yyyy/mm/dd format
update emp2_2 set dob = convert(date, doj, 105); 

select * from emp2_2;
--format of doj is also changed to yyyy/mm/dd

--using update and set operator sets dob and doj in date format temporarily
--we can use alter table to permanenty change dob and doj from varchar to date format
alter table emp2_2
alter column dob date; 

alter table emp2_2
alter column doj date;

---primary key---
-- primary key(column name)
-- combination of unique constraint and not null constraint
alter table emp2_2
add constraint pk01 primary key(eid);
--initialy this shows error coz eid can be a null value which violates primary key constraint

alter table emp2_2
alter column eid varchar(50) not null;
--run this to make eid non-nullabe

alter table emp2_2
add constraint pk01 primary key(eid);
--primary key is set to eid

select * from emp2_2;

--lets try to insert dupicate eid value
insert into emp2_2 values ('I1135',	'Sam', 'mumbai', 'delhi', 'malegoan', '987654321', 'sam@xyz.com', '1987-01-01', '2012-02-28');
--show 'Violation of PRIMARY KEY constraint 'pk01'. Cannot insert duplicate key in object 'dbo.emp2_2'. The duplicate key value is (I1135)'

insert into emp2_2 values ('I1136',	'Sam', 'mumbai', 'delhi', 'malegoan', '987654321', 'sam@xyz.com', '1987-01-01', '2012-02-28');
--133 records now

select * from emp2_2;

--let's try to insert a new record with all corresponding records except eid
insert into emp2_2 (name, ADDR1, ADDR2, CITY, PHONE, EMAIL, DOB, DOJ)
values ('Ram', 'bihar', 'jharkhand', 'kanpur', '987654321', 'ram@xyz.com', '1987-01-01', '2012-02-28');
--shows 'Cannot insert the value NULL into column 'EID', table 'Analytic_Nerd.dbo.emp2_2'; column does not allow nulls. INSERT fails.'
