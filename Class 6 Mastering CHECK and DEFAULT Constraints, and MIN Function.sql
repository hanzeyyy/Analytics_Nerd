select * from emp2_2;

---min()---
--shows minimum value
select min(dob) as oldest_emp
from emp2_2;

---check()---
--checks the records in upperlimit and lowerlimit
--let's say we don't want to hire any employee older than our oldest  employeee
alter table emp2_2
add constraint ck01 check(dob >= '1987-01-01');

select * from emp2_2;
--now if wen try to insert a dob <= '1987-01-01', it will show error as check condition is violated

--let's verify
insert into emp2_2 
values ('I1138', 'Aryan', 'Sangli', 'Powaii', 'Mumbai', '987897998' ,'aryan07@xyz.com', '1986-10-29', '2015-04-16');
--shows 'The INSERT statement conflicted with the CHECK constraint "ck01". The conflict occurred in database "Analytic_Nerd", table "dbo.emp2_2", column 'DOB''

insert into emp2_2 
values ('I1138', 'Aryan', 'Sangli', 'Powaii', 'Mumbai', '987897998' ,'aryan07@xyz.com', '1988-10-29', '2015-04-16');
--since check condition is satisfied

select * from emp2_2;

---default---
--sets default value in the record if not mentioned anything else assign null
alter table emp2_2
add constraint dk01 default 'Delhi' for city;

--let's verify
insert into emp2_2 (eid, name, ADDR1, ADDR2, PHONE ,EMAIL, DOB, DOJ)
values ('I1139', 'Taha', 'Vadodara', 'Powaii', '98766789' ,'taha10@xyz.com', '1994-4-15', '2019-08-07');

select * from emp2_2;
--city is by default set to 'Delhi' 

