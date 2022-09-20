Create table departments(
     dept_no VARCHAR PRIMARY KEY, 
     dept_name VARCHAR
);

Create table titles(
     title_id VARCHAR PRIMARY KEY,
	 title VARCHAR NOT NULL
);

Create table employees(
     emp_no INT PRIMARY KEY,
	 emp_title_id VARCHAR NOT NULL,
	 birth_date VARCHAR NOT NULL,
	 first_name VARCHAR NOT NULL,
	 last_name VARCHAR NOT NULL,
	 sex VARCHAR NOT NULL,
	 hire_date VARCHAR NOT NULL,
	 FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

Create table dept_emp(
     emp_no int,
     dept_no VARCHAR,
     PRIMARY KEY (emp_no, dept_no),
     FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
     FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

Create table salaries(
     emp_no INT PRIMARY KEY,
	 salary INT NOT NULL,
	 FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

Create table dept_manager(
     dept_no VARCHAR NOT NULL,
	 emp_no INT NOT NULL,
	 PRIMARY KEY (dept_no, emp_no),
	 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	 FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--1. 
SELECT employees.emp_no, employees.last_name, employees.first_name,employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--2. 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--3. 
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

--4. 
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no; 

--5. 
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007';

--7.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = dept_emp.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005';

--8. 
SELECT last_name, COUNT(last_name) AS "frequency count"
FROM employees
GROUP BY last_name
ORDER BY "frequency count" DESC
