-- Tar fram sjukhusnamn och avdelnings namn
SELECT 	
	h.name AS hospital_name,
	d.name as department_name
FROM
	Hospital h
JOIN
	HospitalDepartment hd ON h.hospital_id = hd.hospital_id
JOIN 
	Department d ON hd.department_id = d.department_id
--WHERE
--	h.name = 'Sjukhusstock' ;
	

-- Tar fram läkarna och vilket sjukhus de jobbar på
SELECT 
	d.name AS doctor_name,
	h.name AS hospital_name
FROM 
	Hospital h
JOIN 
	HospitalDoctor hd ON h.hospital_id = hd.hospital_id
JOIN 
	Doctor d ON hd.doctor_id = d.doctor_id ;


-- Tar fram avdelningar och vilka läkare som jobbar där
SELECT 	
	d.name AS doctor_name,
	dep.name AS department_name
FROM 
	Department dep
JOIN 
	DepartmentDoctor dp ON dep.department_id = dp.department_id
JOIN 	
	Doctor d ON dp.doctor_id = d.doctor_id;
	


-- Tar fram sjukhus som har fler än en avdelning
SELECT
    h.name AS hospital_name,
    COUNT(dep.department_id) AS number_of_departments
FROM
    Hospital h
JOIN
    HospitalDepartment hd ON h.hospital_id = hd.hospital_id
JOIN
    Department dep ON hd.department_id = dep.department_id
GROUP BY
    h.name
HAVING
    COUNT(dep.department_id) > 1;


-- Visar läkare som jobbar på fler än ett sjukhus
SELECT
	d.name AS doctor_name,
	COUNT(h.hospital_id) AS number_of_hospitals,
	GROUP_CONCAT(h.name) AS hospitals -- GROUP_CONCAT tar värden från samma kolumn och sätter dom i en och samma sträng
FROM 	
	Doctor d
JOIN 
	HospitalDoctor hd on d.doctor_id = hd.doctor_id
JOIN 
	Hospital h on hd.hospital_id = h.hospital_id
GROUP BY
	d.name
HAVING
	COUNT(h.hospital_id) > 1;



-- Visar antalet läkare per avdelning
SELECT 	
	dep.name AS department_name,
	COUNT(d.doctor_id) AS number_of_doctors
FROM	
	Department dep
JOIN 
	DepartmentDoctor depd ON dep.department_id = depd.department_id
JOIN 
	Doctor d ON depd.doctor_id = d.doctor_id
GROUP BY 
	dep.name;


-- Visa alla sjukhus, deras avdelningar, och vilka läkare som jobbar där (från LLM) dock fel!
SELECT DISTINCT
    h.name AS hospital_name,
    dep.name AS department_name,
    d.name AS doctor_name
FROM
    Hospital h
JOIN
    HospitalDepartment hd ON h.hospital_id = hd.hospital_id
JOIN
    Department dep ON hd.department_id = dep.department_id
JOIN
    DepartmentDoctor dd ON dep.department_id = dd.department_id
JOIN
    Doctor d ON dd.doctor_id = d.doctor_id
ORDER BY
    h.name, dep.name, d.name;

-- Kollar efter dubletter, resultat: inga dubletter
SELECT
    department_id,
    doctor_id,
    COUNT(*)
FROM
    DepartmentDoctor
GROUP BY
    department_id, doctor_id
HAVING
    COUNT(*) > 1;
-- Kollar efter dubletter, resultat: inga dubletter
SELECT
    hospital_id,
    department_id,
    COUNT(*)
FROM
    HospitalDepartment
GROUP BY
    hospital_id, department_id
HAVING
    COUNT(*) > 1;


-- funkar! efter att man skapat en till junction table: hdd
SELECT DISTINCT
    h.name AS hospital_name,
    dep.name AS department_name,
    d.name AS doctor_name
FROM
    Hospital h
JOIN
    HospitalDepartment hd ON h.hospital_id = hd.hospital_id
JOIN
    Department dep ON hd.department_id = dep.department_id
JOIN
    HospitalDepartmentDoctor hdd ON h.hospital_id = hdd.hospital_id
                                AND dep.department_id = hdd.department_id
JOIN
    Doctor d ON hdd.doctor_id = d.doctor_id
ORDER BY
    h.name, dep.name, d.name;

-- Funkar också
SELECT DISTINCT
    h.name AS hospital_name,
    dep.name AS department_name,
    d.name AS doctor_name
FROM
    Hospital h
JOIN
    HospitalDepartmentDoctor hdd ON h.hospital_id = hdd.hospital_id
JOIN
    Department dep ON hdd.department_id = dep.department_id
JOIN
    Doctor d ON hdd.doctor_id = d.doctor_id
ORDER BY
    h.name, dep.name, d.name;

SELECT
    d.name AS doctor_name
FROM
    Doctor d
WHERE
    LOWER(d.name) LIKE 'dr. a%';