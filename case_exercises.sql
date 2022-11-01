use employees;
describe dept_emp;

# number 1, table with first_name, last_name, dept_no, start date, end date, and 1 if current employee, 0 if not current employee.
select e.first_name, e.last_name, d.dept_no, d.from_date, d.to_date,
if (d.to_date > now(), True, False) as is_current_employee
from employees as e
join dept_emp as d
using (emp_no);


# number 2, all employees with first letter of last name

select first_name, last_name,
	case
		when last_name rlike '^[a-h]' then 'A-H'
		when last_name rlike '^[i-q]' then 'I-Q'
		when last_name rlike '^[r-z]' then 'R-Z'
		else null
	end as 'alpha_group'
from employees;

#3 how many employees were born in each decade?
