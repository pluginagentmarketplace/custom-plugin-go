---
name: data-engineering
description: Master SQL, databases, data pipelines, ETL/ELT, data warehousing, and analytics. Build scalable data systems with Kubernetes, Apache Spark, and modern data stack.
sasmp_version: "1.3.0"
bonded_agent: 01-web-development
bond_type: PRIMARY_BOND
---

# Data Engineering Skills

## Quick Start

Build your first data pipeline:

### SQL - Data Foundation
```sql
-- Create table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert data
INSERT INTO users (name, email) VALUES
    ('Alice', 'alice@example.com'),
    ('Bob', 'bob@example.com');

-- Query with aggregation
SELECT
    COUNT(*) as total_users,
    DATE_TRUNC('month', created_at) as signup_month
FROM users
GROUP BY DATE_TRUNC('month', created_at)
ORDER BY signup_month DESC;
```

### Python Data Pipeline
```python
import pandas as pd
from sqlalchemy import create_engine

# Extract: Read from source
df = pd.read_csv('raw_data.csv')

# Transform: Clean and process
df = df.dropna()
df['created_at'] = pd.to_datetime(df['created_at'])
df['amount'] = df['amount'].astype(float)

# Load: Write to database
engine = create_engine('postgresql://user:password@localhost/db')
df.to_sql('cleaned_data', engine, if_exists='append')

print(f"Loaded {len(df)} records")
```

### Apache Spark - Big Data Processing
```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("DataPipeline").getOrCreate()

# Read data
df = spark.read.parquet("s3://bucket/data/")

# Transform
result = df.filter(df.amount > 100) \
    .groupBy("category") \
    .count() \
    .orderBy("count", ascending=False)

# Write output
result.write.mode("overwrite").parquet("s3://bucket/output/")
```

## SQL Fundamentals

### Core Operations
- **DDL**: CREATE, ALTER, DROP
- **DML**: SELECT, INSERT, UPDATE, DELETE
- **Joins**: INNER, LEFT, RIGHT, FULL OUTER, CROSS
- **Aggregations**: GROUP BY, HAVING, COUNT, SUM, AVG
- **Subqueries**: Nested SELECT statements
- **CTEs**: Common Table Expressions (WITH clauses)

### Advanced SQL
- **Window Functions**: ROW_NUMBER, RANK, LAG, LEAD, SUM OVER
- **Recursive CTEs**: Hierarchical queries
- **JSON Operations**: Parsing and manipulating JSON
- **Performance**: EXPLAIN ANALYZE, query optimization
- **Transactions**: ACID properties, isolation levels

### Databases
- **PostgreSQL**: Most feature-rich open-source
- **MySQL/MariaDB**: Widely deployed, traditional
- **Snowflake**: Cloud-native, excellent for analytics
- **BigQuery**: Google Cloud's data warehouse
- **Redshift**: AWS data warehouse

## NoSQL & Document Stores

### MongoDB
- **Document Model**: JSON-like documents
- **Aggregation Pipeline**: Complex transformations
- **Indexing**: B-tree, compound, geospatial
- **Replication**: Replica sets for HA
- **Sharding**: Horizontal scaling

### Redis
- **Data Structures**: Strings, lists, sets, hashes, sorted sets
- **Caching**: Cache-aside, write-through patterns
- **Persistence**: RDB snapshots, AOF logs
- **Pub/Sub**: Real-time messaging
- **Use Cases**: Sessions, leaderboards, rate limiting

## Data Pipelines

### ETL vs ELT
- **Traditional ETL**: Extract → Transform → Load
- **Modern ELT**: Extract → Load → Transform (in warehouse)
- **Real-time Streaming**: Continuous data flow

### Pipeline Orchestration
- **Apache Airflow**: DAG-based, Python-native
- **Prefect**: Modern with reactive paradigm
- **Dagster**: Asset-oriented, strong typing
- **Dbt**: SQL transformations, version control

### Pipeline Components
- **Data Ingestion**: APIs, databases, file uploads
- **Scheduling**: Time-based, trigger-based
- **Error Handling**: Retries, fallbacks, alerts
- **Monitoring**: Success rate, latency, data quality
- **Versioning**: Track changes over time

## Data Warehousing

### Modern Architecture
- **Separation**: Compute and storage decoupled
- **Scalability**: On-demand scaling, pay-per-use
- **Performance**: Columnar storage, compression
- **Accessibility**: Familiar SQL, standard tools

### Design Patterns
- **Bronze/Silver/Gold**: Raw → Cleaned → Analytics
- **Star Schema**: Fact tables, dimension tables
- **Snowflake Schema**: Normalized dimensions
- **Data Vault**: Flexible, audit-friendly

### Tools
- **Snowflake**: Cloud-native, zero-copy cloning
- **BigQuery**: Google Cloud, built-in ML
- **Redshift**: AWS, dense compute pricing
- **Databricks**: Unified lakehouse
- **DuckDB**: Local analytical database

## Data Quality & Governance

### Quality Checks
- **Schema Validation**: Correct types and structure
- **Completeness**: No missing required fields
- **Accuracy**: Data matches known values
- **Uniqueness**: No duplicates where not expected
- **Timeliness**: Data freshness

### Tools
- **Great Expectations**: Data validation framework
- **Soda**: Data quality monitoring
- **dbt tests**: Built-in testing

### Governance
- **Access Control**: Who can see what data
- **Metadata Management**: Data catalogs, lineage
- **Compliance**: GDPR, HIPAA, data retention
- **Auditing**: Who accessed what and when

## Analytics & Business Intelligence

### Analytics Stack
- **BI Tools**: Looker, Tableau, Power BI, Mode
- **SQL Interface**: Direct warehouse access
- **Self-Service**: Empowering non-technical users
- **Dashboards**: Real-time monitoring, KPIs
- **Reporting**: Scheduled, automated insights

### Key Metrics
- **User Engagement**: DAU, MAU, retention
- **Business**: Revenue, conversion, churn
- **Product**: Feature adoption, session length
- **Technical**: Query performance, data latency

## Hands-On Projects

### Beginner
- SQL queries on sample database
- Simple CSV to database pipeline
- Basic data exploration notebook
- Dashboard with single data source

### Intermediate
- Multi-stage ETL pipeline with Airflow
- Data warehouse schema design
- Complex SQL analysis
- Integrated dashboard with transformations

### Advanced
- Real-time streaming pipeline
- Multi-source data integration
- Data quality monitoring system
- Scalable big data processing

## Common Tech Stack

| Role | Primary Tools |
|------|---|
| **Data Analyst** | SQL, Tableau/Power BI, Python |
| **Data Engineer** | Python, SQL, Airflow, Spark |
| **Analytics Engineer** | SQL, dbt, BI tools |
| **ML Engineer** | Python, SQL, Spark, MLOps |

## Learning Path (12-18 months)

1. **SQL Mastery** (2-3 months)
   - Core SQL operations
   - Complex queries
   - Query optimization

2. **Database Design** (1-2 months)
   - Schema design
   - Normalization
   - Indexing strategies

3. **Data Processing** (2-3 months)
   - Python for data
   - Pandas, NumPy
   - Basic transformations

4. **Pipelines & Tools** (3-4 months)
   - Orchestration (Airflow)
   - ETL design patterns
   - Error handling

5. **Data Warehousing** (2-3 months)
   - Warehouse architecture
   - Cloud platforms
   - Performance optimization

6. **Analytics & BI** (1-2 months)
   - Dashboard design
   - User experience
   - Storytelling with data

## Best Practices

### Pipeline Development
- Idempotent operations (safe to rerun)
- Clear error handling and logging
- Data quality validation
- Comprehensive monitoring
- Version control everything

### SQL Performance
- Use appropriate indexes
- Analyze query plans
- Partition large tables
- Cache frequently accessed data
- Monitor query performance

### Security
- Encryption in transit and at rest
- Row-level and column-level security
- Audit logging
- Access control management
- Regular security reviews

## Key Takeaways

1. SQL is the universal skill - master it deeply
2. Understand data from business perspective
3. Automate repetitive processes
4. Monitor data quality continuously
5. Document data lineage and transformations
6. Design for scalability from the start
7. Prioritize reliability and correctness

## Related Skills

- **Programming Languages**: Python for data tools
- **Cloud & DevOps**: Infrastructure for data systems
- **AI/ML**: Using data for training models
- **Web Development**: Displaying data to users
- **Leadership**: Communicating insights

---

*For specialized data paths, use `/learn data-engineering`*
