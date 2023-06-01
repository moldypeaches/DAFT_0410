use publications;

select
pa.au_id as "AUTHOR ID", -- the ID of the author
pa.au_lname as "LAST NAME", -- author last name
pa.au_fname as "FIRST NAME", -- author first name
pt.title as "TITLE", -- name of the published title
p.pub_name as "PUBLISHER" -- name of the publisher where the title was published;
from publications.authors pa 
inner join publications.titleauthor pta 
on pa.au_id = pta.au_id
inner join publications.titles pt
on pta.title_id = pt.title_id
inner join publications.publishers p
on pt.pub_id = p.pub_id;

select
pa.au_id as "AUTHOR ID", -- the ID of the author
pa.au_lname as "LAST NAME", -- author last name
pa.au_fname as "FIRST NAME", -- author first name
p.pub_name as "PUBLISHER", -- name of the publisher where the title was published;
count(*) as num_of_titles
from publications.authors pa 
inner join publications.titleauthor pta 
on pa.au_id = pta.au_id
inner join publications.titles pt
on pta.title_id = pt.title_id
inner join publications.publishers p
on pt.pub_id = p.pub_id
group by 1,2,3,4;


select
pa.au_id as "AUTHOR ID", -- the ID of the author
pa.au_lname as "LAST NAME", -- author last name
pa.au_fname as "FIRST NAME", -- author first name
sum(s.qty) as "TOTAL"
from publications.authors pa 
inner join publications.titleauthor pta 
on pa.au_id = pta.au_id
inner join publications.titles pt
on pta.title_id = pt.title_id
inner join publications.publishers p
on pt.pub_id = p.pub_id
inner join publications.sales s 
on s.title_id = pt.title_id
group by 1,2,3
order by 4 desc
limit 3;

select
pa.au_id as "AUTHOR ID", -- the ID of the author
pa.au_lname as "LAST NAME", -- author last name
pa.au_fname as "FIRST NAME", -- author first name
SUM(s.qty)  as "TOTAL"
from publications.authors pa 
left join publications.titleauthor pta 
on pa.au_id = pta.au_id
left join publications.titles pt
on pta.title_id = pt.title_id
left join publications.publishers p
on pt.pub_id = p.pub_id
left join publications.sales s 
on s.title_id = pt.title_id
group by 1
order by 4 desc;

select * from publications.authors;
