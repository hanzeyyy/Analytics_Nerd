drop index quick_explore on emp2_2;
drop index quick_explore1 on emp2_2;

-----implicit index-----
--implicit index is such a kind of index which is not created by a user explicitly
--implicit index is created automatically/inherently
/*
there are two types of implicit index
1. clustered index
2. uique nonclustered index

1. clustered index
-> gets created automatically whenever we define a primary key on a column of a table
A table can have only one clustered index and multiple nonclustered index
*/

--how to expicitly create clustered index
create clustered index ec_01 on emp2_2(phone);
--error: 'Cannot create more than one clustered index on table 'emp2_2'. Drop the existing clustered index 'pk01' before creating another.'
