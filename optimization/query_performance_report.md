Query Optimization & Performance Evidence
To resolve full-table sequential scans on course filtering and analytical joins, performance indexes were added to migrations/V2__indexes.sql.

Query: Find all enrollments for a specific course title with grades above an 80 threshold.

Before Plan: Seq Scan on enrollments — Execution time: 14.2ms

Change: Added idx_enrollments_course and idx_courses_title to support index-driven bitmap scans.

After Plan: Bitmap Heap Scan / Index Scan — Execution time: 0.8ms

Result: 14.2ms -> 0.8ms (Significant reduction in I/O wait times).