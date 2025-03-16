create table table1
(
	emp_id char(10),
	emp_name varchar(20),
	city varchar(20),
	DoB datetime
);

insert into table1 values ('E10001', 'John Debreto', 'New York', '1985-01-01');
insert into table1 values ('E10002', 'Swati Kumari', 'Pune', '1991-09-29');
insert into table1 values ('E10003', 'Pinky Gupta', 'Delhi', '1988-03-13');
insert into table1 values ('E10004', 'Walter White', 'California', '1980-02-03');
insert into table1 values ('E10005', 'Rohit Kumar', 'Mumbai', '1986-05-30');

select * from table1;

--suppose we want to add a column (say phone number) to the existing table
alter table table1
add phone varchar(15);

select * from table1;

--suppose we want to increase the size of emp_name column
alter table table1
alter column emp_name varchar(30); 

select * from table1;

--suppose we want to drop the newly added phone column
alter table table1
drop column phone; 

select * from table1;

--suppose we want to drop our table table1
drop table table1;

--DML -> insert, update, delete are	DML used to view and manage data

create table table1
(
	emp_id char(10),
	emp_name varchar(20),
	city varchar(20),
	DoB datetime
);

insert into table1 values ('E10001', 'John Debreto', 'New York', '1985-01-01');
insert into table1 values ('E10002', 'Swati Kumari', 'Pune', '1991-09-29');
insert into table1 values ('E10003', 'Pinky Gupta', 'Delhi', '1988-03-13');
insert into table1 values ('E10004', 'Walter White', 'California', '1980-02-03');
insert into table1 values ('E10005', 'Rohit Kumar', 'Mumbai', '1986-05-30');

select * from table1;

--suppose we don't want time in DoB column
alter table table1
alter column Dob date;

select * from table1;

update table1 
set DoB = '1988-03-23'
where emp_id = 'E10004';

select * from table1;

update table1 
set DoB = '1986-03-30'
where emp_id = 'E10005';

select * from table1;

--suppose we want to delete a record
delete from table1
where emp_id = 'E10005';

select * from table1;
--4 records left now

--suppose we want to delete the record from table but not the table structure
delete from table1;

select * from table1;

--let's insert again all records
insert into table1 values ('E10001', 'John Debreto', 'New York', '1985-01-01');
insert into table1 values ('E10002', 'Swati Kumari', 'Pune', '1991-09-29');
insert into table1 values ('E10003', 'Pinky Gupta', 'Delhi', '1988-03-13');
insert into table1 values ('E10004', 'Walter White', 'California', '1980-02-03');
insert into table1 values ('E10005', 'Rohit Kumar', 'Mumbai', '1986-05-30');

select * from table1;

--suppose we want to see just 2 records
select emp_id, emp_name from table1;
