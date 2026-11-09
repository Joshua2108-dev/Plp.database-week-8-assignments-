ALTER TABLE students ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_isolation_policy ON students
    USING (tenant_id = current_setting('app.current_tenant', true));