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
