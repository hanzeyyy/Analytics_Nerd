-------predefined functions-------
---sum(column name)---
select sum(salary) from emp_inc;
--sum of salary = 10499559 with no column name

select sum(salary) 'Total salary' from emp_inc;
--sum of salary = 10499559 with column name as 'Total salary' 

---count(column name)---
select count(eid) from emp_inc;
--number of employees = 79 with no column name

select count(eid) 'no_of_emp' from emp_inc;
--number of employees = 79 with column name as 'no_of_emp' 

---max(column name)---
select max(salary) 'max salary' from emp_inc; --int databse
--max salary = 520005

select max(eid) 'max eid' from emp_inc; --varchar databse
--max eid = I1134

---min(column name)---
select min(salary) 'min salary' from emp_inc; --int databse
--min salary = 35005

select min(eid) 'min eid' from emp_inc; --varchar databse
--min eid = I1001

---avg(column name)---
select avg(salary) 'avg salary' from emp_inc; 
--avg salary = 132905

---square(number)---
select square(5) 'square of 5';

---sqrt(number)---
select sqrt(225) 'square root of 225';
	
---rand(number)---
--generates a random number
select rand() 'random value';
--range is between 0 and 1

---concat(strings)---
--joins strings together
select concat('thala ', 'for ', 'a ', 'reason') 'MS Dhoni';

---trim---
--removes out all extra spaces
select ('		 Rohit         ') 'name';
--name:      Rohit         

select trim('                         Rohit         ') 'name';
--name: Rohit

---ltrim---
--left trim
select trim('                         Rohit') 'name';
--name: Rohit

---rtrim---
--right trim
select trim('Rohit'                         ) 'name';
--name: Rohit
