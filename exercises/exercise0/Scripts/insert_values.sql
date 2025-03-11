-- fyll i info tables

INSERT INTO Hospital (hospital_id, name, address) VALUES 
	(1, 'Sjukhusstock', 'Drottninggatan 3'),
	(2, 'Löwenströmska', 'Löwetvägen 1');

INSERT INTO Department (department_id, name) VALUES 
	(1, 'Kardiologi'),
	(2, 'Neurologi'),
	(3, 'Palliativ');

INSERT INTO Doctor (doctor_id, name) VALUES 
	(1, 'Dr. Abra Abrahamsson'),
	(2, 'Dr. Erika Eriksson'),
	(3, 'Dr. Sven Svensson'),
	(4, 'Dr. Alex Alexandersson');

-- fyll i junction tables

INSERT INTO HospitalDepartment (hospital_department_id, hospital_id, department_id)
VALUES 
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3);


INSERT INTO HospitalDoctor (hospital_doctor_id, hospital_id, doctor_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 1, 4);


INSERT INTO DepartmentDoctor (department_doctor_id, department_id, doctor_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 4);

INSERT INTO HospitalDepartmentDoctor (hospital_department_doctor_id, hospital_id, department_id, doctor_id)
VALUES
    (1, 1, 1, 1), -- Dr. Abra Abrahamsson på Kardiologi på Sjukhusstock
    (2, 1, 1, 2), -- Dr. Erika Eriksson på Kardiologi på Sjukhusstock
    (3, 1, 2, 3), -- Dr. Sven Svensson på Neurologi på Sjukhusstock
    (4, 1, 2, 4), -- Dr. Alex Alexandersson på Neurologi på Sjukhusstock
    (5, 2, 3, 4); -- Dr. Alex Alexandersson på Palliativ på Löwenströmska

