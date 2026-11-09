INSERT INTO departments (name) VALUES ('Computer Science'), ('Mathematics');
INSERT INTO instructors (name, email, department_id) VALUES ('Dr. Smith', 'smith@academy.edu', 1);
INSERT INTO students (name, email, tenant_id) VALUES ('Alice Johnson', 'alice@edu.com', 'tenant_alpha'), ('Bob Marley', 'bob@edu.com', 'tenant_beta');
INSERT INTO enrollments (student_id, course_title, grade) VALUES (1, 'Database Systems', 88.50);