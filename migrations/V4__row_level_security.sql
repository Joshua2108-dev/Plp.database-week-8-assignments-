-- Enable RLS on students table
ALTER TABLE students ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_isolation_policy ON students
    USING (tenant_id = current_setting('app.current_tenant', true));

-- Extend RLS to enrollments table using a subquery guard linked to student tenants
ALTER TABLE enrollments ENABLE ROW LEVEL SECURITY;

CREATE POLICY enrollment_tenant_isolation_policy ON enrollments
    USING (
        student_id IN (
            SELECT id FROM students WHERE tenant_id = current_setting('app.current_tenant', true)
        )
    );