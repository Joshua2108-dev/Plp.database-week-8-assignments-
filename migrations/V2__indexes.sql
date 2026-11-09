CREATE INDEX idx_students_tenant ON students(tenant_id);
CREATE INDEX idx_enrollments_student ON enrollments(student_id);