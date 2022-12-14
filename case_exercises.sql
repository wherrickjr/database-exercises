use employees;
describe dept_emp;

# number 1, table with first_name, last_name, dept_no, start date, end date, and 1 if current employee, 0 if not current employee.
select e.first_name, e.last_name, d.dept_no, d.from_date, d.to_date, to_date > now() as is_current_employee
from employees as e
join dept_emp as d
using (emp_no);


# number 2, all employees with first letter of last name

select first_name, last_name,
	case
		when last_name rlike '^[a-h]' then 'A-H'
		when last_name rlike '^[i-q]' then 'I-Q'
		else 'R-Z'
	end as alpha_group
from employees;

#3 how many employees were born in each decade?

create temporary table noether_2026.birthday_decades(
	n int unsigned not null);
	
insert into noether_2026.birthday_decades(n) values (1950), (1960),(1970), (1980);

alter table noether_2026.birthday_decades add count_birth_date int;

update noether_2026.birthday_decades set count_birth_date = (select count(emp_no) from employees where birth_date like '195%-%-%' ) where n = '1950';
update noether_2026.birthday_decades set count_birth_date = (select count(emp_no) from employees where birth_date like '196%-%-%' ) where n = '1960';
update noether_2026.birthday_decades set count_birth_date = (select count(emp_no) from employees where birth_date like '197%-%-%' ) where n = '1970';
update noether_2026.birthday_decades set count_birth_date = (select count(emp_no) from employees where birth_date like '198%-%-%' ) where n = '1980';

select * from noether_2026.birthday_decades;

## number 3 answer: 182886 born in 1950s, and 117138 born in 1960s


## here is another way to do number 3 without temp table

select count(*),
case
when birth_date >= '1960-01-01' then '60s'
when birth_date >= '1950-01-01' then '50s'
end as 'birth_decade'
from employees
group by birth_decade;

#question 4
select round(AVG(salaries.salary),2) as average_salary,
case
when dept_name in ("Development", "Research") then 'R&D'
when dept_name in ("Sales", "Marketing") then 'Sales & Marketing'
when dept_name in ("Production", "Quality Managment") then 'Prod & QM'
when dept_name in ("finance", "Human Resources") then 'Finance & HR'
else 'Customer Service'
end as dept_group
from dept_emp
	join departments
		using(dept_no)
	join salaries
		using(emp_no)
where salaries.to_date > now()
and dept_emp.to_date > now()
group by dept_group;



#another way of doing number 2

select last_name,
case
when last_name like 'a%' then 'A-H'
when last_name like 'b%' then 'A-H'
when last_name like 'c%' then 'A-H'
when last_name like 'd%' then 'A-H'
when last_name like 'e%' then 'A-H'
when last_name like 'f%' then 'A-H'
when last_name like 'g%' then 'A-H'
when last_name like 'h%' then 'A-H'
when last_name like 'i%' then 'I-Q'
when last_name like 'j%' then 'I-Q'
when last_name like 'k%' then 'I-Q'
when last_name like 'l%' then 'I-Q'
when last_name like 'm%' then 'I-Q'
when last_name like 'n%' then 'I-Q'
when last_name like 'o%' then 'I-Q'
when last_name like 'p%' then 'I-Q'
when last_name like 'q%' then 'I-Q'
else 'R-Z'
end as alpha_group
from employees;

--  or! we could do for number 2:
select first_name, last_name, left(last_name,1),
case
when left(last_name, 1) <= 'H' then 'A-H'
when left(last_name,1) <= 'Q' then 'A-H'
else 'R-Z'
end as 'alpha_group'
from employees;
