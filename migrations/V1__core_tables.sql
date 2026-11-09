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

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    tenant_id TEXT NOT NULL, -- For Row-Level Security
    created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_title TEXT NOT NULL,
    grade NUMERIC(5,2),
    enrolled_at TIMESTAMPTZ DEFAULT now()
);