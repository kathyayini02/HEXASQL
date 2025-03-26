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
GO*/

/*CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL
);
GO*/
/*CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) ON DELETE SET NULL
);
GO*/
/*CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE DEFAULT GETDATE(),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);
GO*/

/*CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT NOT NULL,
    amount DECIMAL(10,2) CHECK (amount > 0),
    payment_date DATE DEFAULT GETDATE(),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
);
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES 
('John', 'Doe', '2000-05-15', 'john.doe@example.com', '9876543210'),
('Alice', 'Smith', '2001-03-22', 'alice.smith@example.com', '9876543211'),
('Robert', 'Brown', '1999-12-10', 'robert.brown@example.com', '9876543212'),
('Emily', 'Johnson', '2000-07-08', 'emily.johnson@example.com', '9876543213'),
('Michael', 'Williams', '2001-09-30', 'michael.williams@example.com', '9876543214'),
('Jessica', 'Davis', '1998-06-25', 'jessica.davis@example.com', '9876543215'),
('Daniel', 'Martinez', '2000-11-12', 'daniel.martinez@example.com', '9876543216'),
('Sophia', 'Anderson', '2002-01-14', 'sophia.anderson@example.com', '9876543217'),
('David', 'Wilson', '1999-04-18', 'david.wilson@example.com', '9876543218'),
('Olivia', 'Taylor', '2000-08-05', 'olivia.taylor@example.com', '9876543219');
*/
/*INSERT INTO Teacher (first_name, last_name, email) 
VALUES 
('Dr. Adam', 'Scott', 'adam.scott@example.com'),
('Prof. Laura', 'Miller', 'laura.miller@example.com'),
('Dr. Brian', 'Harris', 'brian.harris@example.com'),
('Prof. Susan', 'Clark', 'susan.clark@example.com'),
('Dr. Kevin', 'Moore', 'kevin.moore@example.com');
*/
/*INSERT INTO Courses (course_name, credits, teacher_id) 
VALUES 
('Mathematics', 3, 1),
('Physics', 4, 2),
('Computer Science', 3, 3),
('Chemistry', 4, 4),
('Biology', 3, 5),
('Economics', 3, 1),
('History', 2, 2),
('Psychology', 3, 3),
('English Literature', 2, 4),
('Data Science', 4, 5);

INSERT INTO Enrollments (student_id, course_id) 
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO Payments (student_id, amount, payment_date) 
VALUES 
(1, 5000.00, '2025-01-10'),
(2, 4500.00, '2025-01-12'),
(3, 5200.00, '2025-01-15'),
(4, 4800.00, '2025-01-18'),
(5, 5500.00, '2025-01-20'),
(6, 5300.00, '2025-01-22'),
(7, 4900.00, '2025-01-25'),
(8, 5000.00, '2025-01-28'),
(9, 4700.00, '2025-01-30'),
(10, 5100.00, '2025-02-02');
*/
/*SELECT * FROM Students;
SELECT * FROM Teacher;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Payments;
*/
EXEC sp_fkeys 'Enrollments'; -- Shows foreign keys related to Enrollments table
EXEC sp_fkeys 'Payments';
