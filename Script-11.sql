-- Question 1
select customer.first_name, customer.last_name, district,city,country,postal_code  
from customer
join address 
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id
where district = 'Texas';
-- I added unecesary columns lol 
-- I thought I needed the city table lol

--Question 2
select c.first_name, c.last_name, p.amount
from customer c
join payment p 
on c.customer_id = p.customer_id
where amount > 7;

--Question 3
--part 1
select * from customer;
--part 2
select p.customer_id, sum(amount) from payment p
group by p.customer_id
having sum(amount) > 175;
-- added together
select * from customer c
where customer_id in (select p.customer_id from payment p
group by p.customer_id
having sum(amount) > 175);
-- Their names of the people who paid more than 175 in payments
select c.first_name, c.last_name from customer c
where customer_id in (select p.customer_id from payment p
group by p.customer_id
having sum(amount) > 175);

--Question 4
select customer.first_name, customer.last_name, district,city,country 
from customer
join address 
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
join country
on city.country_id = country.country_id
where country = 'Argentina';
-- lol that was easy after my mistake on q1

--Question 5
select c.name,count(*),c.category_id
from 
category c
join film_category fc 
on c.category_id = fc.category_id
group by name,c.category_id
order by count(*) desc;

--Question  6
select f.film_id, f.title,count(*) 
from film f
join film_actor fa
on f.film_id = fa.film_id
group by f.title,f.film_id
order by count(*) desc
limit 1;

--Question 7
select fa.actor_id,a.first_name,a.last_name, count(*)
from film f
join film_actor fa
on f.film_id = fa.film_id
join actor a
on fa.actor_id = a.actor_id
group by fa.actor_id,a.first_name,a.last_name
order by count(*) asc
limit 1;

--Question 8
select country.country_id,country.country,count(*) from country 
join city c 
on c.country_id = country.country_id
where c.country_id in (select country_id from city
group by country_id
order by count(*) desc
limit 3)
group by country.country,country.country_id
order by count(*) desc;

--Question 9
select count(*),a.first_name,a.last_name,a.actor_id from actor a
join film_actor fa 
on a.actor_id = fa.actor_id
where a.actor_id in (select actor_id from film_actor
group by actor_id
having count(*) between 20 and 25
order by count(*) desc)
group by a.first_name,a.last_name,a.actor_id
order by count(*) desc;
