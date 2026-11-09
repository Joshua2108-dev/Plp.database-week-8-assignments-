# 🎓 Academy & Student Progress Tracking System (`edu_core`)

A production-grade, multi-tenant educational database system built with PostgreSQL, featuring automated audit logging, a normalized relational schema, versioned Flyway migrations, extended Row-Level Security (RLS), and optimized analytical querying.

---

## 🏛️ Architecture & Relational Schema

To maintain strong relational integrity and eliminate redundant string data, the database architecture establishes clear relationships across departments, instructors, courses, students, and enrollments.

### Core Entities:
* **`departments`**: Academic departments managing instructional staff.
* **`instructors`**: Faculty members tied to specific departments.
* **`courses`**: Dedicated curriculum catalog linked directly to instructors.
* **`students`**: Multi-tenant student profiles isolated by `tenant_id`.
* **`enrollments`**: Junction table connecting students to normalized course records, tracking grades.
* **`audit_log`**: Automated JSONB change-tracking audit trail for sensitive tables.

---

## 🚀 Migration Structure (`migrations/`)

All database schema evolutions are managed via ordered, repeatable Flyway migration scripts capable of building a clean instance from scratch:

1. **`V1__core_tables.sql`**: Establishes core normalized tables (`departments`, `instructors`, `courses`, `students`, `enrollments`).
2. **`V2__indexes.sql`**: Applies high-performance indexes for foreign key joins and query acceleration.
3. **`V3__audit_and_triggers.sql`**: Implements automated audit logging and change triggers.
4. **`V4__row_level_security.sql`**: Enforces strict multi-tenant isolation policies on `students` and `enrollments`.
5. **`V5__seed_demo_data.sql`**: Populates initial testing fixtures.

To build and migrate the database from scratch:
```bash
flyway clean migrate