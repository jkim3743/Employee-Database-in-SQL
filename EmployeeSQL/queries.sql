-- #1 List the following details of each employee:
-- employee number, last name, first name, sex, and salary.
SELECT employees.emp_no as "Employee #", employees.last_name as "Last name",
employees.first_name as "First name", employees.sex, salaries.salary
from employees
JOIN salaries ON salaries.emp_no = employees.emp_no

-- #2 List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name as "First name", last_name as "Last name", hire_date
from employees
where extract(year from hire_date) = 1986;

-- #3 List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name. 
SELECT dept_manager.dept_no as "Department #", departments.dept_name as "Department name",
dept_manager.emp_no as "Employee #", employees.last_name, employees.first_name
from dept_manager
JOIN departments ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no;
 
-- #4 List the department of each employee with the following information: 
-- employee number, last name, first name, and department name. 
SELECT employees.emp_no as "Employee #", employees.last_name, employees.first_name, departments.dept_name
from employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;
 
-- #5 List first name, last name, and sex for employees whose
-- first name is "Hercules" and last names begin with "B."
SELECT first_name as "First name", last_name as "Last name", sex
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%';

-- #6 List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee #", e.last_name, e.first_name, d.dept_name
from employees as e
JOIN dept_emp ON dept_emp.emp_no = e.emp_no
JOIN departments as d ON d.dept_no = dept_emp.dept_no
WHERE d.dept_name = 'Sales';

-- #7 List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee #", e.last_name, e.first_name, d.dept_name
from employees as e
JOIN dept_emp ON dept_emp.emp_no = e.emp_no
JOIN departments as d ON d.dept_no = dept_emp.dept_no
WHERE (d.dept_name = 'Sales' or d.dept_name = 'Development');

-- #8 In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT last_name, count(last_name) as Frequency
from employees
group by last_name
order by Frequency DESC;

-- Extra analysis to see employee's department name and salaries in descending order
SELECT employees.emp_no as "Employee #", employees.last_name as "Last name",
employees.first_name as "First name", employees.sex, salaries.salary, departments.dept_name
from employees
JOIN salaries ON salaries.emp_no = employees.emp_no
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
-- Arragne salary in descending order
Order by salary DESC;

-- Average employee salary
select round(avg(salary),2)
from salaries;