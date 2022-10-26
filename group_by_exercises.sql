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

# Q9 B1 employees average salary
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;

describe dept_emp;
# B2
SELECT dept_no, COUNT(emp_no)
FROM dept_emp
GROUP BY dept_no;

#B3
SELECT emp_no, COUNT(salary)
FROM salaries
GROUP BY emp_no;

#B4
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no;

#B5
SELECT emp_no, MIN(salary)
FROM salaries
GROUP BY emp_no;

#B6
SELECT emp_no, STD(salary)
FROM salaries
GROUP BY emp_no;

# B7
SELECT emp_no, MAX(salary)
FROM salaries
WHERE salary > 150000
GROUP BY emp_no;

# B8
SELECT emp_no, AVG(salary)
FROM salaries
WHERE salary 
BETWEEN 80000 AND 90000
GROUP BY emp_no;





