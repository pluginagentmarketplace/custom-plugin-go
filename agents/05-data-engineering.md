---
description: Master data engineering, databases, SQL, NoSQL systems, data pipelines, data warehousing, ETL/ELT, and analytics infrastructure. Covers relational and non-relational databases, pipeline orchestration, and data-driven systems.
capabilities:
  - SQL and relational database design
  - NoSQL databases (MongoDB, Redis, Cassandra)
  - Data pipeline architecture and orchestration
  - ETL/ELT processes
  - Data warehousing and lakehouses
  - Stream processing and real-time data
  - Data quality and governance
---

# Data Engineering & Databases

Design, build, and maintain scalable data systems and pipelines.

## 💾 Relational Databases (SQL)

### SQL Fundamentals
- **DDL**: CREATE, ALTER, DROP for schema management
- **DML**: SELECT, INSERT, UPDATE, DELETE for data manipulation
- **Joins**: INNER, LEFT, RIGHT, FULL for data combination
- **Aggregation**: GROUP BY, HAVING, window functions
- **Advanced**: CTEs, subqueries, stored procedures, transactions

**Timeline**: 1-2 months to core proficiency

### Advanced SQL
- **Window Functions**: ROW_NUMBER, RANK, LAG, LEAD for analytics
- **Recursive CTEs**: Hierarchical data, graph traversal
- **Performance**: EXPLAIN ANALYZE, index optimization, query rewriting
- **Transactions**: ACID properties, isolation levels, deadlock prevention
- **Stored Procedures**: Reusable logic, data validation

**Timeline**: 2-3 months for advanced topics

### Popular SQL Databases
- **PostgreSQL**: Most feature-rich open-source, JSONB support
- **MySQL/MariaDB**: Traditional web database, widespread
- **SQL Server**: Enterprise database, T-SQL extensions
- **Oracle**: Enterprise standard, complex features
- **SQLite**: Embedded, lightweight, serverless

### Database Design
- **Normalization**: 1NF through 5NF, avoiding redundancy
- **Schema Design**: Tables, relationships, constraints, keys
- **Indexing**: B-tree, hash, composite, partial indexes
- **Partitioning**: Horizontal scaling, sharding strategies
- **Replication**: Master-slave, multi-master architectures

## 🗂️ NoSQL & Document Databases

### MongoDB (Document Store)
- **Collections & Documents**: JSON-like structure
- **Query Language**: MongoDB Query Language (MQL)
- **Indexing**: Single field, compound, geospatial indexes
- **Aggregation Framework**: Complex data transformations
- **Replication**: Replica sets for high availability
- **Sharding**: Horizontal scaling with shard keys

**Use Cases**: Content management, mobile apps, rapid prototyping

### Redis (In-Memory Store)
- **Data Structures**: Strings, lists, sets, hashes, sorted sets, streams
- **Caching**: Cache-aside, write-through, write-behind patterns
- **Pub/Sub**: Real-time messaging
- **Persistence**: RDB snapshots, AOF (Append-Only File)
- **Clustering**: High availability and scaling
- **Use Cases**: Caching, sessions, real-time analytics, leaderboards, rate limiting

### Other NoSQL Systems
- **Cassandra**: Wide-column store, distributed, high write throughput
- **DynamoDB**: AWS serverless NoSQL
- **Elasticsearch**: Search and analytics engine
- **Neo4j**: Graph database for relationships

## 📊 Data Warehousing & Lakehouses

### Modern Data Warehouse
- **Cloud-Native**: Snowflake, BigQuery, Redshift Spectrum
- **Separation**: Compute and storage decoupling
- **Scale**: On-demand scaling, pay-per-use pricing
- **Standards**: ANSI SQL, familiar tooling

### Data Lake Architecture
- **Bronze Layer**: Raw data, as-is ingestion
- **Silver Layer**: Cleaned, deduplicated data
- **Gold Layer**: Business-ready, analytics-optimized

### Modern Data Stack
- **Ingestion**: Airbyte, Fivetran, custom connectors
- **Processing**: dbt (data build tool) for transformation
- **Storage**: S3, Azure Data Lake, GCS
- **Orchestration**: Airflow, Prefect, Dagster
- **BI Tools**: Looker, Tableau, Mode Analytics

**Timeline**: 6-9 months to core data warehousing skills

## 🔄 Data Pipelines & Orchestration

### ETL vs ELT
- **Traditional ETL**: Extract → Transform → Load
- **Modern ELT**: Extract → Load → Transform (in warehouse)
- **Streaming ETL**: Real-time processing

### Pipeline Orchestration
- **Airflow (Apache)**: DAG-based, Python-native, widely adopted
- **Prefect**: Modern alternative, more intuitive API
- **Dagster**: Asset-oriented, strong typing
- **Dbt**: SQL-based transformations, version control

### Components
- **Schedulers**: Cron-like execution, trigger-based
- **Monitoring**: Job status, error handling, retry logic
- **Data Quality**: Validation, schema checking, anomaly detection
- **Versioning**: Data versioning, reproducibility

**Timeline**: 2-3 months to orchestration proficiency

## 🌊 Stream Processing

### Real-Time Systems
- **Apache Kafka**: Distributed messaging, event streaming
- **Apache Spark**: Batch and stream processing
- **Apache Flink**: True streaming, low latency
- **Cloud Services**: AWS Kinesis, GCP Pub/Sub, Azure Event Hubs

### Use Cases
- **Real-time Analytics**: Metrics, dashboards, alerts
- **Complex Event Processing**: Pattern detection
- **Machine Learning Serving**: Feature computation
- **Data Replication**: Change Data Capture (CDC)

**Timeline**: 3-4 months with data engineering foundation

## 📈 Analytics & Business Intelligence

### Data Analyst Skills
- **Data Exploration**: SQL queries, data discovery
- **Visualization**: Chart selection, storytelling with data
- **Statistical Analysis**: Hypothesis testing, A/B testing, regression
- **Tools**: Tableau, Power BI, Looker, Jupyter notebooks

### BI Best Practices
- **Semantic Layer**: Business logic abstraction
- **Self-Service Analytics**: Empowering non-technical users
- **Data Governance**: Metadata, lineage, access control
- **Performance**: Dashboard optimization, caching

## 🔐 Data Quality & Governance

### Data Quality
- **Validation**: Schema validation, business rule checking
- **Monitoring**: Drift detection, anomaly detection
- **Tools**: Great Expectations, Soda, dbt tests

### Data Governance
- **Metadata Management**: Cataloging, lineage tracking
- **Access Control**: Row-level security, column masking
- **Compliance**: GDPR, CCPA, data retention policies
- **Tools**: Collibra, Alation, open-source Data Catalog

## 📚 Learning Pathways

### Path 1: Data Analyst (6-9 months)
- Excel/SQL → Python/R → Visualization tools → Business analytics
- Focus: Data exploration, visualization, storytelling
- Career: Growing demand, good starting point

### Path 2: Data Engineer (12-18 months)
- Programming → Data fundamentals → Pipelines → Warehousing → Specialization
- Focus: Building scalable data infrastructure
- Career: High-salary potential, technical depth

### Path 3: Database Administrator (6-9 months)
- SQL mastery → Database administration → Performance tuning → Backup/recovery
- Focus: Operational excellence, reliability
- Career: Stable, essential role

### Path 4: Analytics Engineer (12-15 months)
- SQL/Python → dbt/ELT → Business analysis → Analytics
- Focus: Bridge between data engineering and analytics
- Career: Growing field, well-compensated

## 💡 Specialization Areas

### Big Data Engineering
- **Technologies**: Spark, Hadoop, Presto
- **Use Cases**: Petabyte-scale analytics
- **Timeline**: 18-24 months beyond core skills

### Real-Time Engineering
- **Technologies**: Kafka, Flink, Spark Streaming
- **Use Cases**: Live dashboards, fraud detection
- **Timeline**: 12-18 months beyond core skills

### ML Engineering Focus
- **Technologies**: Feature stores, ML platforms
- **Use Cases**: Model training pipelines
- **Timeline**: 18-24 months with ML foundation

## ✅ Ready to Master Data Engineering?

Use `/learn data-engineering` to begin or `/explore` for specialization paths.
