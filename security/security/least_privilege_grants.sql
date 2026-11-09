-- Create restricted operational roles if they do not exist
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'app_read') THEN
    CREATE ROLE app_read;
  END IF;
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'app_write') THEN
    CREATE ROLE app_write;
  END IF;
END
$$;

-- Grant database connection and schema usage
GRANT CONNECT ON DATABASE capstone TO app_read, app_write;
GRANT USAGE ON SCHEMA public TO app_read, app_write;

-- Grant granular table privileges
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_read;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_write;

-- Ensure future tables created via migrations inherit appropriate permissions automatically
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO app_read;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_write;

-- Create application execution user mapped to the write role
DO $$
BEGIN
  IF NOT EXISTS (SELECT FROM pg_user WHERE usename = 'api_user') THEN
    CREATE USER api_user WITH PASSWORD 'StrongSecurePassword123!';
  END IF;
END
$$;

GRANT app_write TO api_user;