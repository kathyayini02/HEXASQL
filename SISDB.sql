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
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES 
('John', 'Doe', '2000-05-15', 'john.doe@example.com', '9876543210'),
('Alice', 'Smith', '2001-03-22', 'alice.smith@example.com', '9876543211'),

*/
/*INSERT INTO Teacher (first_name, last_name, email) 
VALUES 
('Dr. Adam', 'Scott', 'adam.scott@example.com'),
('Prof. Laura', 'Miller', 'laura.miller@example.com'),

*/
/*INSERT INTO Courses (course_name, credits, teacher_id) 
VALUES 
('Mathematics', 3, 1),
('Physics', 4, 2),
('Psychology', 3, 3),


INSERT INTO Enrollments (student_id, course_id) 
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO Payments (student_id, amount, payment_date) 
VALUES 
(1, 5000.00, '2025-01-10'),
(2, 4500.00, '2025-01-12'),

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
