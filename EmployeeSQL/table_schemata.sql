-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(10)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(200)   NOT NULL,
    last_name varchar(200)   NOT NULL,
    sex char(1)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary numeric   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Titles (
    title_id varchar(10)   NOT NULL,
    title varchar(50)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Departments (
    dept_no varchar(10)   NOT NULL,
    dept_name varchar(50)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE DepartmentManager (
    dept_no varchar(10)   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAINT pk_DepartmentManager PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE DepartmentEmployee (
    emp_no int   NOT NULL,
    dept_no varchar(10)   NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Salaries (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE DepartmentManager ADD CONSTRAINT fk_DepartmentManager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE DepartmentManager ADD CONSTRAINT fk_DepartmentManager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE DepartmentEmployee ADD CONSTRAINT fk_DepartmentEmployee_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE DepartmentEmployee ADD CONSTRAINT fk_DepartmentEmployee_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);