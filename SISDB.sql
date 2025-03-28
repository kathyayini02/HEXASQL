--

TASK 1
--CREATE DATABASE SISDB;
--USE SISDB;
/*CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL
);
*/
/*CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) ON DELETE SET NULL
);
*/
--DROP TABLE IF EXISTS Courses;
--DROP TABLE IF EXISTS Students;
/*CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
*/


/*CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL
);
*/
/*CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) ON DELETE SET NULL
);
*/
--MANY TO MANY
/*CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE DEFAULT GETDATE(),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE, --ENROLL DELETED
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);
*/

/*CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT NOT NULL,
    amount DECIMAL(10,2) CHECK (amount > 0),
    payment_date DATE DEFAULT GETDATE(),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);
    TASK 2 
-- Inserting sample data into Students table with Indian names
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES 
('Rahul', 'Sharma', '2000-05-15', 'rahul.sharma@example.com', '9876543210'),
('Priya', 'Singh', '2001-03-22', 'priya.singh@example.com', '9876543211'),
('Anil', 'Kumar', '1999-08-30', 'anil.kumar@example.com', '9876543212'),
('Meena', 'Patel', '2002-03-17', 'meena.patel@example.com', '9876543213'),
('Suresh', 'Gupta', '2000-12-01', 'suresh.gupta@example.com', '9876543214'),
('Deepa', 'Reddy', '2001-11-09', 'deepa.reddy@example.com', '9876543215'),
('Vikram', 'Jain', '2003-05-20', 'vikram.jain@example.com', '9876543216'),
('Ritu', 'Kapoor', '2002-07-22', 'ritu.kapoor@example.com', '9876543217'),
('Ajay', 'Verma', '1998-09-15', 'ajay.verma@example.com', '9876543218'),
('Neha', 'Desai', '2000-10-12', 'neha.desai@example.com', '9876543219');

-- Inserting sample data into Teacher table with Indian names
INSERT INTO Teacher (first_name, last_name, email) 
VALUES 
('Arvind', 'Gupta', 'arvind.gupta@example.com'),
('Rekha', 'Sharma', 'rekha.sharma@example.com'),
('Sanjay', 'Kumar', 'sanjay.kumar@example.com'),
('Anjali', 'Rao', 'anjali.rao@example.com'),
('Vijay', 'Patel', 'vijay.patel@example.com'),
('Seema', 'Joshi', 'seema.joshi@example.com'),
('Rohit', 'Mehta', 'rohit.mehta@example.com'),
('Kavita', 'Iyer', 'kavita.iyer@example.com'),
('Prakash', 'Reddy', 'prakash.reddy@example.com'),
('Nisha', 'Sharma', 'nisha.sharma@example.com');

-- Inserting sample data into Courses table
INSERT INTO Courses (course_name, credits, teacher_id) 
VALUES 
('Mathematics', 3, 1),
('Physics', 4, 2),
('Psychology', 3, 3),
('Chemistry', 4, 4),
('Biology', 3, 5),
('Economics', 3, 6),
('History', 2, 7),
('Philosophy', 3, 8),
('Computer Science', 4, 9),
('English Literature', 3, 10);

-- Inserting sample data into Enrollments table
INSERT INTO Enrollments (student_id, course_id, enrollment_date) 
VALUES 
(1, 1, '2024-01-10'),
(2, 2, '2024-01-11'),
(3, 3, '2024-01-12'),
(4, 4, '2024-01-13'),
(5, 5, '2024-01-14'),
(6, 6, '2024-01-15'),
(7, 7, '2024-01-16'),
(8, 8, '2024-01-17'),
(9, 9, '2024-01-18'),
(10, 10, '2024-01-19');

-- Inserting sample data into Payments table
INSERT INTO Payments (student_id, amount, payment_date) 
VALUES 
(1, 5000.00, '2025-01-10'),
(2, 4500.00, '2025-01-12'),
(3, 5200.00, '2025-01-14'),
(4, 4800.00, '2025-01-16'),
(5, 5500.00, '2025-01-18'),
(6, 5300.00, '2025-01-20'),
(7, 4900.00, '2025-01-22'),
(8, 5000.00, '2025-01-24'),
(9, 4700.00, '2025-01-26'),
(10, 5100.00, '2025-01-28');

UPDATE Teacher SET email = 'new.email@example.com' WHERE teacher_id = 1;
DELETE FROM Enrollments WHERE student_id = 1 AND course_id = 1;

UPDATE Courses SET teacher_id = 1 WHERE course_id = 1;

DELETE FROM Students WHERE student_id = 1;

UPDATE Payments SET amount = 5500.00 WHERE payment_id = 1;



    -- Task 3: Joins and Aggregations
    --SPECIFIC STUDENT
SELECT SUM(amount) AS total_payments FROM Payments WHERE student_id = 1;
    
--COURSE WITH STUD COUNT
SELECT c.course_name, COUNT(e.student_id) AS student_count FROM Courses c 
LEFT JOIN Enrollments e ON c.course_id = e.course_id GROUP BY c.course_id;
    
--NOT ENROLLED IN ANY COURSE
SELECT s.first_name, s.last_name FROM Students s 
LEFT JOIN Enrollments e ON s.student_id = e.student_id WHERE e.course_id IS NULL;

    --STUDENT NAMES WITH ENROLLED COURSE
SELECT s.first_name, s.last_name, c.course_name FROM Students s 
JOIN Enrollments e ON s.student_id = e.student_id 
JOIN Courses c ON e.course_id = c.course_id;
    
 --TEACHERS AND COURS
SELECT t.first_name, t.last_name, c.course_name FROM Teacher t 
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id;

    --STUENT ENROLLMENT DATE COURSE
SELECT s.first_name, s.last_name, e.enrollment_date FROM Students s 
JOIN Enrollments e ON s.student_id = e.student_id 
WHERE e.course_id = 3;

    --NOT PAID
SELECT s.first_name, s.last_name FROM Students s 
LEFT JOIN Payments p ON s.student_id = p.student_id WHERE p.payment_id IS NULL;

    -- COURSES NO ENROLLMENTS
SELECT c.course_name FROM Courses c 
LEFT JOIN Enrollments e ON c.course_id = e.course_id WHERE e.enrollment_id IS NULL;

    --MORE THAN ONE COURSE
SELECT s.first_name, s.last_name FROM Students s 
JOIN Enrollments e ON s.student_id = e.student_id 
GROUP BY s.student_id HAVING COUNT(e.course_id) > 1;

    TEACHER WITHOUT COURSE
SELECT t.first_name, t.last_name FROM Teacher t 
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id WHERE c.course_id IS NULL;

-- Task 4: Subqueries
    --AVG PER COURSE
SELECT AVG(student_count) FROM (
    SELECT COUNT(student_id) AS student_count FROM Enrollments GROUP BY course_id
) AS CourseEnrollments;
    
--HIGHEST PAYMENT
SELECT s.first_name, s.last_name FROM Students s 
JOIN Payments p ON s.student_id = p.student_id 
WHERE p.amount = (SELECT MAX(amount) FROM Payments);

    --MOST ENROLLED COURSE
SELECT course_name FROM Courses WHERE course_id = (
    SELECT course_id FROM Enrollments GROUP BY course_id ORDER BY COUNT(student_id) DESC LIMIT 1
);
TOTAL PAYMENTS PER TEACHER
SELECT t.first_name, t.last_name, SUM(p.amount) FROM Teacher t 
JOIN Courses c ON t.teacher_id = c.teacher_id 
JOIN Enrollments e ON c.course_id = e.course_id 
JOIN Payments p ON e.student_id = p.student_id GROUP BY t.teacher_id;

    
    --STUENT ENROLLED IN ALL COURSE
SELECT s.first_name, s.last_name FROM Students s WHERE (
    SELECT COUNT(course_id) FROM Enrollments WHERE student_id = s.student_id
) = (SELECT COUNT(course_id) FROM Courses);

    --TEACHER WITHOUT CORSE
SELECT first_name, last_name FROM Teacher WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);



--MUL PAYMENTS OF STUDENTS

SELECT s.first_name, s.last_name FROM Students s 
JOIN Payments p ON s.student_id = p.student_id GROUP BY s.student_id HAVING COUNT(p.payment_id) > 1;

*/
/*SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Payments;
*/
    --CHECK FOREIGN KEYS
--EXEC sp_fkeys 'Enrollments'; -- Shows foreign keys related to Enrollments table
--EXEC sp_fkeys 'Payments';
/*Students ↔ Enrollments (One-to-Many):
A student can enroll in multiple courses, but each enrollment record belongs to only one student.

Courses ↔ Enrollments (One-to-Many):
A course can have multiple students enrolled, but each enrollment record belongs to only one course.

Teacher ↔ Courses (One-to-Many):
A teacher can teach multiple courses, but each course is assigned to only one teacher.

Students ↔ Payments (One-to-Many):
A student can make multiple payments, but each payment record belongs to only one student.
*/
