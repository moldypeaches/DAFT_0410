use films_data;

#1. What are the most common movie genres?
select count(f.film_id) as "FILM COUNT", 
g.genre as "GENRE"
from films f 
left join film_genre fg 
on fg.film_id = f.film_id
inner join genres g
on g.genre_id = fg.genre_id
group by 2
order by 1 desc
limit 10;

#2. #2. What are the most popular movie genres?
SELECT avg(f.popularity) AS "AVG POPULARITY",
       g.genre AS "GENRE"
FROM films f
INNER JOIN film_genre fg ON f.film_id = fg.film_id
INNER JOIN genres g ON g.genre_id = fg.genre_id
GROUP BY g.genre
ORDER BY 1 DESC
LIMIT 10;

#3 Who directed the most movies?
select count(film_id) as "FILM COUNT", 
d.director as "DIRECTOR", 
d.director_gender as "GENDER"
from films f 
right join directors d 
on f.director_id = d.director_id
group by 2, 3
order by 1 desc
limit 10;

#4 Where are most of the movies produced?
select count(f.film_id) as "FILM COUNT",
c.country as "COUNTRY"
from films f 
right join directors d 
on f.director_id = d.director_id
inner join film_country fc
on fc.film_id = f.film_id
inner join countries c
on c.country_id = fc.country_id
where director_gender = 'female'
group by 2
order by 1 desc
limit 10;

select count(f.film_id) as "FILM COUNT",
c.country as "COUNTRY"
from films f 
right join directors d 
on f.director_id = d.director_id
inner join film_country fc
on fc.film_id = f.film_id
inner join countries c
on c.country_id = fc.country_id
where director_gender = 'male'
group by 2
order by 1 desc
limit 10;

#5. Question about popularity
select avg(popularity)
from films f 
right join directors d 
on f.director_id = d.director_id
left join film_genre fg 
on fg.film_id = f.film_id
inner join genres g
on g.genre_id = fg.genre_id
where director_gender in ('female' , 'male')
group by director_gender
order by 1 desc
limit 10;