--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM employees AS e, salaries AS s
	WHERE e.emp_no = s.emp_no;
	
--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
	FROM employees
	WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
	FROM departmentmanager AS dm, departments AS d, employees AS e
	WHERE dm.emp_no = e.emp_no AND dm.dept_no = d.dept_no
	ORDER BY dm.dept_no, dm.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM departmentemployee AS de, employees AS e, departments AS d
	WHERE de.emp_no = e.emp_no AND de.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
	FROM employees
	WHERE first_name = 'Hercules' AND last_name LIKE 'B__%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM departmentemployee AS de, employees AS e, departments AS d
	WHERE de.emp_no = e.emp_no AND de.dept_no = d.dept_no AND d.dept_name = 'Sales'
	ORDER BY e.last_name, e.first_name, de.emp_no;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
	FROM departmentemployee AS de, employees AS e, departments AS d
	WHERE de.emp_no = e.emp_no AND de.dept_no = d.dept_no AND d.dept_name in ('Development', 'Sales')
	ORDER BY e.last_name, e.first_name, de.emp_no;
	
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name), last_name
	FROM employees
	GROUP BY last_name 
	ORDER BY last_name DESC;
	
