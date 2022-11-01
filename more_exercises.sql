-- 1a
select * from actor;

-- 1b
select last_name from actor;

-- 1c

select film_id, title, release_year from film;

# --------------------------------------------------------

-- 2
select distinct last_name from actor;
-- 2b
select distinct postal_code from address;
-- 2c
select distinct rating from film;

#------------------------------------------------------------

-- 3a
describe film;
select title, description, rating, length
from film
where length > 180;

-- 3b
describe payment;
select payment_id, amount, payment_date
from payment
where payment_date > '2005-05-26';

-- 3c
describe payment;

select payment_id, amount, payment_date
from payment
where payment_date like '2005-05-28 %:%:%';

-- 3d
describe customer;

select *
from customer
where first_name like '%n'
and last_name like 's%';

-- 3e

select * from customer
where active = false
or last_name like 'm%';

-- 3f
describe category;

select *
from category
where category_id > 4
and 
(name like 'c%'
or name like 's%'
or name like 't%');

-- 3g 
describe staff;
select staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
from staff
where password like '%';

-- 3h
select staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update
from staff
where password not like '%';


#-------------------------------------------------------

-- 4a

