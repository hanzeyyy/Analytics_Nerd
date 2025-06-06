-----string manipulation-----
---ASCII(string)---
--American Standard Code of Information InterchangeASCII
select ASCII('A') as ascii_value;

---char(ascii value)---
--gives corresponding ascii
select char(66) as character_name;

---charindex(character, string)---
--gives the position of character
select charindex('n', 'Tony Sheldon') as char_position;

---len(string)---
--gives length of string
select len('Tony Sheldon') as length_of_name;

---upper(string)---
--shows strig in upper case format
select upper('abcDEF') as upper_case;

---lower(string)---
--shows strig in lower case format
select lower('abcDEF') as lower_case;

---left(string, number)---
--returns the reqiured number of characters from left side and trims the rest
select left('Tony Sheldon', 4) as first_name;

---right(string, number)---
--returns the reqiured number of characters from right side and trims the rest
select right('Tony Sheldon', 7) as last_name;

---substring(string, starting point, ending point from starting point)---
--returns a specified number of characters
select substring('Tony D. Sheldon', 6, 2) as middle_name;

select substring('Tony D. Sheldon', 6, len('Tony D. Sheldon')) as middle_and_last_name;

---reverse(string)---
--reverese the string
select reverse('abcDEF') as rev_name;

---replace(string, part of the string to be replaced, part of the string to be replaced with)
select replace('Tony D. Sheldon', 'Tony', 'Tom') as new_name;

---stuff(string, starting index, ending index, part of string to be replaced with)
select stuff('Arkim', 3, 5, 'yan') as correct_name;

--some applications of string fuction
select *, concat(addr1, ', ', ADDR2, ', ', city) as complete_address
from emp2_2;

select substring(name, charindex(' ', name)+1, len(name)) as last_name
from emp2_2;

select * from emp2_2;
--write a query to generate the company email id: RGUPTA1001@analyticsnerd.com
select concat(left(name,1),substring(name, charindex(' ', name)+1, len(name)), right(name, 4), '@analyticsnerd.com') as company_email
from emp2_2;
--OR
select concat(left(name,1),right(name, len(name)-charindex(' ', name)), right(name, 4), '@analyticsnerd.com') as company_email
from emp2_2;
