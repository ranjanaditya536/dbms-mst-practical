-- Question 6: Hospital Staff and Department Management System
-- A. Theory:
-- Explain the purpose of DISTINCT, LIKE, IN, and BETWEEN in SQL. Describe how these operators are used with the WHERE clause. Also explain the difference between COUNT(*) and COUNT(column_name), and describe how column aliases are used to make query results easier to understand.
-- B. Practical:
-- Create a Hospital Staff Management System using Department and Staff tables.
-- 1. Create both tables with suitable attributes and establish a Primary Key and Foreign Key relationship.
-- 2. Apply appropriate NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 3. Insert at least 4 department records and 6 staff records.
-- 4. Display staff members whose salaries fall between ₹25,000 and ₹50,000.
-- 5. Display staff members whose names start with a specified letter using LIKE.
-- 6. Display staff members belonging to selected departments using IN.
-- 7. Display unique staff designations using DISTINCT.
-- 8. Count the number of staff members in each department using GROUP BY and COUNT().
-- 9. Display the maximum and minimum salary using MAX() and MIN().
-- 10. Update the salary of a staff member.
-- 11. Display the final staff records using SELECT with appropriate column aliases.  


CREATE DATABASE Hospital_db;
USE Hospital_db;


CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) DEFAULT 'Main Building'
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,   
    designation VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL       CHECK (salary > 0),
    department_id INT NOT NULL,
        FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

INSERT INTO Department (department_id, department_name, location) VALUES
(1,'Cardiology', 'Block A'),
(2,'Neurology', 'Block B'),
(3,'Orthopedics', 'Block C'),
(4,'Emergency', 'Block D');


INSERT INTO Staff (staff_id, staff_name, email, designation, salary, department_id) VALUES
(101, 'Aman Sharma','aman@gmail.com', 'Doctor', 45000, 1),
(102, 'Priya Verma','priya@gmail.com', 'Nurse', 28000, 1),
(103, 'Rahul Singh','rahul@gmail.com', 'Technician', 25000, 2),
(104, 'Anjali Gupta','anjali@gmail.com', 'Doctor', 50000, 2);

SELECT * FROM Staff WHERE salary BETWEEN 30000 AND 50000;

SELECT * FROM Staff WHERE staff_name = 'Aman Sharma'; 

SELECT DISTINCT designation FROM Staff;

SELECT DISTINCT designation FROM Staff;

SELECT* FROM Staff Where staff_name = "A%";
SELECT * FROM Staff WHERE staff_name = "___"; 

UPDATE Staff SET salary = 48000  WHERE staff_id = 101;

SELECT         d.department_name,s.staff_name,s.email,s.designation
FROM Staff s
JOIN Department d
ON s.department_id = d.department_id
WHERE s.department_id IN (1,3);

SELECT * FROM Department;
SELECT * FROM Staff;

