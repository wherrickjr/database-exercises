DESCRIBE titles;

# q2, 7 unique titles
SELECT DISTINCT title FROM titles;


# q3
SELECT last_name FROM employees
GROUP BY last_name
HAVING last_name LIKE 'E%e';


#q4

SELECT first_name, last_name FROM employees
GROUP BY first_name, last_name
HAVING last_name LIKE 'E%e'
ORDER BY first_name, last_name;

# q5 - Cleq, Lindqvist, and Qiwen
SELECT last_name FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

# q6
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name;

# q7
SELECT gender, COUNT(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

# Q8 Yes, there are 13251
SELECT CONCAT(SUBSTR(first_name, 1, 1),
SUBSTR(last_name, 1, 4),'_',
SUBSTR(birth_date, 6,2),
SUBSTR(birth_date, 3, 2))
AS user_name,
COUNT(*) AS duplicates
FROM employees
GROUP BY user_name
HAVING duplicates >1;

SELECT CONCAT(SUBSTR(first_name, 1, 1),
SUBSTR(last_name, 1, 4),'_',
SUBSTR(birth_date, 6,2),
SUBSTR(birth_date, 3, 2))
AS user_name,
COUNT(*) AS duplicates
FROM employees
GROUP BY user_name;
