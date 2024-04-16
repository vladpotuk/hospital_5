USE HospitalDB;
GO

SELECT COUNT(*) AS CountOfWards
FROM Wards
WHERE Places > 10;
GO

SELECT D.Building, COUNT(W.Id) AS CountOfWards
FROM Departments D
LEFT JOIN Wards W ON D.Id = W.DepartmentId
GROUP BY D.Building;
GO

SELECT D.Name AS DepartmentName, COUNT(W.Id) AS CountOfWards
FROM Departments D
LEFT JOIN Wards W ON D.Id = W.DepartmentId
GROUP BY D.Name;
GO

SELECT D.Name AS DepartmentName, SUM(D.Premium) AS TotalPremium
FROM Departments D
LEFT JOIN Wards W ON D.Id = W.DepartmentId
LEFT JOIN Doctors DO ON W.Id = DO.DepartmentId
GROUP BY D.Name;
GO

SELECT D.Name AS DepartmentName, COUNT(DE.DoctorId) AS CountOfDoctors
FROM Departments D
LEFT JOIN Wards W ON D.Id = W.DepartmentId
LEFT JOIN DoctorsExaminations DE ON W.Id = DE.WardId
GROUP BY D.Name
HAVING COUNT(DE.DoctorId) >= 5;
GO

SELECT COUNT(*) AS CountOfDoctors, SUM(Salary + Premium) AS TotalSalary
FROM Doctors;
GO

SELECT AVG(Salary + Premium) AS AverageSalary
FROM Doctors;
GO

SELECT Name AS WardName
FROM Wards
WHERE Places = (SELECT MIN(Places) FROM Wards);
GO

SELECT D.Building, SUM(W.Places) AS TotalPlaces
FROM Departments D
JOIN Wards W ON D.Id = W.DepartmentId
WHERE D.Building IN (1, 6, 7, 8) AND W.Places > 10
GROUP BY D.Building
HAVING SUM(W.Places) > 100;
GO
