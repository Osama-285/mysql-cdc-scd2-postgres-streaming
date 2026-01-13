# Real-Time MySQL CDC to PostgreSQL with SCD Type 2

## 📌 Project Overview
This project implements a **real-time Change Data Capture (CDC) pipeline** that captures changes from a **MySQL** database using **Debezium**, streams them through **Apache Kafka**, processes them using **Apache Spark Structured Streaming**, and persists them into **PostgreSQL** using **Slowly Changing Dimension Type 2 (SCD2)**.

The pipeline ensures that all **INSERT, UPDATE, and DELETE** operations in MySQL are reflected in PostgreSQL while **preserving full historical versions of records**.

---

## 🏗️ System Architecture

```

MySQL (OLTP)
│
│  (Binlog Events)
▼
Debezium MySQL Connector
│
▼
Apache Kafka
│
▼
Spark Structured Streaming
│
▼
PostgreSQL (SCD Type 2 Tables)

````

---

## 🛠️ Tech Stack

- **MySQL** – Source transactional database
- **Debezium** – Change Data Capture (CDC)
- **Apache Kafka** – Distributed event streaming
- **Apache Spark Structured Streaming** – Real-time processing
- **PostgreSQL** – Analytics & historical storage
- **Docker & Docker Compose** – Containerized environment

---

## 🔄 Data Flow

1. MySQL writes data changes to **binary logs**
2. Debezium monitors binlogs and emits CDC events to Kafka
3. Spark Structured Streaming consumes CDC events
4. Spark applies **SCD Type 2 transformation logic**
5. PostgreSQL stores **current and historical versions**
6. Data remains continuously synchronized and audit-ready

---

## ⚙️ Key Features

* Real-time CDC using Debezium
* Spark Structured Streaming with **exactly-once processing**
* SCD Type 2 implementation for historical tracking
* Handles INSERT, UPDATE, DELETE events
* Fault-tolerant with Spark checkpoints
* Scalable and production-ready architecture

---

## 📂 Project Structure

```
mysql-cdc-scd2-postgres-streaming/
│
├── docker-compose.yml
├── debezium/
│   └── mysql-connector.json
├── spark/
│   └── mysql_cdc_scd2_streaming.py
├── sql/
│   ├── mysql_init.sql
│   └── postgres_scd2_schema.sql
├── README.md
```

## 🧪 Real-World Use Cases

* Real-time OLTP to OLAP replication
* Customer profile history tracking
* Audit & compliance reporting
* Streaming data warehouses
* Event-driven data platforms

---

## 🔮 Future Enhancements

* Add **Schema Registry**
* Integrate **Delta Lake / Iceberg**
* Add **Dead Letter Queue (DLQ)**
* Data quality validation layer
* Deploy on **Kubernetes**
* Monitoring with Prometheus & Grafana

