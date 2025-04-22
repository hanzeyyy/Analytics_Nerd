create table test01
(
	id char(6) not null primary key,
	name varchar(40),
	city varchar(40) default 'New Delhi',
	phone varchar(40) unique, 
	dob date check (dob >= '1987-01-01')
);

insert into test01 values ('C1001','Sagar Kumar','Chennai','987987987','1987-01-05');

select * from test01;

insert into test01 (name, city, phone, dob)
values ('Jaya Shrikant','Pune','987654321','1989-05-11');
--shows errors since id is set as not null

insert into test01 (id, name, city, phone, dob)
values ('C1002', 'Jaya Shrikant','Pune','987654321','1989-05-11');

select * from test01;

insert into test01 (id, name, phone, dob)
values ('C1003', 'Maya Shri','9976616541','1992-09-19');

select * from test01;

insert into test01 
values ('C1004', 'Tanvi Sharma', 'Jaipur', '9976616541','1996-09-23');
--shows 'Violation of UNIQUE KEY constraint 'UQ__test01__B43B145FB7AB1DDE'. Cannot insert duplicate key in object 'dbo.test01'. The duplicate key value is (9976616541).' 
--since both hvae same phone number which is not possible as we set phone number unique

insert into test01 (id, name, phone, dob)
values ('C1004', 'Tanvi Sharma','9976548765','1996-09-23');

select * from test01;

