USE HospitalDB;
GO


INSERT INTO Departments (Building, Name) VALUES (1, 'Cardiology');
INSERT INTO Departments (Building, Name) VALUES (2, 'Neurology');
INSERT INTO Departments (Building, Name) VALUES (3, 'Orthopedics');

INSERT INTO Wards (Name, Places, DepartmentId) VALUES ('Ward 101', 15, 1);
INSERT INTO Wards (Name, Places, DepartmentId) VALUES ('Ward 102', 12, 1);
INSERT INTO Wards (Name, Places, DepartmentId) VALUES ('Ward 201', 18, 2);
INSERT INTO Wards (Name, Places, DepartmentId) VALUES ('Ward 301', 20, 3);

INSERT INTO Doctors (Name, Premium, Salary, Surname) VALUES ('John', 1000, 5000, 'Doe');
INSERT INTO Doctors (Name, Premium, Salary, Surname) VALUES ('Jane', 1200, 5500, 'Smith');

INSERT INTO Examinations (Name) VALUES ('MRI');
INSERT INTO Examinations (Name) VALUES ('X-Ray');

INSERT INTO DoctorsExaminations (StartTime, EndTime, DoctorId, ExaminationId, WardId) VALUES ('10:00', '12:00', 1, 1, 1);
INSERT INTO DoctorsExaminations (StartTime, EndTime, DoctorId, ExaminationId, WardId) VALUES ('09:00', '11:00', 2, 2, 2);

DELETE FROM DoctorsExaminations;
DELETE FROM Doctors;
DELETE FROM Examinations;
DELETE FROM Wards;
DELETE FROM Departments;
GO
