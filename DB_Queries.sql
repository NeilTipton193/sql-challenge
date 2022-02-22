-- Alter tables to ensure every table has a primary key
ALTER TABLE dept_emp
	ADD PRIMARY KEY (emp_no, dept_no);
	
ALTER TABLE dept_manager
	ADD PRIMARY KEY (dept_no, emp_no);
	
ALTER TABLE salaries
	ADD PRIMARY KEY (emp_no, salary);
	

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
LEFT JOIN salaries as s ON
e.emp_no=s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments as d
LEFT JOIN dept_manager as m ON
d.dept_no=m.dept_no
LEFT JOIN employees as e ON
m.emp_no=e.emp_no;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_emp as m ON
e.emp_no=m.emp_no
LEFT JOIN departments as d ON
m.dept_no=d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT  first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_emp as m ON
e.emp_no=m.emp_no
LEFT JOIN departments as d ON
m.dept_no=d.dept_no
WHERE d.dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_emp as m ON
e.emp_no=m.emp_no
LEFT JOIN departments as d ON
m.dept_no=d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;



