---
description: Expert data engineer and database architect. Master SQL optimization, NoSQL design, data pipelines, ETL/ELT, data warehousing, stream processing, and analytics infrastructure with production patterns and big data technologies.
capabilities:
  - SQL and relational database design
  - NoSQL and document databases
  - Data pipeline architecture
  - ETL/ELT process optimization
  - Data warehousing and lakehouses
  - Stream processing and real-time systems
  - Data quality and governance
  - Analytics and BI
  - Big data technologies
  - Data modeling for scale
---

# Data Engineering & Databases

Master data systems from SQL queries to distributed data platforms.

## 🎯 SQL & Database Mastery

### SQL Performance

```sql
-- Good indexes
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_created_at ON events(created_at DESC);
CREATE INDEX idx_user_created ON posts(user_id, created_at);

-- EXPLAIN ANALYZE for optimization
EXPLAIN ANALYZE SELECT u.*, COUNT(p.id)
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
GROUP BY u.id;

-- Query optimization
SELECT user_id, COUNT(*) as post_count
FROM posts
WHERE created_at > NOW() - INTERVAL '30 days'
GROUP BY user_id
HAVING COUNT(*) > 10;
```

### Database Design

**Normalization**
- 1NF: Atomic values
- 2NF: Depends on PK
- 3NF: Depends only on PK
- BCNF: Stricter than 3NF

**Denormalization** (when needed)
- Aggregate columns
- Calculated fields
- Materialized views
- Trade-off: storage vs speed

### Popular Databases

| DB | Best For | Scaling |
|----|----------|---------|
| PostgreSQL | ACID, complex | Vertical + replicas |
| MySQL | Web apps | Sharding |
| MongoDB | Documents | Horizontal |
| Cassandra | Time-series | Linear scaling |
| Redis | Caching | Cluster |

## 🔄 Data Pipelines

**ETL vs ELT**
```
ETL (Traditional):
Extract → Transform → Load
Used when: Limited storage, simple transformations

ELT (Modern):
Extract → Load → Transform
Used when: Cloud data warehouse, complex analytics
```

**Pipeline Tools**
- **Airflow**: DAG-based, Python-native
- **dbt**: SQL transformations
- **Spark**: Big data processing
- **Kafka**: Real-time streaming

**Example Pipeline**
```python
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def extract():
    # Get data from source
    pass

def transform():
    # Clean and process
    pass

def load():
    # Write to warehouse
    pass

with DAG('daily_pipeline', start_date=datetime(2024, 1, 1)) as dag:
    extract_task = PythonOperator(task_id='extract', python_callable=extract)
    transform_task = PythonOperator(task_id='transform', python_callable=transform)
    load_task = PythonOperator(task_id='load', python_callable=load)
    
    extract_task >> transform_task >> load_task
```

## 📊 Data Warehousing

**Modern Warehouse Architecture**
```
Data Sources (APIs, Databases, Files)
    ↓
Data Lake (Raw data, S3, ADLS)
    ↓
ELT Processing (Spark, Databricks)
    ↓
Data Warehouse (Snowflake, BigQuery, Redshift)
    ↓
BI Tools (Tableau, Looker)
```

**Warehouse Design**
- Star schema: fact + dimension tables
- Snowflake schema: normalized dimensions
- Slowly changing dimensions (SCD)
- Partitioning: improve performance
- Clustering: data organization

## 🌊 Stream Processing

**Real-time Systems**
- Kafka: event streaming
- Spark Streaming: micro-batch
- Flink: true streaming
- Pub/Sub: simple events

**Use Cases**
- Real-time dashboards
- Fraud detection
- Personalization
- IoT data processing

## ✅ Data Engineering Career

**Junior DE** (0-2 years)
- Pipeline maintenance
- SQL queries
- Salary: $100K-$140K

**Senior DE** (3-5 years)
- Pipeline design
- Optimization
- Salary: $140K-$200K

**Staff DE** (5+ years)
- Architecture
- Leadership
- Salary: $180K-$280K+

---

**Ready for Data Engineering?** Use `/learn data-engineering`!
