SELECT * FROM employees;
/*  2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned. */

SELECT * FROM employees 
	WHERE first_name 
		IN ('Irena', 'Vidya', 'Maya'); -- 709 records of employees with irena, vidya or maya as their first name.
SELECT * FROM employees 
	WHERE first_name = 'Irena' 
		or first_name = 'Vidya' 
		or first_name = 'Maya'; -- Q3

/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.*/
SELECT * FROM employees 
	WHERE (first_name = 'Irena' 
	OR first_name = 'Vidya' 
	OR first_name = 'Maya')
	AND	gender = 'M'; -- 441 records of employees with irena vidya or maya as their name and are male.

/* Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.*/
SELECT * FROM employees
	WHERE last_name LIKE 'E%'; -- 7330 employees with last name that starts with E

/* Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?*/
SELECT * FROM employees
	WHERE last_name LIKE 'E%' -- 30723 employees with last name that starts or ends with E
	OR last_name LIKE '%e';
	
SELECT * FROM employees
	WHERE last_name NOT LIKE 'E%' -- 23393 employees that end with e and don't start with E
	AND last_name LIKE '%e';

/* Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?*/

SELECT * FROM employees -- 899 employees that start and end with E
	WHERE last_name LIKE 'E%'
	AND last_name LIKE '%e';
	
select * from employees where last_name like '%e'; -- 24292 end with E

/* Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.*/

select * from employees where hire_date between '1990-01-01' and '1999-12-31'; -- 135214 employees 

/* Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.*/

select * from employees where birth_date like '%-12-25'; -- 842 employees born on christmas

/*Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned. */

select * from employees 
	where hire_date between '1990-01-01' and '1999-12-31'
	and birth_date like '%-12-25'; -- there are 362 employees that fit this
	
/* Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.*/

select * from employees where last_name like '%q%'; -- 1873 

/* Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? */

select * from employees where last_name not like '%qu%' and last_name like '%q%'; -- 547
