select * from emp2_2
where city = 'Pune';
--58 records
--sql uses row by row operation, full table scan which is generally slow specially when there are millions of records
--full table scan whenever we go by larger sizes databases
-----index-----
--create index on specific columns for search operations ensuring smooth and fast output response
--syntax: create index index_name on table_name (row_name)


--1. explicit index
--explicitly creating an index on a column of a table
create index quick_explore on emp2_2 (city);

select * from emp2_2
where city = 'Pune';

--quick_explore is a nonunique nonclustered index since it has many duplicate records (city name)

create index quick_explore1 on emp2_2 (city, addr1);
--explicit index: composite indexing (creating index on multiple columns)
select * from emp2_2
where city = 'Pune' and addr1 = '5H Karanshey';

--why nonclustered
--because the column is not sorted, it is intact
--Note: city is not an index rather it's a pointer in quick_explore which point to uniquely stored city (no duplicate)
--Agra, bangalore, chennai, delhi, mumbai, noida, pune
-- B-tree (alphabetical) structure.
