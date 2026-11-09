## 🔒 Security & Compliance Checklist

1. [x] **Least-privilege roles configured:** Created restricted database roles (`app_read`, `app_write`) instead of using the superuser account.
2. [x] **Row-Level Security (RLS):** Enabled RLS on multi-tenant tables (`students`) with isolated tenant policies.
3. [x] **Sensitive fields secured:** Password hashes and sensitive metadata protected.
4. [x] **Audit logging active:** Automated trigger-based logging configured on critical tables (`students`) to track all `INSERT`, `UPDATE`, and `DELETE` events as JSONB.
5. [x] **Parameterized queries:** Application layer enforces parameterized statements to prevent SQL injection.
6. [x] **Backups & Test Restore:** Automated custom-format backup script (`pg_dump`) established and verified.