select * from emp_inc;

---getdate()---
--yield current/present date as output
select getdate() as present_date;

---dateadd()---
--dateadd(format, no of days, column_name)
select dateadd(day, 11, getdate()) as july;
--or
select dateadd(d, 11, getdate()) as july;


select dateadd(month, 6, getdate()) as december;
--or
select dateadd(m, 6, getdate()) as december;


select dateadd(year, 5, getdate()) as y_2030;
--or
select dateadd(yy, 5, getdate()) as y_2030;


select * from emp2_2;
---convert---
--convert(format, column_name, no of days)
update emp2_2 set dob = convert(date, dob, 105);
update emp2_2 set doj = convert(date, doj, 105);

alter table emp2_2
alter column dob date;

alter table emp2_2
alter column doj date;

---datediff()---
--datediff(format, column_name1, column_name2)
--yields difference between dates
select *,
datediff(yy, dob, getdate()) as 'tenure'
from emp2_2;

---day---
--day(column_name)
--yields day format from a date/column
select day(getdate()) as day;

select day(doj) as joining_date from emp2_2;

---month---
--month(column_name)
--yields month format from a date/column
select month(getdate()) as month;

select month(doj) as joining_month from emp2_2;

---year---
--year(column_name)
--yields year format from a date/column
select year(getdate()) as year;

select year(doj) as joining_year from emp2_2;

---datepart()---
--datepart(format, column_name)
--yields part of the date
select datepart(day, doj) as day_of_joining from emp2_2;
--or
select day(doj) as joining_date from emp2_2;

select datepart(month, doj) as month_of_joining from emp2_2;
--or
select month(doj) as joining_month from emp2_2;

select datepart(year, doj) as year_of_joining from emp2_2;
--or
select year(doj) as joining_year from emp2_2;

select *,
dateadd(m, 3, doj) as 'End of Probation' from emp2_2;

---format()---
--format(column name, 'Y')
--yields month and year of date
select format(getdate(), 'Y') as year;

--format(column name, 'M')
--yields month and day of date
select format(getdate(), 'M') as month;

--format(column name, 'D')
--yields day, month and year of date
select format(getdate(), 'D') as day;


--write a query to find the employees who joined in the month of october
select * from emp2_2
where datepart(month, doj) = 10;
--or
select * from emp2_2
where month(doj) = 10;

--find out the employees who are more than 20 years of age
select *,
datediff(year, dob, getdate()) as age 
from emp2_2
where datediff(year, dob, getdate()) >= 20;
