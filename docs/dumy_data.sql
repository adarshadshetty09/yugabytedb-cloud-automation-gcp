CREATE TABLE dummy_data (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL, email TEXT,       registered_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO dummy_data (username, email)
SELECT 
    'NewUser_' || i AS username,
    'user' || i || '@example.com' AS email
FROM generate_series(1, 1000000) AS s(i);
 
-- Step 1: Create a schema (optional, if not already exists)
CREATE SCHEMA IF NOT EXISTS dummy_schema;
 
-- Step 2: Create the table inside the schema
CREATE TABLE dummy_schema.dummy_data (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    email TEXT,
    registered_at TIMESTAMP DEFAULT NOW()
);
 
-- Step 3: Insert 1 million rows of dummy data
INSERT INTO dummy_schema.dummy_data (username, email)
SELECT 
    'NewUser_' || i AS username,
    'user' || i || '@example.com' AS email
FROM generate_series(1, 1000000) AS s(i);
 
 
ALTER DATABASE test SET temp_file_limit = -1;
 
ALTER ROLE yugabyte SET temp_file_limit = -1;
 
SHOW temp_file_limit;
 
 
SHOW temp_file_limit;