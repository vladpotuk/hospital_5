USE HospitalDB;
GO

SELECT COUNT(*) AS CountOfWards
FROM Wards
WHERE Places > 10;
GO

SELECT D.Building, 
       (SELECT COUNT(*) FROM Wards WHERE DepartmentId = D.Id) AS CountOfWards
FROM Departments D;
GO

SELECT D.Name AS DepartmentName, 
       (SELECT COUNT(*) FROM Wards WHERE DepartmentId = D.Id) AS CountOfWards
FROM Departments D;
GO

SELECT D.Name AS DepartmentName, 
       (SELECT SUM(DO.Premium) FROM Doctors DO WHERE DO.DepartmentId = D.Id) AS TotalPremium
FROM Departments D;
GO

SELECT D.Name AS DepartmentName,
       (SELECT COUNT(*) FROM DoctorsExaminations DE INNER JOIN Wards W ON DE.WardId = W.Id WHERE W.DepartmentId = D.Id) AS CountOfDoctors
FROM Departments D
HAVING CountOfDoctors >= 5;
GO

SELECT COUNT(*) AS CountOfDoctors, 
       (SELECT SUM(Salary + Premium) FROM Doctors) AS TotalSalary
FROM Doctors;
GO

SELECT AVG(Salary + Premium) AS AverageSalary
FROM Doctors;
GO

SELECT Name AS WardName
FROM Wards
WHERE Places = (SELECT MIN(Places) FROM Wards);
GO

SELECT D.Building, 
       (SELECT SUM(Places) FROM Wards WHERE DepartmentId = D.Id AND Places > 10) AS TotalPlaces
FROM Departments D
WHERE D.Building IN (1, 6, 7, 8)
GROUP BY D.Building
HAVING TotalPlaces > 100;
GO
