-------windows functions-------
create table trainees
(
	id_no int,
	trainee_name varchar(20),
	score int
);

insert into trainees values (1, 'Jim', 86), (2, 'Sam', 89), (3, 'Tom', 69), (4, 'Rumi', 75);
insert into trainees values (5, 'Robbie', 95), (6, 'Victor', 58), (7, 'Ajay', 84);

select * from trainees;

select * from trainees
order by score desc;

---rank()---
select *,
rank() over(order by score desc) as rankings
from trainees;

--what if there is a tie
create table trainees1
(
	id_no int,
	trainee_name varchar(20),
	score int
);

insert into trainees1 values (1, 'Jim', 89), (2, 'Sam', 89), (3, 'Tom', 69), (4, 'Rumi', 75);
insert into trainees1 values (5, 'Robbie', 95), (6, 'Victor', 58), (7, 'Ajay', 84);

select * from trainees1;

select * from trainees1
order by score;

---dense_rank()---
select *,
rank() over(order by score desc) as rankings,
dense_rank() over(order by score desc) as dense_rankings
from trainees1;

---row_number---
select *,
row_number() over(order by score desc) as rows_number,
rank() over(order by score desc) as rankings,
dense_rank() over(order by score desc) as dense_rankings
from trainees1;
