DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA IF NOT EXISTS public;

CREATE TABLE Employee (
    EmployeeID int   NOT NULL,
    BirthDate date   NOT NULL,
    FirstName varchar(100)   NOT NULL,
    LastName varchar(100)   NOT NULL,
    Gender char(1)   NOT NULL,
    HireDate date   NOT NULL DEFAULT '1858-11-30',
	UNIQUE(BirthDate,FirstName,LastName,HireDate),
    CONSTRAINT pk_Employee PRIMARY KEY (
        EmployeeID
     )
    -- FOREIGN KEY (animal_id) REFERENCES animals_all(animal_id)
);

CREATE TABLE Department (
    DepartmentID varchar(10)   NOT NULL,
    DeptName varchar(200) UNIQUE NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        DepartmentID
     )
);

CREATE TABLE Department_Employee (
    EmployeeID int   NOT NULL,
    DepartmentID varchar(10)   NOT NULL,
    FromDate date   NOT NULL DEFAULT '1858-11-30',
    ToDate date   NOT NULL DEFAULT '1858-11-30'
);

CREATE TABLE Department_Manager (
    DepartmentID varchar(10)   NOT NULL,
    EmployeeID int   NOT NULL,
    FromDate date   NOT NULL DEFAULT '1858-11-30',
    ToDate date   NOT NULL DEFAULT '1858-11-30'
);

CREATE TABLE Salary (
    EmployeeID int   NOT NULL,
    Salary decimal   NOT NULL,
    FromDate date   NOT NULL DEFAULT '1858-11-30',
    ToDate date   NOT NULL DEFAULT '1858-11-30'
);

CREATE TABLE Title (
    EmployeeID int   NOT NULL,
    Title varchar(300)   NOT NULL,
    FromDate date   NOT NULL DEFAULT '1858-11-30',
    ToDate date   NOT NULL DEFAULT '1858-11-30'
);

CREATE INDEX idx_EmployeeID ON  Employee (EmployeeID) ;

CREATE INDEX idx_DepartmentID ON  Department (DepartmentID);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES Employee (EmployeeID);

ALTER TABLE Department_Employee ADD CONSTRAINT fk_Department_Employee_DepartmentID FOREIGN KEY(DepartmentID)
REFERENCES Department (DepartmentID);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_DepartmentID FOREIGN KEY(DepartmentID)
REFERENCES Department (DepartmentID);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES Employee (EmployeeID);

ALTER TABLE Salary ADD CONSTRAINT fk_Salary_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES Employee (EmployeeID);

ALTER TABLE Title ADD CONSTRAINT fk_Title_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES Employee (EmployeeID);

-- Perform the following in psql - make sure you are on employee database
\copy public.department FROM 'C:\Users\MaverickSANCHEZ\Desktop\Bootcamp\sql-challenge\EmployeeSQL\data\departments.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '"';
\copy public.employee FROM 'C:\Users\MaverickSANCHEZ\Desktop\Bootcamp\sql-challenge\EmployeeSQL\data\employees.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '"';
\copy public.department_employee FROM 'C:\Users\MaverickSANCHEZ\Desktop\Bootcamp\sql-challenge\EmployeeSQL\data\dept_emp.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '"';
\copy public.department_manager FROM 'C:\Users\MaverickSANCHEZ\Desktop\Bootcamp\sql-challenge\EmployeeSQL\data\dept_manager.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '"';
\copy public.salary FROM 'C:\Users\MaverickSANCHEZ\Desktop\Bootcamp\sql-challenge\EmployeeSQL\data\salaries.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '"';
\copy public.title FROM 'C:\Users\MaverickSANCHEZ\Desktop\Bootcamp\sql-challenge\EmployeeSQL\data\titles.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '"';
