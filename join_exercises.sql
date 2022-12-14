USE join_example_db;

SELECT * FROM roles;
-- id, name
SELECT * FROM users;
-- id, name, email, role_id

SELECT roles.name, COUNT(roles.id) -- this shows the amount of users in each role
FROM users
JOIN roles
ON users.role_id = roles.id
GROUP BY roles.name;

SELECT first_name
FROM employees
JOIN dept_manager
;

# Q2 current managers of departments
SELECT departments.dept_name
AS 'Department Name',
CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date LIKE '9999-%-%';

# Q3 departments managed by women
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


-- Q4 current employees working in customer service
SELECT titles.title, COUNT(titles.title) as count
FROM titles
JOIN dept_emp
ON titles.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Customer Service'
AND titles.to_date LIKE '9999-%-%'
AND dept_emp.to_date LIKE '9999-%-%'
GROUP BY titles.title
ORDER BY titles.title;

-- Q5 salary of all current managers
SELECT departments.dept_name
AS 'Department Name',
CONCAT(first_name, ' ', last_name) AS 'Department Manager', salaries.salary
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN salaries
ON dept_manager.emp_no = salaries.emp_no
WHERE dept_manager.to_date LIKE '9999-%-%'
AND salaries.to_date LIKE '9999-%-%'
ORDER BY departments.dept_name;

-- Q6 Current number of employees in each department

SELECT departments.dept_no, departments.dept_name, COUNT(dept_emp.emp_no)
FROM departments
join dept_emp
on departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date LIKE '9999-%-%'
GROUP BY departments.dept_no
ORDER BY dept_no;

-- Q7 DEPARTMENT WITH HIGHEST AVERAGE salary
SELECT d.dept_name, ROUND(AVG(s.salary),2)
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN salaries AS s
ON s.emp_no = e.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE de.to_date LIKE '9999-%-%'
AND s.to_date LIKE '9999-%-%'
GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC
LIMIT 1;

-- 8 highest paid employee in Marketing

SELECT employees.first_name, employees.last_name
FROM employees
JOIN salaries
ON salaries.emp_no = employees.emp_no
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Marketing'
ORDER BY salaries.salary DESC
LIMIT 1;

-- q9 current department manager with highest salary
SELECT employees.first_name, employees.last_name, salaries.salary, departments.dept_name
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN salaries
ON dept_manager.emp_no = salaries.emp_no
WHERE dept_manager.to_date LIKE '9999-%-%'
AND salaries.to_date LIKE '9999-%-%'
ORDER BY salaries.salary DESC
LIMIT 1;

-- q10 department average salaries of all time rounded to the nearest integer
SELECT departments.dept_name, ROUND(AVG(salaries.salary),0)
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN salaries
ON salaries.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_emp.dept_no
GROUP BY departments.dept_name
ORDER BY AVG(salaries.salary) DESC


CONCAT(first_name, ' ', last_name) AS 'Employee Name', ;

## bonus q11
SELECT departments.dept_name
AS 'Department Name',
CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date LIKE '9999-%-%';

SELECT CONCAT(first_name, ' ', last_name) AS Employee_Name, departments.dept_name as Department_Name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON 	dept_emp.dept_no = departments.dept_no
;
-- Here is the answer!!!!!!!!!!
SELECT g.Employee_Name, g.Department_Name, h.Department_Manager
FROM (SELECT CONCAT(first_name, ' ', last_name) AS Employee_Name, departments.dept_name as Department_Name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
ON 	dept_emp.dept_no = departments.dept_no
) AS g 
JOIN (SELECT departments.dept_name
AS Department_Name2,
CONCAT(first_name, ' ', last_name) AS Department_Manager
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date LIKE '9999-%-%') AS h
ON g.Department_Name = h.Department_Name2