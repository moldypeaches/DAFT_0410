use film_data;

#1. What are the most common and popular movie genres?

SELECT COUNT(f.film_id) AS "FILM COUNT WOMEN", 
AVG(f.popularity),
g.genre AS "GENRE"
FROM films f 
right join directors d 
on f.director_id = d.director_id
LEFT JOIN film_genre fg 
ON fg.film_id = f.film_id
INNER JOIN genres g
ON g.genre_id = fg.genre_id
where d.director_gender = 'female'
GROUP BY 3
ORDER BY 1 DESC
LIMIT 10;

SELECT COUNT(f.film_id) AS "FILM COUNT MEN", 
AVG(f.popularity),
g.genre AS "GENRE"
FROM films f 
right join directors d 
on f.director_id = d.director_id
LEFT JOIN film_genre fg 
ON fg.film_id = f.film_id
INNER JOIN genres g
ON g.genre_id = fg.genre_id
where d.director_gender = 'male'
GROUP BY 3
ORDER BY 1 DESC
LIMIT 10;


#2. Who directed the most movies?

select count(f.film_id) as "FILM COUNT", 
d.director as "DIRECTOR", 
d.director_gender as "GENDER"
from films f 
right join directors d 
on f.director_id = d.director_id
group by 2, 3
order by 1 desc
limit 10;


#3 Who produced the most multi-cultural movies?

SELECT count(f.film_id) as "MALE FILMS",
f.spoken_languages as "NUMBER OF SPOKEN LANGUAGES"
FROM films f 
RIGHT JOIN directors d 
on f.director_id = d.director_id
WHERE spoken_languages > 1 
AND director_gender = 'male'
group by 2;

SELECT count(f.film_id) as "FEMALE FILMS",
f.spoken_languages as "NUMBER OF SPOKEN LANGUAGES"
FROM films f 
RIGHT JOIN directors d 
on f.director_id = d.director_id
WHERE spoken_languages > 1 
AND director_gender = 'female'
group by 2;

#4. Counting unique film directors

SELECT count(distinct d.director) as "DISTINCT MALE DIRECTORS"
from directors d 
where d.director_gender = 'male'
ORDER BY 1 DESC
LIMIT 10;

SELECT count(distinct d.director) as "DISTINCT FEMALE DIRECTORS"
from directors d 
where d.director_gender = 'female'
ORDER BY 1 DESC
LIMIT 10;


#5. What is the average popularity of films?

select avg(popularity) as "AVG POPULARITY"
from films f 
right join directors d 
on f.director_id = d.director_id
left join film_genre fg 
on fg.film_id = f.film_id
inner join genres g
on g.genre_id = fg.genre_id
where d.director_gender in ('male', 'female')
group by d.director_gender
order by 1 desc
limit 10;
