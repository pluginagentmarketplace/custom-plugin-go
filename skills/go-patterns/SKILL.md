---
name: go-patterns
description: Go design patterns - creational, structural, behavioral, and concurrency patterns
sasmp_version: "1.3.0"
bonded_agent: go-advanced
bond_type: PRIMARY_BOND
---

# Go Design Patterns Skill

## Overview

Master design patterns in Go - idiomatic implementations of creational, structural, behavioral, and concurrency patterns.

## Creational Patterns

### 1. Factory
```go
// Product interface
type Database interface {
    Connect() error
    Query(query string) ([]Row, error)
}

// Concrete products
type PostgreSQL struct{ dsn string }
type MySQL struct{ dsn string }

func (p *PostgreSQL) Connect() error { /* ... */ }
func (m *MySQL) Connect() error { /* ... */ }

// Factory function
func NewDatabase(dbType, dsn string) (Database, error) {
    switch dbType {
    case "postgres":
        return &PostgreSQL{dsn: dsn}, nil
    case "mysql":
        return &MySQL{dsn: dsn}, nil
    default:
        return nil, fmt.Errorf("unknown database: %s", dbType)
    }
}
```

### 2. Singleton
```go
type Config struct {
    DatabaseURL string
    Port        int
}

var (
    instance *Config
    once     sync.Once
)

func GetConfig() *Config {
    once.Do(func() {
        instance = &Config{
            DatabaseURL: os.Getenv("DATABASE_URL"),
            Port:        8080,
        }
    })
    return instance
}
```

### 3. Builder
```go
type Server struct {
    host    string
    port    int
    timeout time.Duration
    maxConn int
}

type ServerBuilder struct {
    server Server
}

func NewServerBuilder() *ServerBuilder {
    return &ServerBuilder{
        server: Server{
            host:    "localhost",
            port:    8080,
            timeout: 30 * time.Second,
            maxConn: 100,
        },
    }
}

func (b *ServerBuilder) Host(h string) *ServerBuilder {
    b.server.host = h
    return b
}

func (b *ServerBuilder) Port(p int) *ServerBuilder {
    b.server.port = p
    return b
}

func (b *ServerBuilder) Timeout(t time.Duration) *ServerBuilder {
    b.server.timeout = t
    return b
}

func (b *ServerBuilder) Build() Server {
    return b.server
}

// Usage
server := NewServerBuilder().
    Host("0.0.0.0").
    Port(9090).
    Timeout(60 * time.Second).
    Build()
```

### 4. Functional Options
```go
type Server struct {
    host    string
    port    int
    timeout time.Duration
}

type Option func(*Server)

func WithHost(host string) Option {
    return func(s *Server) {
        s.host = host
    }
}

func WithPort(port int) Option {
    return func(s *Server) {
        s.port = port
    }
}

func WithTimeout(timeout time.Duration) Option {
    return func(s *Server) {
        s.timeout = timeout
    }
}

func NewServer(opts ...Option) *Server {
    server := &Server{
        host:    "localhost",
        port:    8080,
        timeout: 30 * time.Second,
    }
    for _, opt := range opts {
        opt(server)
    }
    return server
}

// Usage
server := NewServer(
    WithHost("0.0.0.0"),
    WithPort(9090),
    WithTimeout(60 * time.Second),
)
```

## Structural Patterns

### 5. Adapter
```go
// Target interface
type PaymentProcessor interface {
    Pay(amount float64) error
}

// Adaptee (third-party)
type StripeAPI struct{}
func (s *StripeAPI) MakePayment(cents int64, currency string) error {
    // Stripe implementation
    return nil
}

// Adapter
type StripeAdapter struct {
    stripe *StripeAPI
}

func (a *StripeAdapter) Pay(amount float64) error {
    cents := int64(amount * 100)
    return a.stripe.MakePayment(cents, "USD")
}
```

### 6. Decorator
```go
// Component interface
type Notifier interface {
    Send(message string) error
}

// Concrete component
type EmailNotifier struct{ email string }
func (n *EmailNotifier) Send(message string) error {
    // Send email
    return nil
}

// Decorator
type LoggingNotifier struct {
    notifier Notifier
    logger   *log.Logger
}

func (n *LoggingNotifier) Send(message string) error {
    n.logger.Printf("Sending: %s", message)
    err := n.notifier.Send(message)
    n.logger.Printf("Sent: error=%v", err)
    return err
}

// Usage
notifier := &LoggingNotifier{
    notifier: &EmailNotifier{email: "user@example.com"},
    logger:   log.Default(),
}
```

### 7. Repository Pattern
```go
// Entity
type User struct {
    ID    int64
    Name  string
    Email string
}

// Repository interface
type UserRepository interface {
    FindByID(ctx context.Context, id int64) (*User, error)
    FindAll(ctx context.Context) ([]*User, error)
    Create(ctx context.Context, user *User) error
    Update(ctx context.Context, user *User) error
    Delete(ctx context.Context, id int64) error
}

// Implementation
type PostgresUserRepository struct {
    db *sql.DB
}

func (r *PostgresUserRepository) FindByID(ctx context.Context, id int64) (*User, error) {
    var user User
    err := r.db.QueryRowContext(ctx,
        "SELECT id, name, email FROM users WHERE id = $1", id,
    ).Scan(&user.ID, &user.Name, &user.Email)
    if err == sql.ErrNoRows {
        return nil, ErrNotFound
    }
    return &user, err
}

// Service uses interface
type UserService struct {
    repo UserRepository // Interface, not implementation
}
```

## Behavioral Patterns

### 8. Strategy
```go
// Strategy interface
type CompressionStrategy interface {
    Compress(data []byte) ([]byte, error)
}

// Concrete strategies
type GzipCompression struct{}
func (g *GzipCompression) Compress(data []byte) ([]byte, error) {
    // Gzip implementation
    return data, nil
}

type ZipCompression struct{}
func (z *ZipCompression) Compress(data []byte) ([]byte, error) {
    // Zip implementation
    return data, nil
}

// Context
type FileCompressor struct {
    strategy CompressionStrategy
}

func (f *FileCompressor) SetStrategy(s CompressionStrategy) {
    f.strategy = s
}

func (f *FileCompressor) CompressFile(path string) error {
    data, _ := os.ReadFile(path)
    compressed, err := f.strategy.Compress(data)
    // Save compressed data
    return err
}
```

### 9. Observer
```go
type Event struct {
    Type string
    Data interface{}
}

type Observer interface {
    OnNotify(event Event)
}

type Subject struct {
    observers []Observer
    mu        sync.RWMutex
}

func (s *Subject) Register(o Observer) {
    s.mu.Lock()
    defer s.mu.Unlock()
    s.observers = append(s.observers, o)
}

func (s *Subject) Notify(event Event) {
    s.mu.RLock()
    defer s.mu.RUnlock()
    for _, o := range s.observers {
        go o.OnNotify(event)
    }
}
```

## Concurrency Patterns

### 10. Worker Pool
```go
func WorkerPool[T any, R any](
    ctx context.Context,
    workers int,
    jobs <-chan T,
    process func(T) R,
) <-chan R {
    results := make(chan R)
    var wg sync.WaitGroup

    for i := 0; i < workers; i++ {
        wg.Add(1)
        go func() {
            defer wg.Done()
            for {
                select {
                case job, ok := <-jobs:
                    if !ok {
                        return
                    }
                    results <- process(job)
                case <-ctx.Done():
                    return
                }
            }
        }()
    }

    go func() {
        wg.Wait()
        close(results)
    }()

    return results
}
```

### 11. Circuit Breaker
```go
type CircuitBreaker struct {
    failures    int
    threshold   int
    timeout     time.Duration
    lastFailure time.Time
    state       string // "closed", "open", "half-open"
    mu          sync.Mutex
}

func (cb *CircuitBreaker) Execute(fn func() error) error {
    cb.mu.Lock()
    defer cb.mu.Unlock()

    if cb.state == "open" {
        if time.Since(cb.lastFailure) > cb.timeout {
            cb.state = "half-open"
        } else {
            return ErrCircuitOpen
        }
    }

    err := fn()
    if err != nil {
        cb.failures++
        cb.lastFailure = time.Now()
        if cb.failures >= cb.threshold {
            cb.state = "open"
        }
        return err
    }

    cb.failures = 0
    cb.state = "closed"
    return nil
}
```

## Quick Reference

| Pattern | Category | Use Case |
|---------|----------|----------|
| Factory | Creational | Object creation |
| Singleton | Creational | Single instance |
| Builder | Creational | Complex construction |
| Functional Options | Creational | Flexible config |
| Adapter | Structural | Interface compatibility |
| Decorator | Structural | Add behavior |
| Repository | Structural | Data access |
| Strategy | Behavioral | Interchangeable algorithms |
| Observer | Behavioral | Event notification |
| Worker Pool | Concurrency | Parallel processing |
| Circuit Breaker | Concurrency | Fault tolerance |

## Related
- `go-concurrency` - Concurrency primitives
- `go-testing` - Testing patterns
