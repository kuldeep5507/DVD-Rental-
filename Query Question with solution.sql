	
/* 
	
	Here we have DATABASE Named as "Green Cycles Database" As your wish put any name for any database as point of their creation.
	Here We Will perform the multiple SQL Query in PostgreSQL PGAdmin.
	
	Here Comments in SQL Are as:
	(1). for single line comments :  --
	(2). for multiple line comments :   Any number of SQL Query or Script's.
	
	*/
	
	-- Here Our first Query focused on "SELECT" and "FROM"  to represent's everything in table with ' * '.
	
	SELECT *
	FROM actor;
	
	--Here we performing select Multiple column from a table.
	
	SELECT actor_id, first_name, last_name
	FROM actor;
	
	-- Here We use of "WHERE" Adds conditions to a Statements.
	-- Checking Everything availability in customer table.
	
	SELECT *   
	FROM customer;
	
	--(1).Condition with "store_id" that if it is 2 or greater than 2 with all existing column.
	
	SELECT *
	FROM customer
	WHERE store_id>=2; 
	
	--(2).Condition with "store_id" that if it is 2 or greater than 2 with selected column.
	
	SELECT customer_id, store_id, first_name, last_name
	FROM customer
	WHERE store_id>=2;
	
	SELECT city_id, city, country_id
	FROM city
	WHERE country_id=80;
	
	SELECT customer_id, first_name, last_name, email
	FROM customer
	WHERE first_name='MARY';
	
	--Here we have to perform the "LIMIT" SQL Query for identify quantity number of Script.
	   -- "LIMIT" finding top most 3 records.
	SELECT *
	FROM customer
	WHERE address_id>=500
	LIMIT 3;
	
	 -- "LIMIT" finding top most 5 records.
	SELECT *
	FROM payment
	WHERE amount>=8.00
	LIMIT 5;
	
	--Here we have to Practice with "ORDER BY" SQL Query.
	
	SELECT *
	FROM customer
	ORDER BY address_id ASC; -- For Ascending Order "ASC".
	
	SELECT *
	FROM customer
	ORDER BY address_id DESC; -- For Descending Order "DESC".
	
	-- Here we Have use of "ALIAS" Function that's used "AS" to rename the column existing name during Query.
	
	SELECT COUNT(customer_id) AS total --Here " COUNT(customer_id) " is named as "total".
	FROM customer; 
	
	-- Aggregrate Function such as- SUM(), COUNT(), AVERAGE(), ROUND(), MIN(), MAX().
	
	--Use of SUM() Function.
	
	SELECT customer_id, SUM(amount) AS total_amount
	FROM payment
	GROUP BY customer_id
	ORDER BY total_amount DESC;
	
	-- Use of COUNT() Function.
	
	SELECT COUNT(*) AS Total_number, first_name
	FROM actor
	GROUP BY first_name
	ORDER BY Total_number DESC;
	
	-- Use of AVERAGE() Function.
	
	SELECT payment_id, AVG(amount) AS average_amount
	FROM payment
	GROUP BY payment_id
	ORDER BY average_amount DESC
	LIMIT 10;
	
	-- Use of ROUND() Function.
	
	SELECT payment_id, ROUND(AVG(amount), 2) AS average_amount
	FROM payment
	GROUP BY payment_id
	ORDER BY average_amount DESC
	LIMIT 10;
	
	-- Use of MAX() Function.
	
	SELECT MAX(amount) AS largest_amount
	FROM payment;
	
	-- Use of MIN() Function.
	
	SELECT MIN(amount) AS largest_amount
	FROM payment;
	
	--Using of " || " for Concatation function.
	SELECT first_name || ' ' ||last_name AS Full_name
	FROM customer;
	
	SELECT INITCAP(first_name) || INITCAP(last_name) || '@gamil.com' AS e_mail
	FROM customer;
	
	SELECT LEFT(first_name, 1) || LEFT(last_name, 1) || '@gmail.com' AS E_Mail
	FROM customer;
	
	-- Use Of Mathematical Operator's such as : +, -, /, *, % etc in SQL Query SELECT(4+2).
	
	SELECT(243+785) AS Addition;
	SELECT(45-25) AS Subtraction;
	SELECT(24*85) AS Multiplication;
	SELECT(125/5) AS Division;
	SELECT(525/25.00) AS Division;
	SELECT(243<785) AS Less_than;
	SELECT(243>85) AS Greater_than;
	SELECT(85=85) AS Equal;
	SELECT(73!=96) AS Not_Equal;
	SELECT(67%7) AS Modulo;
	
	SELECT ROUND(rental_rate/replacement_cost, 4)* 100 AS percent_cost
	FROM film
	
	SELECT 0.1 * replacement_cost AS deposit
	FROM film
	
	
	
	
	SELECT customer_id, staff_id, rental_id
	FROM payment
	WHERE rental_id>=600
	ORDER BY rental_id ASC;
	
	SELECT customer_id, staff_id, rental_id
	FROM payment
	WHERE rental_id<=600
	ORDER BY rental_id ASC;
	
	SELECT customer_id, staff_id, rental_id
	FROM payment
	WHERE rental_id=600;
	
	SELECT customer_id, staff_id, rental_id
	FROM payment
	WHERE rental_id!=600
	ORDER BY rental_id ASC;
	
	SELECT customer_id, staff_id, rental_id, amount
	FROM payment
	WHERE amount>=(SELECT MAX(amount) FROM payment)
	ORDER BY amount DESC;
	
	
	--  Assignment onto the JOIN.
	SELECT *
	FROM address
	INNER JOIN customer
	ON customer.address_id=address.address_id
	WHERE district='California'
	
	SELECT address, customer.address_id, district, email
	FROM address
	INNER JOIN customer
	ON customer.address_id=address.address_id
	
	SELECT city_id, first_name, district, active
	FROM address
	INNER JOIN customer
	ON customer.address_id=address.address_id
	WHERE district='Dhaka'
	ORDER BY city_id;
	
	SELECT actor.actor_id AS actor_id, first_name, film_id
	FROM actor
	LEFT JOIN film_actor
	ON actor.actor_id=film_actor.actor_id
	WHERE film_id BETWEEN 100 AND 200
	ORDER BY actor_id;
	
	SELECT title, first_name, last_name 
	FROM film_actor 
	INNER JOIN actor
	ON film_actor.actor_id=actor.actor_id
	INNER JOIN film
	ON film_actor.film_id=film.film_id
	WHERE first_name='NICK' AND last_name='WAHLBERG'
	
	--Using of " LENGTH " to count the each character from the Column.
	SELECT COUNT(LENGTH(description)) AS Total
	FROM film;
	
	--Using of " UPPER " to Captialize the each character from the Column.
	SELECT UPPER(description) AS upper_case
	FROM film;
	
	--Using of " LOWER " to Small/lower case the each character from the Column.
	SELECT LOWER(description) AS upper_case
	FROM film;	
	
	--Using of " UNION " Logical Operator.
	SELECT COUNT(actor_id) FROM film_actor
	UNION
	SELECT COUNT(actor_id) FROM actor;
	
	
	SELECT COUNT(actor_id) FROM film_actor
	UNION ALL
	SELECT COUNT(actor_id) FROM actor;
	
	
	SELECT actor_id FROM film_actor
	INTERSECTION
	SELECT actor_id FROM actor;


	ALTER TABLE table_name
	RENAME COLUMN old_column_name TO new_column_name;
	
	ALTER TABLE table_name
	ADD column_name datatype;
	
	-- To select all even records in a table?
	SELECT * 
	FROM film
	WHERE MOD(film_id, 2) = 0;
	
	SELECT * 
	FROM city
	WHERE city_id % 2 = 0;
	
	SELECT COUNT(*) AS total
	FROM language
	WHERE language_id % 2 = 0;
	
	-- To select all Odd records in a table?
	SELECT * FROM film
	WHERE MOD(film_id, 2) != 0;
	
	SELECT * FROM city
	WHERE city_id % 2 != 0;
	
	SELECT COUNT(*) AS total
	FROM language
	WHERE language_id % 2 != 0;
	
	--Using the OFFSET clause, to find the 6th highest value from a column.
	SELECT * FROM rental
	ORDER BY inventory_id DESC
	LIMIT 5
	OFFSET 6;
	
	--Using the RANDOM() function in combination with ORDER BY and LIMIT to select random rows from a table.
	SELECT * FROM rental
	ORDER BY RANDOM()
	LIMIT 5;
	
	SELECT * FROM rental
	ORDER BY RANDOM() ASC
	LIMIT 5;
	
	SELECT * FROM rental
	ORDER BY RANDOM() DESC
	LIMIT 5;
	
	
	-- Returns a string converted to the title case.
	SELECT INITCAP(description) FROM film
	
	--returns the current date and time	
	SELECT NOW() AS real_time;
	
	--Using of " UNION " returns the records obtained by at least one of two queries (Excluding duplicates) .
	SELECT first_name, last_name FROM 	customer 
	UNION
	SELECT first_name, last_name FROM actor ORDER BY first_name ASC, last_name ASC;
	
	
	--Using of " UNION ALL " returns the records obtained by at least one of two queries (including duplicates).
	SELECT first_name, last_name FROM 	customer 
	UNION ALL
	SELECT first_name, last_name FROM actor ORDER BY first_name ASC, last_name ASC;
	
	--Using of " INTERSECT " returns the records obtained by both queries.
	SELECT first_name, last_name FROM 	customer 
	INTERSECT
	SELECT first_name, last_name FROM actor ORDER BY first_name ASC, last_name ASC;
	
	SELECT first_name || ' ' ||last_name AS full_name FROM customer  
	INTERSECT
	SELECT first_name || ' ' ||last_name AS full_name FROM actor;
	
	--Using of " EXCEPT "  returns only the records obtained by the first query but not the second one.
	SELECT first_name, last_name FROM 	customer 
	EXCEPT 
	SELECT first_name, last_name FROM actor ORDER BY first_name ASC, last_name ASC;
	
	SELECT first_name || ' ' ||last_name AS full_name FROM customer  
	EXCEPT
	SELECT first_name || ' ' ||last_name AS full_name FROM actor;
	
	--Use of " CASE " condition with " CASE- 'WHEN-THEN' - 'WHEN-THEN' - 'ELSE' - 'END AS' "
	SELECT UPPER(city), country_id,
	CASE
	WHEN "country_id" > 100 THEN 'The rental_id is greater than 100'
	WHEN "country_id" = 100 THEN 'The rental_id is equal to 100'
	ELSE 'The rental_id is under 100'
	END AS QuantityText
	FROM city; 
	
	
	SELECT  payment_id, customer_id, rental_id, amount, payment_date, 
	CASE
		WHEN amount > 5.00 THEN 'The amount is Greater than 5.00'
		WHEN amount = 5.00 THEN 'The amount is equal to 5.00'
		ELSE 'The amount is Under 5.00'
	END AS QUANTITY_BRIEF
	FROM payment;


	SELECT  *,
	CASE
		WHEN amount > 5.00 THEN 'The amount is Greater than 5.00'
		WHEN amount = 5.00 THEN 'The amount is equal to 5.00'
		ELSE 'The amount is Under 5.00'
	END AS QUANTITY_BRIEF
	FROM payment;
	
	SELECT * FROM customer
	
	SELECT first_name, last_name, LENGTH(email) AS Length_of_email, email,
	CASE
		WHEN LENGTH(email) > 25 THEN 'The LENGTH of email is Greater than 25'
		WHEN LENGTH(email) = 25 THEN 'The LENGTH of email is equal to 25'
		ELSE 'The LENGTH of email is Under 25'
	END AS QUANTITY_BRIEF
	FROM customer
	WHERE LENGTH(email) BETWEEN 25 AND 30 
	ORDER BY Length_of_email;
	
	--Add a column to a table Using the ALTER TABLE statement in combination with ADD.
	ALTER TABLE table_name
	ADD column_name datatype
	
	--To rename a column of a table Using the ALTER TABLE statement in combination with RENAME COLUMN ... TO ....
	ALTER TABLE table_name
	RENAME COLUMN old_column_name TO new_column_name;
	
	-- CROSS JOIN
	SELECT * 
	FROM customer
	CROSS JOIN payment;
	
	SELECT COUNT(*) AS total_id
	FROM customer
	CROSS JOIN payment;
	
	--An " EQUI JOIN " is a type of join operation in a database that combines rows
	--from two or more tables based on a matching condition using the equality operator (=). 
	--It is used to retrieve data where values in specified columns are equal.
	
	SELECT customer.first_name,customer.last_name, actor.first_name, actor.last_name
	FROM customer, actor
	WHERE customer.first_name = actor.first_name AND customer.last_name = actor.last_name ;
	
	SELECT customer.first_name, staff.first_name
	FROM customer, staff
	WHERE  customer.first_name = staff.first_name;
	
	SELECT customer.last_name, staff.last_name
	FROM customer, staff
	WHERE  customer.last_name = staff.last_name;
	
	--Same Query " EQUI JOIN " Execute using " INNER JOIN ".
	SELECT customer.first_name,customer.last_name, actor.first_name, actor.last_name
	FROM customer
	INNER JOIN actor ON
	customer.first_name = actor.first_name 
	AND customer.last_name = actor.last_name ;
	
	--It's Also same query output but it gives everything from table's
	SELECT * FROM customer 
	JOIN actor
	USING (first_name, last_name);
	
	SELECT * FROM customer 
	JOIN address
	USING (address_id);
	
	SELECT * FROM customer 
	JOIN staff
	USING (email);
	
	--To see the Realtime " TIMESTAMP "
	SHOW ALL;
	
	SHOW TIMEZONE
	
	SELECT NOW()
		
	-- Using of " EXTRACT " 'QUARTER', 'MONTH', 'YEAR' etc.
	SELECT EXTRACT(YEAR FROM payment_date) AS M_Year
	FROM payment;
	
	SELECT EXTRACT(MONTH FROM payment_date)
	FROM payment
	
	--Using of " AGE " function to calculate the age at specific date.
	SELECT AGE(payment_date)
	FROM payment
	
	-- Using of " TO_CHAR ".
	SELECT TO_CHAR(payment_date, 'MONTH- YYYY')
	FROM payment
	
	SELECT TO_CHAR(payment_date, 'mon/dd/YYYY')
	FROM payment
		
	SELECT TO_CHAR(payment_date, 'DAY- YYYY')
	FROM payment
	
	SELECT DISTINCT( TO_CHAR(payment_date, 'MONTH'))
	FROM payment
	
	SELECT COUNT(*) AS total_Monday
	FROM payment
	WHERE EXTRACT(dow FROM payment_date)= 1
	
	--Using of " SUBQUERY " FUCTION and STRING in SQL.
	
	SELECT film_id, title, length
	FROM film
	WHERE length >(
	SELECT AVG(length) FROM film)
	
	SELECT city_id, city, country_id
	FROM city
	WHERE country_id >(
	SELECT AVG(country_id) FROM city);
	
	SELECT title, rental_rate FROM film
	WHERE rental_rate>
	(SELECT AVG(rental_rate) FROM film);
	
	SELECT customer_id, first_name 
	FROM customer
	WHERE first_name IN ('MARY','ALICE','TAMMY','JANE');
	
	SELECT rental_id, inventory_id FROM rental
	WHERE inventory_id IN( SELECT inventory_id FROM inventory );
	
	SELECT film_id,title
	FROM film
	WHERE film_id IN
	(SELECT inventory.film_id
	FROM rental
	INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
	WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
	ORDER BY film_id;
	
	SELECT first_name, last_name
	FROM customer AS c
	WHERE EXISTS
	( SELECT * FROM payment AS p
	WHERE p.customer_id = c .customer_id
	AND amount > 11)
	
	SELECT first_name, last_name FROM staff AS s
	WHERE EXISTS 
	( SELECT * FROM payment AS p 
	WHERE s.staff_id = p.staff_id AND amount < 5)
	
	SELECT f1.title, f2.title, f1.length
	FROM film AS f1
	JOIN film AS f2 ON
	f1.film_id = f2.film_id
	AND f1.length = f2.length
	
	SELECT f1.title, f2.title, f1.length
	FROM film AS f1
	JOIN film AS f2 ON
	f1.film_id != f2.film_id
	AND f1.length = f2.length
	
	SELECT act.last_name, cus.first_name
	FROM customer AS cus
	CROSS JOIN actor AS act;
	
	
	
	Exercise :
	
	
	--(1)How can you retrieve all the information from the cd.facilities table?
	
	SELECT * FROM cd.facilities;
	
	--(2).You want to print out a list of all of the facilities and 
	--     their cost to members. How would you retrieve a list of only facility names and costs?
	
	SELECT name, membercost
	FROM cd.facilities
	
	--(3).How can you produce a list of facilities that charge a fee to members?
	--Expected Results should have just 5 rows:
	
	SELECT *
	FROM cd.facilities
	WHERE membercost>0
	LIMIT 5;
	
	-- (4).How can you produce a list of facilities that charge a fee to members, and 
	-- 	that fee is less than 1/50th of the monthly maintenance cost? 
	-- 	Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
	
	SELECT facid, name, membercost, monthlymaintenance
	 FROM cd.facilities
	 WHERE membercost > 0 AND
	 (membercost < monthlymaintenance/50.0);
	
	--(5).How can you produce a list of all facilities with the word 'Tennis' in their name?
	
	SELECT *
	FROM cd.facilities
	WHERE name LIKE '%Tennis' OR name LIKE 'Tennis%';
	
	SELECT *
	FROM cd.facilities
	WHERE name LIKE '%Tennis%';
	
	-- (6).How can you retrieve the details of facilities with ID 1 and 5?
	-- 	Try to do it without using the OR operator.
	
	SELECT * 
	FROM cd.facilities
	WHERE facid IN (1,5);
	
	--(8).How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
	SELECT memid, surname, firstname, joindate 
	FROM cd.members WHERE joindate >= '2012-09-01';
	
	--(9).How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.
	SELECT DISTINCT surname FROM cd.members
	ORDER BY  surname LIMIT 10;
	
	--(10).You'd like to get the signup date of your last member. How can you retrieve this information?
	SELECT MAX(joindate) AS latest_signup FROM cd.members;
	Produce a count of the number of facilities that have a cost to guests of 10 or more.
	SELECT COUNT(*) FROM cd.facilities WHERE guestcost >= 10;
	
	--(11).Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.
	SELECT facid, sum(slots) AS "Total Slots" FROM cd.bookings WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01' GROUP BY facid ORDER BY SUM(slots);
	
	--(12).Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.
	 SELECT facid, sum(slots) AS total_slots FROM cd.bookings GROUP BY facid HAVING SUM(slots) > 1000 ORDER BY facid;
	
	.--(13).How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
	SELECT cd.bookings.starttime AS start, cd.facilities.name 
	AS name 
	FROM cd.facilities 
	INNER JOIN cd.bookings
	ON cd.facilities.facid = cd.bookings.facid 
	WHERE cd.facilities.facid IN (0,1) 
	AND cd.bookings.starttime >= '2012-09-21' 
	AND cd.bookings.starttime < '2012-09-22' 
	ORDER BY cd.bookings.starttime;
	
	
	--(14).How can you produce a list of the start times for bookings by members named 'David Farrell'?
		
	SELECT cd.bookings.starttime 
	FROM cd.bookings 
	INNER JOIN cd.members ON 
	cd.members.memid = cd.bookings.memid 
	WHERE cd.members.firstname='David' 
	AND cd.members.surname='Farrell';
	
	
	
