CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    HireDate DATE,
    JobID INT,
    Salary DECIMAL(10, 2),
    ManagerID INT,
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) UNIQUE,
    LocationID INT
);

CREATE TABLE Jobs (
    JobID INT AUTO_INCREMENT PRIMARY KEY,
    JobTitle VARCHAR(100) UNIQUE,
    MinSalary DECIMAL(10, 2),
    MaxSalary DECIMAL(10, 2)
);

CREATE TABLE Locations (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    StreetAddress VARCHAR(100),
    PostalCode VARCHAR(20),
    City VARCHAR(50),
    StateProvince VARCHAR(50),
    CountryID VARCHAR(20)
);
CREATE TABLE Countries (
    CountryID VARCHAR(20) PRIMARY KEY,
    CountryName VARCHAR(50)
);


-- -----------------INSERT VALUES--------------------
INSERT INTO Departments (DepartmentName, LocationID) VALUES
('HR', 1),
('IT', 2),
('Finance', 3),
('Developer', 4),
('Software', 5),
('Dat_Science', 6),
('Bussiness Analyst', 7);


INSERT INTO Jobs (JobTitle, MinSalary, MaxSalary) VALUES
('Manager', 50000, 80000),
('IT Support', 40000, 60000),
('Finance Support', 40000, 160000),
('Developer Support', 20000, 80000),
('Software Enginering', 30000, 140000),
('Dat_Science Analyst', 40000, 60000),
('Bussiness Analyst', 50000, 75000);

INSERT INTO Employees (FirstName, LastName, Email, PhoneNumber, HireDate, JobID, Salary, ManagerID, DepartmentID) VALUES
('Soumya', 'Ghosh', 'Soumya.Ghosh123@gmail.com', '9861598082', '2024-01-15', 1, 75000, NULL, 1),
('Sourav', 'Kumar', 'Sourav.Kumar567@gmail.com', '7735221984', '2022-03-23', 2, 55000, 1, 2),
('Bikash', 'Singh', 'Bikash.Singh456@gmail.com', '9807654326', '2023-03-21', 3, 55000, 2, 3),
('Subham', 'Singh', 'Singh.Subham76@gmail.com', '7356489031', '2019-03-23', 4, 55000, 3, 4),
('Jane', 'Smith', 'jane.s5mi7t9h@gmail.com', '98065434109', '2020-03-23', 5, 55000, 4, 5),
('Harijit', 'Mukharji', 'Mukharji.789Harijit@gmail.com', '7768456321', '2019-03-23', 5, 55000, 1, 6),
('Emily', 'Davis', 'emily78.9davis@gmail.com', '9567806432', '2018-07-11', 7, 85000, 6, 7);

INSERT INTO Locations (StreetAddress, PostalCode, City, StateProvince, CountryID) VALUES
('123 Main St', '12345', 'New York', 'NY', 'US12'),
('983 shunla St', '34985', 'London', 'uy', 'UK56'),
('456 Shanusis St', '67890', 'Los Angeles', 'CA', 'US12'),
('769 Maple St', '34211', 'Toronto', 'ON', 'CA90'),
('341 Bhopalia St', '54789', 'Bhulia', 'MP', 'INDIA31'),
('560 Manipal St', '23457', 'Chakunda', 'Raban', 'Lanka980'),
('901 Murunia sky', '757051', 'Baripoda', 'Odisha', 'INDIA31');

INSERT INTO Countries (CountryID, CountryName) VALUES
('US12', 'United States'),
('CA90', 'Canada'),
('Lanka980', 'Sri Lanka'),
('INDIA31', 'INDIA31'),
('UK56', 'United Kingdom');


SELECT * FROM Employees;
SELECT * FROM Jobs;
SELECT * FROM Departments;
SELECT * FROM Locations;
SELECT * FROM Countries;

-- -----------------Select employee by Depertment--------------------------- 
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

--    -----------Select Employees and their Managers:-------------
SELECT e.FirstName AS FirstName, e.LastName AS LastName,
       m.FirstName AS FirstName, m.LastName AS LastName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;

-- ----------------Select Employees with Salary greater than a specific amount:
select FirstName, LastName,Salary from Employees where Salary >= 60000;

--  ---------------Select deparment by their action----------------
SELECT d.DepartmentName, l.City, l.StateProvince, l.CountryID
FROM Departments d
JOIN Locations l ON d.LocationID = l.LocationID;

-- ---------------- SELECT employee having salary within the range------------------------
select e.FirstName AS FirstName, e.LastName AS LastName, j.JobTitle AS JobTitle , e.Salary AS Salary, d.DepartmentName As Department
from Employees e 
join Departments d on e.DepartmentID = d.DepartmentID
join Jobs j on e.JobID = j.JobID
where (Salary >= 60000 and Salary < 100000);

-- ------------------END---------------------------------------------------