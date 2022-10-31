
## qustion 1 current employees with the same hire date as employee 101010
SELECT * FROM employees
WHERE emp_no = (SELECT emp_no FROM employees WHERE emp_no = 101010);
SELECT * FROM employees
JOIN dept_emp USING (emp_no)
WHERE hire_date = ( SELECT hire_date
					FROM employees
						WHERE emp_no = 101010)
AND to_date > CURDATE();


## QUESTION 2, all titles with employees with first name Aamod
SELECT employees.first_name, titles.title
FROM employees
JOIN titles
ON employees.emp_no = titles.emp_no
WHERE first_name = 'Aamod'
GROUP BY titles.title;

## q3 -- total employees that are no longer working
SELECT COUNT(first_name)
FROM employees
JOIN titles
ON employees.emp_no = titles.emp_no
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN salaries
ON salaries.emp_no = dept_emp.emp_no
WHERE titles.to_date < NOW()
AND dept_emp.to_date < NOW()
AND salaries.to_date < NOW();

##q4 -- Leon DasSarma, Isamu Legleitner, Karsten Sigstam, and Hilary Kambil
SELECT departments.dept_name
AS 'Department Name',
CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date LIKE '9999-%-%'
AND employees.gender = 'F'
ORDER BY departments.dept_name;

## q5 these are the employee numbers that currently make more than the company average salary

SELECT dept_manager.emp_no, salaries.salary FROM dept_manager
JOIN salaries
ON dept_manager.emp_no = salaries.emp_no
WHERE salaries.to_date > NOW()
AND salaries.salary > (select avg(salary) from salaries);

## q6 list of current employees that earn a salary within one standard deviation of the highest salary

select COUNT(salaries.salary) FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no
WHERE salaries.salary BETWEEN (Select max(salary)- std(salary) from salaries)
AND (select max(salary) + std(salary) from
 salaries)
AND salaries.to_date > now();

describe dept_emp

