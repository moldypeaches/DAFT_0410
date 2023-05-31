use publications;

select * from sales;

select * from titles;

select distinct ord_num fron m sales;

select * from authors;

select * from titleauthor;

SELECT ta.title_id, ta.au_id
FROM
    titles t
        LEFT JOIN
    titleauthor ta USING (title_id)
    left join sales s using (title_id)
group by ta.title_id, ta.au_id
;


select count(title_id)
 from titles;