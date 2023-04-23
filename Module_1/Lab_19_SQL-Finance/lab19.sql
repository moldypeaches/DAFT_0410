#1. From the order_items table, find the price of the highest priced order and lowest price order.
select price, order_id, order_item_id
from olist.order_items
order by price desc
limit 2;

select price, order_id, order_item_id
from olist.order_items
order by price
limit 4;

#2. From the order_items table, what is range of the shipping_limit_date of the orders?
select datediff(max(shipping_limit_date),min(shipping_limit_date))
from olist.order_items;

select min(shipping_limit_date)
from olist.order_items;

select max(shipping_limit_date)
from olist.order_items;

#3. From the customers table, find the states with the greatest number of customers.

select customer_state, count(distinct customer_id)
from olist.customers
group by customer_state
order by count(distinct customer_id) desc;

#4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.

SELECT distinct customer_city, customer_state, COUNT(distinct customer_id)
FROM olist.customers
WHERE customer_state LIKE 'SP'
GROUP BY customer_state, customer_city
order by COUNT(customer_id) desc;

select *
FROM olist.closed_deals;

#5. From the closed_deals table, how many distinct business segments are there (not including null)?
select business_segment, count(distinct business_segment)
FROM olist.closed_deals
WHERE business_segment IS NOT NULL
group by business_segment;

select *
FROM olist.closed_deals;

#6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row 
#values in business_segment and find the 3 business segments with the highest declared monthly revenue 
#(of those that declared revenue).

select business_segment, sum(declared_monthly_revenue) 
FROM olist.closed_deals
where declared_monthly_revenue != '0'
group by business_segment
order by sum(declared_monthly_revenue) desc;

#7. From the order_reviews table, find the total number of distinct review score values.
select sum(distinct review_score)
FROM olist.order_reviews
group by review_score;

select *
from olist.order_reviews;

#8. In the order_reviews table, create a new column with a description that corresponds to each 
#number category for each review score from 1 - 5, then find the review score and category occurring
#most frequently in the table.
alter table olist.order_reviews
ADD COLUMN reviewdescription VARCHAR(5);

ALTER TABLE olist.order_reviews MODIFY COLUMN reviewdescription VARCHAR(50);

UPDATE olist.order_reviews
SET reviewdescription = 
  CASE
    WHEN review_score = 1 THEN 'very poor'
    WHEN review_score = 2 THEN 'poor'
    WHEN review_score = 3 THEN 'average'
    WHEN review_score = 4 THEN 'good'
    WHEN review_score = 5 THEN 'very good'
    ELSE 'unknown'
  END;

select reviewdescription, review_score, count(review_score)
from olist.order_reviews
group by review_score, reviewdescription
order by count(review_score) desc
limit 1;

#9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.

select reviewdescription, review_score, count(review_score)
from olist.order_reviews
group by review_score, reviewdescription
order by count(review_score) desc;