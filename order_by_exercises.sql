
-- order by exercises
-- 2. Irena Reutenauer
-- 3. Irena Acton, first, Vidya Zwiezig last
-- 4. Irena Acton, first, Maya Zyda
-- 5. 899 employees returned, 10021 Ramzi Erde first
		-- last  499648 Tadahiro Erde

select * from employees where last_name like 'E%'
	and last_name like '%e'
	group by emp_no;
	
-- 6.
select * from employees where last_name like 'E%'
	and last_name like '%e'
	order by hire_date DESC; /*899 employees returned Teiji Eldridge is the newest employee
	and Sergi Erde is the oldest employee */
	
-- 7.

select * from employees 
	where hire_date between '1990-01-01' and '1999-12-31'
	and birth_date like '%-12-25'
	order by birth_date ASC, hire_date DESC; /* 362 employees oldest employee who was hired last
	-- Khun Bernini, youngest employee hired first Douadi Pettis
