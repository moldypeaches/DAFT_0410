USE SAKILA;

#1. find the running total of rental payments for each customer in the payment table,
# ordered by payment date. By selecting the customer_id, payment_date, and amount columns from the payment table, and then applying the SUM function to the amount column within each customer_id partition, ordering by payment_date.
select customer_id, payment_date, amount,
sum(amount) over (partition by customer_id order by payment_date) as sum_amount_per_customer_id
from sakila.payment; 

#2.  find the rank and dense rank of each payment amount within each payment date by selecting the payment_date and amount columns from the payment table, 
#and then applying the RANK and DENSE_RANK functions to the amount column within each payment_date partition, ordering by amount in descending order.

            
select date(payment_date) as payment_date2, amount
, rank() over (partition by date(payment_date) order by amount desc) as rank_payment
, dense_rank() over (partition by date(payment_date) order by amount desc) as dense_rank_payment
from payment limit 50;


#3. find the ranking of each film based on its rental rate, within its respective category. 
select f.title, fc.category_id, c.name, f.rental_rate
, rank() over (partition by c.name order by f.rental_rate) as ranking_film
, dense_rank() over (partition by c.name order by f.rental_rate) as dense_ranking_film
from film f
inner join film_category fc using (film_id)
inner join category c using (category_id); 

#5. find the difference between the current and previous payment amount and the 
#difference between the current and next payment amount, for each customer in the payment table


select payment_id, customer_id, amount, payment_date 
, lag(amount) over (partition by date(customer_id) order by payment_date) as previous_title_price
, lead(amount) over (partition by date(customer_id) order by payment_date) as next_title_price
,amount - "prev_amount" as diff_from_prev
,amount - "next_amount" as diff_from_next
from payment;



