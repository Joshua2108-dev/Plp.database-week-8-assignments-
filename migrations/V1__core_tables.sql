CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE instructors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    department_id INT REFERENCES departments(id),
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Extracted dedicated courses entity linked to instructors
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    instructor_id INT REFERENCES instructors(id) ON DELETE SET NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    tenant_id TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Enrollments now reference normalized course IDs instead of raw strings
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    grade NUMERIC(5,2),
    enrolled_at TIMESTAMPTZ DEFAULT now()
);