-- Core foreign key indexes for join acceleration
CREATE INDEX idx_students_tenant ON students(tenant_id);
CREATE INDEX idx_enrollments_student ON enrollments(student_id);

-- Benchmarked indexes solving sequential scans on course filtering and lookups
CREATE INDEX idx_enrollments_course ON enrollments(course_id);
CREATE INDEX idx_courses_title ON courses(title);