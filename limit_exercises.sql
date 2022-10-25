# question 2
SELECT DISTINCT last_name
FROM employees
order by LAST_NAME DESC
LIMIT 10;

# question 3
SELECT * FROM employees
	WHERE birth_date like '%-12-25'
	AND	 hire_date like '199%'
	ORDER BY hire_date ASC
	LIMIT 5;
# Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, and Petter Stroustrup are the first 5

# question 4
SELECT * FROM employees
	WHERE birth_date like '%-12-25'
	AND	 hire_date like '199%'
	ORDER BY hire_date ASC
	LIMIT 5 OFFSET 45;

