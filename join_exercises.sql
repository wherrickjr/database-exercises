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

# Q2 
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

# Q4
SELECT * from departments
LIMIT 10;
-- current employees working in customer service
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

-- Q5

select * from depatments;
