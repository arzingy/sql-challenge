-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp_no, last_name, first_name, sex, salary
FROM employees
	JOIN salaries USING (emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
	JOIN dept_manager USING (dept_no)
	JOIN employees AS e USING (emp_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM departments AS d
	JOIN dept_emp USING (dept_no)
	JOIN employees AS e USING (emp_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT last_name, first_name, sex
FROM employees
WHERE first_name ILIKE 'Hercules'
	AND last_name ILIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
	JOIN dept_emp USING (emp_no)
	JOIN departments AS d USING (dept_no)
WHERE d.dept_name ILIKE 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp USING (emp_no)
	JOIN departments AS d USING (dept_no)
WHERE d.dept_name ILIKE 'Sales'
	OR d.dept_name ILIKE 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*)
FROM employees
GROUP BY 1
ORDER BY 2 DESC;