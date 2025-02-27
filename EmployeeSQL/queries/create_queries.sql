DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE Departments (
    dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(20) NOT NULL
);

CREATE TABLE Employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(10) NOT NULL REFERENCES Titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE Salaries (
    emp_no INT NOT NULL PRIMARY KEY REFERENCES Employees(emp_no),
    salary INT NOT NULL
);

CREATE TABLE Dept_Emp (
    emp_no INT NOT NULL REFERENCES Employees(emp_no),
    dept_no VARCHAR(10) NOT NULL REFERENCES Departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE Dept_Manager (
    dept_no VARCHAR(10) NOT NULL REFERENCES Departments(dept_no),
    emp_no INT NOT NULL REFERENCES Employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);