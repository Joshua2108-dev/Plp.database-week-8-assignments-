#Store Selected: Redis

#Justification: Relational databases handle complex queries well, but high-frequency student session tokens and dashboard summary counters (like active student counts) cause unnecessary read-load on PostgreSQL. Redis provides sub-millisecond in-memory caching for session states and frequently accessed dashboard counters, reducing database round-trips.