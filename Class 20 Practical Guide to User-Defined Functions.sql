-----User built functions-----
/*
there are two types of functions:
1. scalar value function
2. table value function

1. scalar value function
--returns scalar value as output

2. table value function
--returns a table as output
*/

--scalar value function
create function sub_2_nos (@A as int, @B as int)
returns int
as
begin
	declare @C as int;
	set @C = @A - @B
	return @C
end;

select dbo.sub_2_nos(10,2) as outcome;


create function emp_mail_id (@emp_id as char(5), @nam as varchar(50), @dom as varchar(35)) 
returns varchar(70)
as
begin
	declare @emp_mail as varchar(70)
	declare @L as char(1)
	declare @surname as varchar(30)
	declare @em_id as varchar(4)
	set @L = left(@nam,1)
	set @surname = right(@nam, len(@nam) - charindex(' ', @nam))
	set @em_id = right(@emp_id,4)
	set @emp_mail = concat(@L, @surname, @em_id, @dom)
	return @emp_mail
end

select *, 
dbo.emp_mail_id (eid, name, '@anayticnerd.com') as comp_mail from emp2_2


--table value function
select * from emp_inc;
--static table value function
create function tab_my()
returns table 
as
return 
	(select e1.eid, e1.NAME, e1.CITY, e1.PHONE, e2.DEPT, e2.DESI, e2.SALARY,
	e2.SALARY*0.11 as salarcy_inc_by_11, e2.SALARY*0.19 as salarcy_inc_by_19 
	from emp2_2 e1
	inner join emp_inc e2 on e1.EID = e2.EID
	where e2.DEPT = 'Operns')

select * from tab_my();


--dynamic table value function
create function tab_my1 (@D as varchar(10))
returns table
as
return
	(select e1.eid, e1.NAME, e1.CITY, e1.PHONE, e2.DEPT, e2.DESI, e2.SALARY,
	e2.SALARY*0.11 as salarcy_inc_by_11, e2.SALARY*0.19 as salarcy_inc_by_19 
	from emp2_2 e1
	inner join emp_inc e2 on e1.EID = e2.EID
	where e2.DEPT = @D)

select * from tab_my1('Operns');
select * from tab_my1('HRD');
