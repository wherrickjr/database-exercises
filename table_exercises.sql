SHOW DATABASES;
USE employees;
DESCRIBE employees;
/* Which table(s) do you think contain a numeric type column?
 emp_no is the only one with a numeric type
 
 Which table(s) do you think contain a string type column? 
 first_name, last_name, enum are string type columns
 
 Which table(s) do you think contain a date type column? 
 birth_data and hire_date are date type columns
 
 What is the relationship between the employees and the departments tables?
 I would think the department table tells what department the employee from the emloyee table is in
 
 Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
 CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */
 
 SHOW TABLES;
 USE employees;
 USE departments;
 SHOW departments;
 USE dept_emp;
 DESCRIBE departments;
 EXPLAIN departments;
 DESCRIBE employees;

SHOW CREATE TABLE dept_manager;