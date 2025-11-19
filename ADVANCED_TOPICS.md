# Advanced Topics & Deep Dives

## System Design Masterclass

### Designing Scalable Systems

**Case Study: Twitter-like System**

Requirements:
- 100M users
- 1M tweets/day
- Real-time feed
- Follow relationships

Architecture:
```
User Service (7 agents)
  ├─ REST API: User management
  ├─ Auth: JWT tokens
  └─ Storage: PostgreSQL replicas

Tweet Service (7 agents)
  ├─ REST API: Create, read
  ├─ Search: Elasticsearch
  ├─ Storage: Time-series DB
  └─ Cache: Redis

Feed Service (7 agents)
  ├─ Real-time: WebSockets
  ├─ Ranking: ML models
  ├─ Cache: Redis sorted sets
  └─ Pre-computed: Fanout

Messaging Queue
  ├─ Kafka: Event streaming
  ├─ Jobs: Email, push notifications
  └─ Analytics: Data pipeline
```

Scaling Strategies:
- Database: Read replicas, sharding
- Cache: Multi-level (browser, CDN, app, DB)
- Async: Job queues for notifications
- Monitoring: Alert on latency, error rate
- Load balancing: Geographic distribution

### Distributed Systems Challenges

**CAP Theorem**
- Consistency: All nodes see same data
- Availability: System always responds
- Partition tolerance: Handle network splits

Choose 2 of 3:
- CP: Database (strong consistency)
- AP: Social media (eventual consistency)
- CA: Rare in practice (partition-free)

**Consistency Models**
- Strict: All reads see latest write (hard)
- Eventual: Eventually consistent (realistic)
- Strong: Linearizability (expensive)

**Failure Modes**
- Network partition: Split brain
- Byzantine failures: Malicious nodes
- Clock skew: Time synchronization
- Resource exhaustion: Overload protection

## Database Optimization Deep Dive

### Query Optimization

```sql
-- Bad: O(n²)
SELECT * FROM users;
SELECT COUNT(*) FROM posts WHERE user_id IN (...)

-- Good: O(n)
SELECT u.id, COUNT(p.id) as post_count
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
GROUP BY u.id;

-- Better: Use indexes
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_posts_created ON posts(created_at DESC);
```

### Indexing Strategy

```sql
-- Composite indexes (order matters!)
CREATE INDEX idx_user_status_created ON users(status, created_at DESC);

-- Good for:
WHERE status = 'active' AND created_at > ...
ORDER BY created_at DESC;

-- Bad for:
WHERE created_at > ... AND status = 'active';
```

### Denormalization Patterns

When to denormalize:
- Complex aggregations (COUNT, SUM)
- Frequently accessed derived data
- Trade-off: storage vs computation
- Keep in sync with triggers or jobs

## API Design Advanced

### GraphQL vs REST

**GraphQL Advantages**
- Query exactly what needed
- Single request (no waterfall)
- Strong typing
- Introspection & docs

**GraphQL Challenges**
- Query complexity attacks
- N+1 query problem
- Caching complications
- Larger learning curve

### API Versioning

```
Header versioning:
  Accept: application/vnd.myapi.v2+json

URL versioning:
  GET /api/v2/users

Parameter versioning:
  GET /api/users?version=2
```

## Security Deep Dive

### Authentication at Scale

**Session-based**
```
Login → Create session → Store in Redis
Request → Check session → Authorization
Logout → Delete session
```

Challenges: Distributed sessions, sticky sessions

**JWT (Token-based)**
```
Login → Generate JWT → Return token
Request → Validate JWT → Authorization
Logout → Add to blacklist (if needed)
```

Advantages: Stateless, scalable, mobile-friendly

### Authorization Patterns

**Role-Based (RBAC)**
```
User → Role → Permissions
admin → {create, read, update, delete}
user → {read}
```

**Attribute-Based (ABAC)**
```
if (user.department == 'sales' && resource.owner == user.id)
  allow(user, 'update', resource)
```

### Encryption

**Encryption at Rest**
- File-level encryption
- Database encryption
- Transparent encryption (TDE)
- Key management (rotation, storage)

**Encryption in Transit**
- TLS 1.3+ (current standard)
- Cipher suite selection
- Certificate management
- Mutual TLS (mTLS) for services

## Performance Optimization Techniques

### Caching Strategies

**Cache Warming**
- Pre-load hot data
- Background refresh
- Intelligent TTLs

**Cache Invalidation**
```
# Cache invalidation is hard
1. TTL-based: Simple but stale data
2. Event-based: Fire events on update
3. Tag-based: Group related caches
4. Explicit: Manual invalidation
```

**Multi-level Caching**
```
L1: Browser cache (HTTP headers)
L2: CDN cache (geographic)
L3: Application cache (Redis)
L4: Database query cache
L5: Database buffers
```

### Load Testing & Capacity Planning

Tools:
- JMeter: Load testing
- Gatling: Distributed testing
- Locust: Python-based
- K6: Modern, developer-friendly

Approach:
```
1. Baseline: Current performance
2. Ramp-up: Gradually increase load
3. Spike: Sudden traffic spike
4. Soak: Long-duration test
5. Stress: Until system breaks
```

## Emerging Patterns

### Event Sourcing

```
Instead of storing state:
  users table: { id, name, email }

Store events:
  events: [
    { type: 'UserCreated', data: { id, name, email } },
    { type: 'EmailUpdated', data: { id, email } },
    { type: 'UserDeleted', data: { id } }
  ]

Rebuild state by replaying events
```

Benefits:
- Complete audit trail
- Time travel (replay to any point)
- Event-driven architecture
- CQRS pattern

Challenges:
- Complexity
- Event versioning
- Testing difficulty
- Storage size

### CQRS (Command Query Responsibility Segregation)

```
Write Model (Optimized for writes):
  Users → PostgreSQL → Optimized schema

Read Model (Optimized for reads):
  Users Read → Elasticsearch → Document-based

Sync via event bus
```

Benefits:
- Optimize reads and writes separately
- Scale independently
- Complex business logic

## Interview Preparation Advanced

### System Design Interview

**Approach**
```
1. Clarify Requirements (5 min)
   - DAU, MAU, QPS
   - Latency requirements
   - Consistency requirements
   - Data volume

2. High-level Architecture (10 min)
   - Components overview
   - Communication patterns
   - Technology choices

3. Deep Dive (20 min)
   - Database schema
   - API design
   - Caching strategy
   - Scaling approach

4. Refinement (5 min)
   - Identify bottlenecks
   - Discuss trade-offs
   - Address concerns
```

**Common Questions**
- Design Uber/Lyft (real-time matching)
- Design Instagram (scale, feed)
- Design Netflix (streaming, recommendations)
- Design Slack (messaging, search)

### Behavioral Interview

**STAR Method**
- Situation: Context and challenge
- Task: Your responsibility
- Action: What you did
- Result: Outcome and learning

**Questions to Prepare**
- Most complex project you built?
- How did you handle conflict?
- Example of overcoming obstacle?
- Time you failed?
- How do you stay updated?

## Resources & Advanced Learning

### Books
- "Designing Data-Intensive Applications" - Martin Kleppmann
- "System Design Interview" - Alex Xu
- "Building Microservices" - Sam Newman
- "Site Reliability Engineering" - Google

### Courses
- Grokking System Design Interview
- ByteByteGo (YouTube)
- Architecture Decision Records
- Case studies from real companies

### Communities
- Paper Trail: Engineering papers
- High Scalability: Real-world systems
- Hacker News: Industry discussions
- Engineering blogs: Company insights
---

**Ready to Level Up?** Deep dive into agent specializations!
