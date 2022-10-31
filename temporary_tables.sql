CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL,
	name VARCHAR(10) NOT NULL
);
SELECT *
FROM my_numbers;
DROP TABLE IF EXISTS my_numbers;

CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL,
		name VARCHAR(10) NOT NULL
		);

SELECT *
FROM my_numbers;

INSERT INTO my_numbers(n, name)
VALUES (1, 'A'), (2, 'B'), (3, 'C'), (4, 'D'), (5, 'E');

# DELETE FROM MY_NUMBERS
DELETE FROM my_numbers WHERE N > 4;

# transform our exisiting data


UPDATE my_numbers SET N = N+ 1;

create temporary table noether_2026.employees_with_departments as select first_name, last_name, dept_name 
from employees
join dept_emp using(emp_no)
join departments using(dept_no)
where dept_emp.to_date > now();

select * from noether_2026.employees_with_departments as p;

alter table noether_2026.employees_with_departments add full_name VARCHAR(100);

update noether_2026.employees_with_departments
set full_name = CONCAT(first_name, ' ', last_name);

select * from noether_2026.employees_with_departments;

#1. part c, remove first_name and last_name

alter table noether_2026.employees_with_departments drop column first_name;

alter table noether_2026.employees_with_departments drop column last_name;

select * from noether_2026.employees_with_departments;



# number 2

describe payment;

create temporary table noether_2026.tpayment as
select amount from payment;

describe noether_2026.tpayment;

select * from noether_2026.tpayment;

select round(amount*100) from noether_2026.tpayment;


# number 3
use employees;

create temporary table noether_2026.average_salary_per_department as
select dept_name, AVG(salary) from departments
join dept_emp using (dept_no)
join salaries using (emp_no)
where salaries.to_date > now()
group by dept_name;

select * from noether_2026.average_salary_per_department
);


create temporary table noether_2026.average_salary_per_department2 as
select dept_name, AVG(salary) from departments
join dept_emp using (dept_no)
join salaries using (emp_no)
where salaries.to_date > now()
group by dept_name;

select * from noether_2026.average_salary_per_department2;

create temporary table noether_2026.average_salary_per_department as
select dept_name, AVG(salary) as average_salary from departments
join dept_emp using (dept_no)
join salaries using (emp_no)
where salaries.to_date > now()
group by dept_name;

select * from noether_2026.average_salary_per_department;

select dept_name,  (average_salary - (SELECT average_salary FROM noether_2026.average_salary_per_department))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore from noether_2026.average_salary_per_department;

SELECT dept_name, average_salary,
    (average_salary - (SELECT AVG(salary) FROM salaries  where to_date >= now()))
    /
    (SELECT stddev(salary) FROM salaries  where to_date >= now()) AS zscore
FROM noether_2026.average_salary_per_department