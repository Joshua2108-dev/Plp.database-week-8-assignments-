CREATE TABLE audit_log (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tbl TEXT,
    op TEXT,
    old_row JSONB,
    new_row JSONB,
    changed_by TEXT DEFAULT current_user,
    at TIMESTAMPTZ DEFAULT now()
);

CREATE OR REPLACE FUNCTION audit_changes() RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO audit_log(tbl, op, old_row, new_row)
  VALUES (TG_TABLE_NAME, TG_OP, to_jsonb(OLD), to_jsonb(NEW));
  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- Audit triggers on critical tables
CREATE TRIGGER trg_audit_students
AFTER INSERT OR UPDATE OR DELETE ON students
FOR EACH ROW EXECUTE FUNCTION audit_changes();

CREATE TRIGGER trg_audit_enrollments
AFTER INSERT OR UPDATE OR DELETE ON enrollments
FOR EACH ROW EXECUTE FUNCTION audit_changes();