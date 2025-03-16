create table employee
(
	emp_id char(6),
	emp_name varchar(20),
	emp_address1 varchar(10),
	emp_address2 varchar(10),
	city varchar(20),
	phone varchar(20),
	email varchar(20),
	DoB date,
	DoJ date
);

insert into employee values ('E10001', 'Ramesh Gupta', 'Sector 71', 'Baner', 'Pune', '1010101010', 'rk@xyy.com', '1991-01-01', '2012-03-05');
insert into employee values ('E10002', 'Aamesh Gupta', 'Sector 12', 'Saket', 'Delhi', '2200101010', 'ag@xyy.com', '1981-01-01', '2014-03-05');
insert into employee values ('E10003', 'Joy Das', 'Gopa', 'Veera', 'Bangalore', '3001528371', 'jo27@xyy.com', '1986-05-06', '2022-12-24');
insert into employee values ('E10004', 'Ram Kumar', 'Pion', 'Lake', 'Bangalore', '2300123031', 'rm@xyy.com', '1990-12-30', '2021-06-05');
insert into employee values ('E10005', 'Piyush Rana', 'Eion', 'River', 'Chennai', '3300102132', 'piyuinfi@abc.com', '1990-01-21', '2022-03-05');

select * from employee;

--like clause: '_', '%', '[]', '[^]'
select * from employee
where emp_name like 'A%';
--this means that have starting name letter as 'A' and then there can be anything

select * from employee
where emp_name like 'R%';
--this means that have ending name letter as 'A' and then before can be anything

select * from employee
where emp_name like '%gupta';
--this means that there can be anything before gupta
select * from employee
where email like '%xyy%';

select * from employee
where emp_name like '[RP]%';
--this means the first letter of the name should either be R or P

select * from employee
where emp_name like '[^RP]%';
--this means the first letter of the name should neither be R nor P

select * from employee
where emp_name like '[A-J]%';
--this means the first letter of the name should range from A to J

select * from employee
where emp_name like '_a_e%';
--this means the first letter can be anything but second letter should be a and similarly third letter can be anything and forth letter should be e and then there can be anything

select top 3 * from employee;
--shows first three records
