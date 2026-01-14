-- =========================================================
-- MySQL Initialization Script for CDC (Debezium)
-- Database  : cdc_db
-- Table     : customers
-- Purpose   : Source OLTP schema for real-time CDC pipeline
-- =========================================================

-- 1. Create source database
CREATE DATABASE IF NOT EXISTS cdc_db;
USE cdc_db;

-- 2. Create customers table (CDC-friendly)
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT NOT NULL,
    full_name VARCHAR(100),
    email VARCHAR(100),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id)
);

-- 3. Insert initial seed data (for snapshot testing)
INSERT INTO customers (customer_id, full_name, email, status)
VALUES
    (1, 'Ali Khan', 'ali.khan@email.com', 'ACTIVE'),
    (2, 'Sara Ahmed', 'sara.ahmed@email.com', 'ACTIVE');

-- 4. Create Debezium CDC user
CREATE USER IF NOT EXISTS 'debezium'@'%' IDENTIFIED BY 'dbz';

-- 5. Grant required privileges for Debezium CDC
GRANT SELECT, RELOAD, SHOW DATABASES,
      REPLICATION SLAVE, REPLICATION CLIENT
ON *.* TO 'debezium'@'%';

-- 6. Apply privileges
FLUSH PRIVILEGES;
