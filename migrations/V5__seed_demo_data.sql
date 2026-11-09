-- Insert initial departments
INSERT INTO departments (name) VALUES ('Computer Science'), ('Mathematics');

-- Insert instructors linked to departments
INSERT INTO instructors (name, email, department_id) VALUES 
('Dr. Smith', 'smith@academy.edu', 1),
('Prof. Alan', 'alan@academy.edu', 2);

-- Insert courses first so valid course IDs exist for enrollments
INSERT INTO courses (title, instructor_id) VALUES 
('Database Systems', 1),
('Linear Algebra', 2);

-- Insert multi-tenant students
INSERT INTO students (name, email, tenant_id) VALUES 
('Alice Johnson', 'alice@edu.com', 'tenant_alpha'), 
('Bob Marley', 'bob@edu.com', 'tenant_beta');

-- Insert enrollments referencing valid student and course IDs
INSERT INTO enrollments (student_id, course_id, grade) VALUES 
(1, 1, 88.50),
(2, 2, 92.00);