select * from emp2_2;

---unique key---
--ensures no duplicate for a specified column
--can accept a maximum of one null value
alter table emp2_2
add constraint uk01 unique(phone);
--since phone numbers are unique 

select * from emp2_2;
--one database can have multiple unique keys
insert into emp2_2 (eid, name, ADDR1, ADDR2, CITY, EMAIL, DOB, DOJ)
values ('I1137', 'Aryan', 'Dadar', 'Powaii', 'Mumbai', 'aryan@xyz.com', '1989-01-03', '2017-02-28');
--we have inserted all the corresponding values except

select * from emp2_2;
-- sql automatically adds null value to phone where eid = I1137

--we try to insert another record with phone as null
insert into emp2_2 (eid, name, ADDR1, ADDR2, CITY, EMAIL, DOB, DOJ)
values ('I1138', 'Aryan', 'Sangli', 'Powaii', 'Mumbai', 'aryan07@xyz.com', '1988-10-29', '2015-04-16');
--shows 'Violation of UNIQUE KEY constraint 'uk01'. Cannot insert duplicate key in object 'dbo.emp2_2'. The duplicate key value is (<NULL>)'
--since unique key can also only one null value and no duplicates
