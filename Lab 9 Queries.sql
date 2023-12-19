-- LAB 9

-- Create a table rentals_may to store the data from rental table with information for the month of May.
CREATE TABLE rentals_may as 
select *
from rental
where month(rental_date) = 5;

-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
insert into rentals_may
select *
from rental
where month(rental_date) = 5;

-- Create a table rentals_june to store the data from rental table with information for the month of June.
CREATE TABLE rentals_june as
select *
from rental
where month(rental_date) = 6;

-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
insert into rentals_june
select *
from rental
where month(rental_date) = 6;

-- Check the number of rentals for each customer for May.
select c.customer_id, c.first_name, c.last_name, rental_count
from customer c
join (
     select customer_id, count(*) as rental_count
     from rental
     where month(rental_date) =5 
     group by customer_id
) r
on c.customer_id = r.customer_id;

-- Check the number of rentals for each customer for June.
select c.customer_id, c.first_name, c.last_name, rental_count
from customer c
join (
     select customer_id, count(*) as rental_count
     from rental
     where month(rental_date) = 6 
     group by customer_id
) r
on c.customer_id = r.customer_id;

-- reate a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:
-- Check the number of rentals for each customer for May

