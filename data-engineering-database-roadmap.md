# Data Engineering & Database Learning Paths
## Comprehensive Roadmap Analysis from roadmap.sh

Generated: 2025-11-18
Sources: roadmap.sh (Data Engineer, Data Analyst, SQL, MongoDB, Redis)

---

## Table of Contents
1. [Database Design & Optimization](#database-design--optimization)
2. [SQL Knowledge & Expertise](#sql-knowledge--expertise)
3. [NoSQL Databases](#nosql-databases)
4. [Data Pipeline Architecture](#data-pipeline-architecture)
5. [Analytics & Reporting](#analytics--reporting)
6. [Complete Learning Paths](#complete-learning-paths)

---

## 1. Database Design & Optimization

### Core Concepts

#### Relational Database Design
- **Normalization & Denormalization**
  - Normal forms (1NF, 2NF, 3NF, BCNF)
  - When to denormalize for performance
  - Trade-offs between normalization and query performance

- **Schema Design Principles**
  - Entity-relationship modeling
  - Primary keys and foreign keys
  - Constraints (NOT NULL, UNIQUE, CHECK, DEFAULT)
  - Referential integrity

#### NoSQL Database Design

##### MongoDB Data Modeling
- **Schema Design Strategies**
  - Embedding vs. referencing
  - One-to-one, one-to-many, many-to-many relationships
  - Schema optimization for common queries
  - Document structure best practices

- **Design Patterns**
  - Subset pattern for large documents
  - Computed pattern for aggregated data
  - Bucket pattern for time-series data
  - Extended reference pattern

##### Redis Data Modeling
- **Data Structure Selection**
  - Strings for simple key-value
  - Hashes for objects
  - Lists for queues and stacks
  - Sets for unique collections
  - Sorted sets for leaderboards and rankings
  - Bitmaps for flags and analytics
  - HyperLogLogs for cardinality estimation
  - Geospatial indexes for location data

### Performance Optimization

#### Indexing Strategies
- **SQL Indexing**
  - B-tree indexes (default)
  - Hash indexes for equality comparisons
  - Composite indexes for multiple columns
  - Covering indexes
  - Partial indexes
  - Full-text indexes
  - When to use indexes (WHERE, JOIN, ORDER BY clauses)

- **MongoDB Indexing**
  - Single field indexes
  - Compound indexes
  - Multi-key indexes for arrays
  - Text indexes for search
  - Geospatial indexes
  - TTL indexes for expiration
  - Index intersection

- **Redis Performance**
  - In-memory optimization
  - Pipeline commands for batch operations
  - Lua scripting for atomic operations
  - Key expiration strategies

#### Query Optimization
- **SQL Optimization Techniques**
  - Query analysis and EXPLAIN plans
  - Optimizing joins (nested loop, hash join, merge join)
  - Reducing subqueries
  - Selective projection (only needed columns)
  - Avoiding SELECT *
  - Query rewriting
  - Index hints

- **MongoDB Optimization**
  - Aggregation pipeline optimization
  - Projection optimization
  - Index usage in queries
  - Cursor methods and limits

#### Advanced Optimization
- **Partitioning & Sharding**
  - Horizontal partitioning (sharding)
  - Vertical partitioning
  - Range-based partitioning
  - Hash-based partitioning
  - MongoDB sharding strategies
  - Shard key selection

- **Replication & High Availability**
  - Master-slave replication
  - Master-master replication
  - MongoDB replica sets
  - Redis replication and clustering
  - Automatic failover mechanisms

- **Caching Strategies**
  - Cache-aside pattern
  - Write-through caching
  - Write-behind caching
  - Cache invalidation strategies
  - Redis as a cache layer
  - TTL (Time-To-Live) policies

---

## 2. SQL Knowledge & Expertise

### Foundation Level

#### Basic SQL Operations
- **Data Definition Language (DDL)**
  - CREATE, ALTER, DROP statements
  - Table creation and modification
  - Data types (INT, VARCHAR, DATE, BOOLEAN, etc.)

- **Data Manipulation Language (DML)**
  - SELECT queries
  - INSERT operations
  - UPDATE statements
  - DELETE operations
  - TRUNCATE vs DELETE

- **Basic Querying**
  - WHERE clauses and filtering
  - ORDER BY for sorting
  - LIMIT/OFFSET for pagination
  - DISTINCT for unique values
  - Basic operators (=, <, >, <=, >=, !=, LIKE, IN, BETWEEN)

#### Intermediate SQL

- **Joins**
  - INNER JOIN
  - LEFT JOIN (LEFT OUTER JOIN)
  - RIGHT JOIN (RIGHT OUTER JOIN)
  - FULL OUTER JOIN
  - CROSS JOIN
  - SELF JOIN
  - Join optimization strategies

- **Aggregate Functions**
  - COUNT, SUM, AVG, MIN, MAX
  - GROUP BY clauses
  - HAVING for filtered aggregations
  - Statistical functions

- **Subqueries**
  - Scalar subqueries
  - Row subqueries
  - Table subqueries
  - Correlated subqueries
  - EXISTS and NOT EXISTS

### Advanced SQL

#### Complex Query Techniques
- **Window Functions**
  - ROW_NUMBER()
  - RANK()
  - DENSE_RANK()
  - LEAD() and LAG()
  - NTILE()
  - Running totals and moving averages
  - PARTITION BY for grouped window operations

- **Common Table Expressions (CTEs)**
  - WITH clause syntax
  - Recursive CTEs
  - Multiple CTEs in single query
  - CTE vs subquery performance

- **Advanced Operations**
  - PIVOT and UNPIVOT
  - CASE statements and conditional logic
  - COALESCE and NULLIF
  - String functions (CONCAT, SUBSTRING, TRIM)
  - Date/time functions
  - Type casting and conversion

#### Dynamic & Procedural SQL
- **Stored Procedures**
  - CREATE PROCEDURE syntax
  - Parameters (IN, OUT, INOUT)
  - Control flow (IF, CASE, LOOP)
  - Error handling

- **Functions**
  - User-defined functions (UDF)
  - Scalar functions
  - Table-valued functions

- **Triggers**
  - BEFORE and AFTER triggers
  - INSERT, UPDATE, DELETE triggers
  - Use cases and best practices

- **Dynamic SQL**
  - Building queries at runtime
  - EXECUTE statements
  - SQL injection prevention

#### Transaction Management
- **ACID Properties**
  - Atomicity
  - Consistency
  - Isolation
  - Durability

- **Transaction Control**
  - BEGIN TRANSACTION
  - COMMIT
  - ROLLBACK
  - SAVEPOINT

- **Isolation Levels**
  - READ UNCOMMITTED
  - READ COMMITTED
  - REPEATABLE READ
  - SERIALIZABLE
  - Dirty reads, non-repeatable reads, phantom reads

#### Query Analysis & Optimization
- **Execution Plans**
  - EXPLAIN and EXPLAIN ANALYZE
  - Reading query plans
  - Identifying bottlenecks
  - Cost estimation

- **Performance Tuning**
  - Index selection and usage
  - Join order optimization
  - Minimizing table scans
  - Cardinality estimation
  - Statistics maintenance

---

## 3. NoSQL Databases

### MongoDB (Document Database)

#### Core Concepts
- **Document-Oriented Storage**
  - JSON/BSON format
  - Flexible schema design
  - Nested documents and arrays
  - Schema validation

- **CRUD Operations**
  - insertOne(), insertMany()
  - find(), findOne()
  - updateOne(), updateMany()
  - deleteOne(), deleteMany()
  - replaceOne()

#### Advanced MongoDB

- **Aggregation Framework**
  - Aggregation pipeline stages
  - $match, $group, $project, $sort, $limit
  - $lookup for joins
  - $unwind for arrays
  - $facet for multi-pipeline
  - $bucket for categorization
  - Pipeline optimization

- **Indexing & Performance**
  - Index types and strategies
  - Index creation and management
  - Query performance analysis
  - explain() method
  - Index intersection

- **Replication**
  - Replica set architecture
  - Primary and secondary nodes
  - Automatic failover
  - Read preferences
  - Write concerns

- **Sharding**
  - Horizontal scaling
  - Shard key selection
  - Chunk distribution
  - Balancing strategies
  - Sharded cluster architecture
  - Query routing

- **Data Modeling Patterns**
  - Embedding vs referencing
  - One-to-one relationships
  - One-to-many relationships
  - Many-to-many relationships
  - Denormalization strategies

### Redis (In-Memory Key-Value Store)

#### Core Concepts
- **Data Structures**
  - Strings: Simple key-value pairs
  - Hashes: Field-value pairs (objects)
  - Lists: Ordered collections
  - Sets: Unique unordered collections
  - Sorted Sets: Ordered by score
  - Bitmaps: Bit-level operations
  - HyperLogLogs: Probabilistic counting
  - Streams: Log data structure

- **Basic Commands**
  - SET, GET, DEL
  - HSET, HGET, HGETALL
  - LPUSH, RPUSH, LPOP, RPOP
  - SADD, SMEMBERS, SINTER
  - ZADD, ZRANGE, ZRANK
  - EXPIRE, TTL

#### Advanced Redis

- **Caching Strategies**
  - Cache-aside pattern
  - Read-through cache
  - Write-through cache
  - Write-behind cache
  - Cache invalidation
  - TTL management
  - Eviction policies (LRU, LFU, etc.)

- **Persistence**
  - RDB (Redis Database) snapshots
  - AOF (Append-Only File)
  - Persistence strategies
  - Backup and recovery

- **Replication & High Availability**
  - Master-replica replication
  - Redis Sentinel for monitoring
  - Automatic failover
  - Read replicas

- **Clustering**
  - Redis Cluster architecture
  - Data partitioning
  - Hash slots (16384 slots)
  - Cluster nodes and resharding
  - Horizontal scaling

- **Advanced Features**
  - Pub/Sub messaging
  - Transactions (MULTI/EXEC)
  - Lua scripting
  - Pipelining for batch operations
  - Geospatial operations

- **Use Cases**
  - Session storage
  - Real-time analytics
  - Leaderboards and rankings
  - Rate limiting
  - Message queues
  - Full-page caching

### NoSQL Database Selection

#### When to Use MongoDB
- Complex, nested data structures
- Flexible schema requirements
- Rapid application development
- Horizontal scalability needs
- Rich querying and aggregation

#### When to Use Redis
- Ultra-fast data access required
- Session management
- Real-time analytics
- Caching layer
- Pub/Sub messaging
- Temporary data storage

#### SQL vs NoSQL Trade-offs
- **SQL Advantages**: ACID compliance, complex queries, mature tooling
- **NoSQL Advantages**: Horizontal scalability, flexible schema, high performance
- **Hybrid Approach**: Use both (polyglot persistence)

---

## 4. Data Pipeline Architecture

### ETL vs ELT

#### ETL (Extract, Transform, Load)
- **Extract**: Pull data from source systems
- **Transform**: Clean, validate, and transform data
- **Load**: Insert into target data warehouse

**When to Use ETL:**
- Legacy on-premise systems
- Limited target system resources
- Data privacy requirements (transform before cloud)
- Complex transformations needed pre-load

#### ELT (Extract, Load, Transform)
- **Extract**: Pull data from source systems
- **Load**: Load raw data into data warehouse
- **Transform**: Transform within the data warehouse

**When to Use ELT:**
- Modern cloud data warehouses (Snowflake, BigQuery, Redshift)
- Large-scale data processing
- Flexibility in transformation logic
- Leverage warehouse computing power

### Data Pipeline Components

#### 1. Data Ingestion
- **Batch Processing**
  - Scheduled intervals (hourly, daily, weekly)
  - Large volume processing
  - Historical data loads
  - Tools: Apache Airflow, Luigi, Prefect

- **Stream Processing**
  - Real-time data ingestion
  - Event-driven architectures
  - Low-latency requirements
  - Tools: Apache Kafka, Apache Flink, AWS Kinesis, Apache Pulsar

- **Change Data Capture (CDC)**
  - Track database changes
  - Near real-time replication
  - Minimal source system impact
  - Tools: Debezium, Maxwell, Oracle GoldenGate

#### 2. Data Storage

- **Data Lakes**
  - Raw data storage (all formats)
  - Schema-on-read
  - Cost-effective storage
  - Platforms: AWS S3, Azure Data Lake, Google Cloud Storage

- **Data Warehouses**
  - Structured, optimized storage
  - Schema-on-write
  - Query performance optimized
  - Platforms: Snowflake, BigQuery, Redshift, Azure Synapse

- **Data Lakehouses**
  - Hybrid approach (lake + warehouse)
  - ACID transactions on data lakes
  - Platforms: Databricks Delta Lake, Apache Iceberg, Apache Hudi

#### 3. Data Transformation

- **Transformation Layers**
  - Bronze (raw data)
  - Silver (cleaned, validated)
  - Gold (business-ready, aggregated)

- **Transformation Tools**
  - dbt (data build tool)
  - Apache Spark
  - SQL-based transformations
  - Python/Pandas for custom logic

- **Data Quality**
  - Validation rules
  - Data profiling
  - Anomaly detection
  - Tools: Great Expectations, Soda, Monte Carlo

#### 4. Data Orchestration

- **Workflow Management**
  - DAG (Directed Acyclic Graph) definition
  - Task dependencies
  - Scheduling and triggers
  - Retry logic and error handling

- **Orchestration Tools**
  - Apache Airflow (most popular)
  - Prefect
  - Dagster
  - Azure Data Factory
  - AWS Step Functions

#### 5. Data Modeling

- **Dimensional Modeling**
  - Star schema (fact + dimension tables)
  - Snowflake schema (normalized dimensions)
  - Fact tables (measures/metrics)
  - Dimension tables (context/attributes)

- **Data Vault Modeling**
  - Hubs (business keys)
  - Links (relationships)
  - Satellites (descriptive attributes)
  - Audit trail and historization

- **One Big Table (OBT)**
  - Denormalized, wide tables
  - Query simplicity
  - Trade-off: storage vs performance

### Modern Data Stack

#### Cloud Platforms
- **AWS**: S3, Redshift, Glue, EMR, Kinesis
- **Azure**: Data Lake, Synapse, Data Factory, Event Hubs
- **Google Cloud**: BigQuery, Cloud Storage, Dataflow, Pub/Sub

#### Data Integration Tools
- Airbyte (open-source)
- Fivetran
- Stitch
- Apache NiFi
- Talend

#### Data Processing
- Apache Spark (batch & streaming)
- Apache Flink (stream processing)
- Apache Beam (unified API)
- Databricks

#### Data Quality & Observability
- Monte Carlo
- Great Expectations
- Soda
- Datadog
- Datafold

### Best Practices

#### Pipeline Design
1. **Idempotency**: Same input = same output
2. **Incrementality**: Process only new/changed data
3. **Monitoring**: Track pipeline health and performance
4. **Error Handling**: Graceful failures and retries
5. **Data Lineage**: Track data flow end-to-end
6. **Testing**: Unit tests, integration tests, data tests
7. **Documentation**: Pipeline purpose, dependencies, SLAs

#### Scalability
- Horizontal scaling (add more nodes)
- Partitioning strategies
- Parallel processing
- Resource optimization
- Cost management

#### Security & Compliance
- Data encryption (at rest and in transit)
- Access controls and authentication
- PII/PHI data handling
- GDPR, CCPA compliance
- Audit logging

---

## 5. Analytics & Reporting

### Data Analyst Skills

#### Data Collection
- **Source Systems**
  - Databases (SQL queries)
  - APIs (REST, GraphQL)
  - Spreadsheets (Excel, Google Sheets)
  - Flat files (CSV, JSON, Parquet)
  - Web scraping

- **Data Extraction Techniques**
  - SQL queries for database extraction
  - API calls with authentication
  - File parsing and reading
  - Scheduled data pulls

#### Data Cleaning & Preparation
- **Data Quality Issues**
  - Missing values (NULL handling)
  - Duplicates
  - Inconsistencies
  - Outliers
  - Data type mismatches
  - Format standardization

- **Cleaning Techniques**
  - Imputation (mean, median, mode)
  - Deduplication logic
  - Standardization (dates, strings, formats)
  - Outlier detection and handling
  - Data validation rules

- **Data Transformation**
  - Aggregation and summarization
  - Pivoting and unpivoting
  - Joining datasets
  - Feature engineering
  - Normalization and scaling

#### Analysis Techniques

- **Descriptive Analytics**
  - Summary statistics (mean, median, mode, std dev)
  - Distribution analysis
  - Frequency tables
  - Cross-tabulation

- **Exploratory Data Analysis (EDA)**
  - Data profiling
  - Pattern recognition
  - Correlation analysis
  - Hypothesis generation

- **Statistical Analysis**
  - Hypothesis testing
  - A/B testing
  - Regression analysis (linear, logistic)
  - Time series analysis
  - Cohort analysis
  - Funnel analysis

- **Predictive Analytics**
  - Trend forecasting
  - Predictive modeling
  - Machine learning basics
  - Classification and regression

#### Visualization & Reporting

- **Visualization Principles**
  - Choose the right chart type
  - Bar charts for comparisons
  - Line charts for trends
  - Pie charts for proportions
  - Scatter plots for correlations
  - Heatmaps for matrices
  - Color theory and accessibility

- **BI Tools**
  - **Power BI**: Microsoft ecosystem integration
  - **Tableau**: Advanced visualizations
  - **Looker**: LookML and Git integration
  - **Metabase**: Open-source, simple
  - **Google Data Studio**: Free, Google integration
  - **Apache Superset**: Open-source alternative

- **Dashboard Design**
  - KPI selection and hierarchy
  - Layout and navigation
  - Interactivity (filters, drill-downs)
  - Performance optimization
  - Mobile responsiveness
  - Refresh schedules

- **Reporting Best Practices**
  - Audience-appropriate complexity
  - Clear titles and labels
  - Context and benchmarks
  - Actionable insights
  - Executive summaries
  - Automated distribution

#### Programming for Analytics

- **SQL for Analysis**
  - Complex queries and joins
  - Window functions for analytics
  - CTEs for readability
  - Performance optimization

- **Python for Data Analysis**
  - Pandas: Data manipulation
  - NumPy: Numerical operations
  - Matplotlib/Seaborn: Visualization
  - Scikit-learn: Machine learning
  - Jupyter notebooks

- **R for Statistics**
  - dplyr: Data manipulation
  - ggplot2: Visualization
  - Statistical packages
  - R Markdown for reports

#### Business Intelligence

- **Metrics & KPIs**
  - Business metric definition
  - North Star metrics
  - Leading vs lagging indicators
  - Metric trees
  - Goal setting (OKRs)

- **Analytics Framework**
  - Problem definition
  - Hypothesis formation
  - Data collection
  - Analysis execution
  - Insight generation
  - Recommendation delivery

- **Storytelling with Data**
  - Narrative structure
  - Data-driven insights
  - Visual hierarchy
  - Call to action
  - Stakeholder communication

---

## 6. Complete Learning Paths

### Path 1: Database Specialist (6-9 months)

#### Phase 1: SQL Fundamentals (2-3 months)
- **Week 1-4: SQL Basics**
  - DDL and DML operations
  - Basic queries and filtering
  - Sorting and limiting
  - Practice: Build simple database schema

- **Week 5-8: Intermediate SQL**
  - All types of joins
  - Aggregate functions and GROUP BY
  - Subqueries
  - Practice: Analyze sample datasets

- **Week 9-12: Advanced SQL**
  - Window functions
  - CTEs and recursive queries
  - Stored procedures and triggers
  - Practice: Optimize slow queries

#### Phase 2: Database Design & Optimization (2-3 months)
- **Month 4: Database Design**
  - Normalization and denormalization
  - Entity-relationship modeling
  - Schema design patterns
  - Practice: Design e-commerce database

- **Month 5: Performance Optimization**
  - Indexing strategies
  - Query optimization
  - Execution plan analysis
  - Practice: Tune production-like workloads

- **Month 6: Advanced Topics**
  - Transactions and concurrency
  - Replication and high availability
  - Partitioning and sharding
  - Practice: Design scalable architecture

#### Phase 3: NoSQL Databases (2-3 months)
- **MongoDB (4-6 weeks)**
  - Document modeling
  - CRUD operations
  - Aggregation framework
  - Indexing and performance
  - Replication and sharding
  - Practice: Build document-based application

- **Redis (4-6 weeks)**
  - Data structures
  - Caching strategies
  - Persistence and replication
  - Clustering
  - Practice: Implement caching layer

### Path 2: Data Engineer (12-18 months)

#### Phase 1: Foundations (3-4 months)
- **Programming (2 months)**
  - Python fundamentals
  - Data structures and algorithms
  - Object-oriented programming
  - Git and version control

- **SQL & Databases (2 months)**
  - SQL proficiency (from Path 1, Phase 1)
  - PostgreSQL or MySQL
  - Basic database administration

#### Phase 2: Data Processing (3-4 months)
- **Batch Processing (1.5 months)**
  - Apache Spark fundamentals
  - DataFrames and RDDs
  - Spark SQL
  - PySpark

- **Stream Processing (1.5 months)**
  - Apache Kafka fundamentals
  - Stream processing concepts
  - Kafka Streams or Flink basics
  - Real-time data pipelines

#### Phase 3: Cloud & Infrastructure (2-3 months)
- **Cloud Platforms (1.5 months)**
  - Choose: AWS, Azure, or GCP
  - Storage services (S3, Blob, GCS)
  - Compute services (EC2, VMs, Compute Engine)
  - Data services (Redshift, Synapse, BigQuery)

- **Infrastructure as Code (1 month)**
  - Docker containers
  - Kubernetes basics (optional)
  - Terraform or CloudFormation
  - CI/CD pipelines

#### Phase 4: Data Warehousing (2-3 months)
- **Data Modeling (1 month)**
  - Dimensional modeling
  - Star and snowflake schemas
  - Slowly changing dimensions
  - Data vault (optional)

- **Modern Data Warehouse (2 months)**
  - Snowflake, BigQuery, or Redshift
  - ELT patterns
  - dbt (data build tool)
  - Data quality testing

#### Phase 5: Orchestration & Best Practices (2-3 months)
- **Workflow Orchestration (1.5 months)**
  - Apache Airflow
  - DAG development
  - Task dependencies
  - Monitoring and alerting

- **Data Engineering Best Practices (1.5 months)**
  - Data lineage
  - Data observability
  - Testing strategies
  - Documentation
  - Cost optimization

#### Phase 6: Specialization (Optional, 2-3 months)
- Choose one or more:
  - Machine Learning Engineering
  - Real-time Analytics
  - Data Platform Engineering
  - DataOps

### Path 3: Data Analyst (6-9 months)

#### Phase 1: Foundations (2-3 months)
- **Excel/Spreadsheets (2-4 weeks)**
  - Advanced formulas (VLOOKUP, INDEX-MATCH)
  - Pivot tables and charts
  - Data validation
  - Macros (basic)

- **SQL for Analysis (6-8 weeks)**
  - Data extraction queries
  - Joins and aggregations
  - Window functions
  - Query optimization basics

- **Statistics Basics (2-4 weeks)**
  - Descriptive statistics
  - Probability
  - Distributions
  - Hypothesis testing

#### Phase 2: Data Analysis (2-3 months)
- **Python or R (6-8 weeks)**
  - **Python**: Pandas, NumPy, Matplotlib
  - **R**: dplyr, ggplot2, tidyr
  - Data cleaning and manipulation
  - Statistical analysis
  - Jupyter notebooks or R Markdown

- **Exploratory Data Analysis (2-3 weeks)**
  - Data profiling techniques
  - Pattern recognition
  - Correlation analysis
  - Visualization for exploration

- **Statistical Analysis (3-4 weeks)**
  - Regression analysis
  - A/B testing
  - Time series basics
  - Cohort analysis

#### Phase 3: Visualization & BI (2-3 months)
- **Visualization Principles (2 weeks)**
  - Chart selection
  - Design principles
  - Color theory
  - Storytelling with data

- **BI Tool (6-8 weeks)**
  - Choose: Tableau, Power BI, or Looker
  - Dashboard design
  - Calculations and parameters
  - Performance optimization
  - Publishing and sharing

- **Advanced Reporting (2-3 weeks)**
  - KPI frameworks
  - Metric definition
  - Executive reporting
  - Automated reporting

#### Phase 4: Business Analytics (Optional, 1-2 months)
- **Domain Knowledge**
  - Industry-specific metrics
  - Business processes
  - Stakeholder management

- **Advanced Analytics**
  - Predictive modeling basics
  - Customer analytics
  - Product analytics
  - Marketing analytics

### Path 4: Full-Stack Data Professional (18-24 months)

Combines all three paths above in sequence:
1. Database Specialist (6-9 months)
2. Data Engineering focus (9-12 months)
3. Analytics specialization (3-6 months)

---

## Learning Resources

### Online Platforms
- **Coursera**: Database courses from universities
- **Udemy**: Practical, project-based courses
- **DataCamp**: Interactive data science learning
- **Pluralsight**: Technology skill development
- **LeetCode/HackerRank**: SQL practice problems
- **Mode Analytics**: SQL tutorials
- **MongoDB University**: Free MongoDB courses
- **Redis University**: Free Redis courses

### Books
- **SQL**: "SQL Performance Explained" by Markus Winand
- **Data Engineering**: "Fundamentals of Data Engineering" by Joe Reis & Matt Housley
- **Analytics**: "Storytelling with Data" by Cole Nussbaumer Knaflic
- **MongoDB**: "MongoDB: The Definitive Guide"
- **Redis**: "Redis in Action" by Josiah Carlson

### Practice Datasets
- Kaggle datasets
- Google BigQuery public datasets
- AWS open data registry
- Data.gov
- UCI Machine Learning Repository

### Certifications
- AWS Certified Data Analytics
- Google Cloud Professional Data Engineer
- Microsoft Certified: Azure Data Engineer Associate
- MongoDB Certified Developer
- Snowflake SnowPro Core Certification
- Tableau Desktop Specialist/Certified Associate

---

## Career Timeline Expectations

### Junior Level (0-2 years)
- **Data Analyst**: Focus on SQL, Excel, basic BI tools
- **Junior Data Engineer**: ETL development, SQL, Python basics
- **Database Developer**: SQL proficiency, basic optimization

### Mid-Level (2-5 years)
- **Data Analyst**: Advanced analytics, statistical modeling, stakeholder management
- **Data Engineer**: Pipeline architecture, cloud platforms, orchestration
- **Database Administrator**: Performance tuning, high availability, backup/recovery

### Senior Level (5+ years)
- **Senior Data Analyst**: Strategic insights, analytics leadership
- **Senior/Lead Data Engineer**: Platform design, team leadership, architecture
- **Principal/Staff Engineer**: Technical strategy, organization-wide impact

### Salary Ranges (USD, 2025)
- **Data Analyst**: $70K-$140K (entry to senior)
- **Data Engineer**: $90K-$180K (entry to senior)
- **Analytics Engineer**: $80K-$160K (entry to senior)
- **Database Administrator**: $75K-$150K (entry to senior)

*Note: Salaries vary by location, company size, and industry*

---

## Key Takeaways

### Database Design & Optimization
1. Master both relational and NoSQL design patterns
2. Indexing is critical for performance
3. Understand when to normalize vs denormalize
4. Learn query optimization and execution plans
5. Study sharding and partitioning for scale

### SQL & NoSQL Knowledge
1. SQL is foundational - invest time here
2. Learn window functions and CTEs for analytics
3. MongoDB for flexible, document-based data
4. Redis for caching and real-time use cases
5. Understand trade-offs between SQL and NoSQL

### Data Pipeline Architecture
1. Modern data stacks favor ELT over ETL
2. Orchestration is key (learn Airflow)
3. Data quality and observability are critical
4. Cloud platforms are the standard
5. Incremental processing and idempotency matter

### Analytics & Reporting
1. SQL + BI tool = minimum for data analysts
2. Statistical knowledge enhances analysis
3. Storytelling is as important as technical skills
4. Domain knowledge accelerates career growth
5. Automation and self-service analytics are trends

### Overall Strategy
1. Start with SQL - it's universal
2. Choose depth vs breadth based on career goals
3. Build portfolio projects
4. Contribute to open-source
5. Stay current with industry trends
6. Network and learn from community

---

## Next Steps

1. **Assess Your Current Level**: Where are you in these learning paths?
2. **Set Clear Goals**: Data Analyst, Data Engineer, or Database Specialist?
3. **Choose Your Path**: Follow the relevant learning path above
4. **Practice Consistently**: Daily coding/querying practice
5. **Build Projects**: Create portfolio demonstrating skills
6. **Join Communities**: Reddit, Discord, LinkedIn groups
7. **Stay Updated**: Follow blogs, podcasts, newsletters
8. **Get Certified**: Consider relevant certifications
9. **Apply Skills**: Find internships, freelance work, or contribute to open-source
10. **Iterate**: Continuously refine based on market demands

---

*This roadmap synthesizes information from roadmap.sh and industry best practices as of 2025. Technology evolves rapidly - always verify current trends and requirements.*
