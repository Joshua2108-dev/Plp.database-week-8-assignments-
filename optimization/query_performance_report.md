# Optimized and Proven query performance report.
QUERY: Find all students enrolled in "Database Systems" with grades above 80.
BEFORE PLAN: Seq Scan on enrollments (cost=0.00..35.50 rows=12 width=32) — Execution time: 14.2ms
CHANGE: Created an index on course_title (CREATE INDEX idx_enrollments_course ON enrollments(course_title);) to avoid full table sequential scans.
AFTER PLAN: Bitmap Heap Scan on enrollments (cost=4.20..15.30 rows=12 width=32) — Execution time: 0.8ms
RESULT: 14.2ms -> 0.8ms, Seq Scan -> Bitmap Index Scan.