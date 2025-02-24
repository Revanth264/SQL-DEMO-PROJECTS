CREATE DATABASE SampleDB;
use Sampledb;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2)
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Salary)
VALUES
(1, 'John', 'Doe', 28, 55000.00),
(2, 'Jane', 'Smith', 34, 62000.00),
(3, 'Sam', 'Wilson', 45, 72000.00),
(4, 'Lucy', 'Brown', 39, 65000.00),
(5, 'Michael', 'Davis', 40, 70000.00);
select * from Employees
SELECT FirstName, Salary FROM Employees;
SELECT * FROM Employees WHERE Age > 35;
SELECT * FROM Employees ORDER BY Salary DESC;
SELECT * FROM Employees WHERE Age > 35 AND Salary > 65000;
SELECT * FROM Employees WHERE Age > 35 OR Salary > 65000;
SELECT * FROM Employees WHERE NOT Age < 35;
select * from employees where age = 34;
SELECT * FROM Employees WHERE Age BETWEEN 30 AND 40;
SELECT * FROM Employees WHERE FirstName LIKE 'J%';
SELECT * FROM Employees ORDER BY Age;
SELECT * FROM Employees ORDER BY Salary DESC;
SELECT * FROM Employees ORDER BY Age ASC, Salary DESC;
SELECT * FROM Employees
ORDER BY
    CASE
        WHEN Salary IS NULL THEN 1
        ELSE 0
    END,
    Salary DESC;
SELECT * FROM Employees WHERE Age > 35 AND Salary > 65000;
SELECT * FROM Employees WHERE Age > 40 OR Salary > 65000;
SELECT * FROM Employees WHERE NOT Age > 40;
SELECT * FROM Employees WHERE (Age > 35 OR Salary > 65000) AND NOT Age < 30;
SELECT * FROM Employees WHERE Salary != 65000;
SELECT * FROM Employees WHERE Age BETWEEN 30 AND 40;
SELECT * FROM Employees WHERE Salary IS NULL;
SELECT * FROM Employees WHERE (Age > 35 OR Age < 30) AND NOT Salary < 60000;
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Salary)
VALUES (6, 'Emma', 'Taylor', 30, 60000.00);
select * from Employees;
INSERT INTO Employees (FirstName, LastName, Age)
VALUES ('Alice', 'Johnson', 25);
ALTER TABLE Employees
MODIFY COLUMN EmployeeID INT AUTO_INCREMENT;
select * from Employees;
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Salary)
SELECT EmployeeID, FirstName, LastName, Age, Salary FROM TemporaryEmployees;
SHOW TABLES LIKE 'TemporaryEmployees';
CREATE TABLE TemporaryEmployees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2)
);
USE sampledb;
select * from Temporaryemployees;
UPDATE Employees
SET Salary = 60000.00
WHERE EmployeeID = 1;
select * from employees
UPDATE Employees 
set salary = 78888
where EmployeeID = 2;
select * from employees where employeeId = 2;
UPDATE Employees
SET Age = 35, Salary = 65000.00
WHERE EmployeeID = 2;
select * from employees where employeeid = 2;
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 0;
UPDATE Employees
SET Salary = Salary + 2000
WHERE Salary < 65000;
SET SQL_SAFE_UPDATES = 1;
UPDATE Employees
SET Salary = Salary + 2000
WHERE Salary < 65000 AND EmployeeID IS NOT NULL;
UPDATE Employees
SET Salary = CASE
    WHEN Age < 30 THEN Salary + 3000
    WHEN Age BETWEEN 30 AND 40 THEN Salary + 2000
    ELSE Salary + 1000
END;
UPDATE Employees
SET Salary = (SELECT AVG(Salary) FROM Employees)
WHERE Age > 40;
UPDATE Employees
JOIN (SELECT AVG(Salary) AS avg_salary FROM Employees) AS avg_table
ON 1=1
SET Salary = avg_table.avg_salary
WHERE Age > 40;
SET @avg_salary = (SELECT AVG(Salary) FROM Employees);

UPDATE Employees
SET Salary = @avg_salary
WHERE Age > 40;
SELECT AVG(Salary) INTO @avg_salary FROM Employees;
UPDATE Employees
SET Salary = @avg_salary
WHERE Age > 40;
ALTER TABLE Employees;
DESCRIBE Employees;
SELECT * FROM Employees WHERE Salary IS NULL;
SHOW WARNINGS;
UPDATE Employees
SET Salary = NULL
WHERE EmployeeID = 10;
select * from Employees;
DELETE FROM Employees
WHERE EmployeeID = 1;
select * from employees;
DELETE FROM Employees
WHERE Age > 40;
SELECT * FROM Employees;
DELETE FROM Employees;
SELECT * FROM Employees;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Salary)
VALUES
(1, 'John', 'Doe', 28, 55000.00),
(2, 'Jane', 'Smith', 34, 62000.00),
(3, 'Sam', 'Wilson', 45, 72000.00),
(4, 'Lucy', 'Brown', 39, 65000.00),
(5, 'Michael', 'Davis', 40, 70000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID)
VALUES
(1, 'HR', 1),
(2, 'Sales', 2),
(3, 'Engineering', 3),
(4, 'Marketing', 4),
(5, 'Finance', 5);
#join tables
SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments
ON Employees.EmployeeID = Departments.EmployeeID;

SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.EmployeeID = Departments.EmployeeID;

SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.EmployeeID = Departments.EmployeeID;

#wont support outer join

SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
FULL OUTER JOIN Departments
ON Employees.EmployeeID = Departments.EmployeeID;

#combine both left and Right using union to get an OUter join

SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID

UNION

SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID;

