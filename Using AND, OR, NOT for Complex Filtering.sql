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












