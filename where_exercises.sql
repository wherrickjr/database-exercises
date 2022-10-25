# q2
SELECT * FROM employees 
	WHERE first_name
	IN ('Irena', 'Vidya', 'Maya')
	ORDER BY first_name; 
# first person: Irena reutenauer, last person: Vidya Simmen

	
#q3
SELECT * FROM employees 
	WHERE first_name
	IN ('Irena', 'Vidya', 'Maya')
	ORDER BY first_name, last_name;
 #first person Irena Acton, Last person: Vidya Zweizig
 
 #q4
 SELECT * FROM employees 
	WHERE first_name
	IN ('Irena', 'Vidya', 'Maya')
	ORDER BY last_name, first_name;
# first person: Irena Acton, last person: Maya Zyda

#q5
SELECT * FROM employees
	WHERE last_name like 'E%e'
	ORDER BY emp_no;
# 899 employees, first: 10021 Ramzi Erde, last: 499648 Tadahiro Erde

#q6
SELECT * FROM employees
	WHERE last_name like 'E%e'
	ORDER BY hire_date DESC;
# 899 employees returned, newest: Teiji Eldridge, longest: Sergi Erde

#7
SELECT * FROM employees
	WHERE birth_date like '%-12-25'
	AND hire_date like '199%'
	ORDER BY hire_date DESC, birth_date ASC
# 362 employees, oldest last: Khun Bernini, youngest first: Alselm Cappello