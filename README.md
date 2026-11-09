# Requirements Summary
Project Name: Academy & Student Progress Tracker (edu_core)
Objective: Build a secure, multi-tenant educational database that tracks student registrations, course enrollments, grade evaluations, and administrative audit trails with optimized analytical reporting.
Core Entities: departments, instructors, students, courses, enrollments, and audit_log.

# ER Diagram Design Blueprint
departments (1) ──< (instructors) (One-to-Many)
instructors (1) ──< (courses) (One-to-Many)
students (M) ── (courses) via enrollments (Many-to-Many with attributes: grade, enrolled_at)

# To test clean execution locally
flyway clean migrate