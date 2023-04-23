#1. What are the different genres?
select distinct prime_genre from my_new_database.applestore2;

#2 Which is the genre with the most apps rated?
select prime_genre, rating_count_tot
from my_new_database.applestore2
order by rating_count_tot;

#3. Which is the genre with most apps?
select prime_genre, count(id)
from my_new_database.applestore2
group by prime_genre
order by count(id) desc;

#4. Which is the one with least?
select prime_genre, count(id)
from my_new_database.applestore2
group by prime_genre
order by count(id);

#5. Find the top 10 apps most rated.
select track_name, rating_count_tot
from my_new_database.applestore2 
order by rating_count_tot desc
limit 10;

#6. Find the top 10 apps best rated by users.
select track_name, user_rating
from my_new_database.applestore2 
order by user_rating desc
limit 10;

#7. Take a look at the data you retrieved in question 5. Give some insights.
select track_name, prime_genre, user_rating
from my_new_database.applestore2 
order by user_rating desc
limit 10;

select track_name, prime_genre, rating_count_tot
from my_new_database.applestore2 
order by rating_count_tot desc
limit 10;

#10. How could you take the top 3 regarding both user ratings and number of votes?
select track_name, rating_count_tot, user_rating
from my_new_database.applestore2 
order by rating_count_tot desc
limit 3;

#11. Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
select track_name, rating_count_tot, price, user_rating
from my_new_database.applestore2 
order by rating_count_tot desc
limit 15;