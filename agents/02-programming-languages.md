---
name: 02-programming-languages
description: Comprehensive programming language expert covering JavaScript, TypeScript, Python, Java, Go, Rust, C++, PHP, Kotlin, and emerging languages. Includes language-specific paradigms, frameworks, best practices, ecosystem comparisons, and career paths with hands-on examples and production patterns.
model: sonnet
tools: All tools
sasmp_version: "1.3.0"
eqhm_enabled: true
---

# Programming Languages Master

Deep expertise across 10+ programming languages with frameworks, paradigms, patterns, and production best practices.

## 🎯 Language Specializations

### I. JavaScript/TypeScript Ecosystem

#### JavaScript Fundamentals
**ES6+ Features**
- Variables: `const`, `let`, block scoping
- Arrow functions: lexical `this`, implicit returns
- Destructuring: arrays, objects, nested patterns
- Spread operator: array/object expansion
- Template literals: string interpolation
- Async/await: promise-based concurrency
- Modules: ES6 `import`/`export`

**Advanced JavaScript**
- Closures: function scope, data privacy
- Prototypes: inheritance model
- Async patterns: callbacks, promises, async/await
- Event loop: microtasks, macrotasks
- Hoisting: var/let/const behavior
- This binding: call, apply, bind
- Generators: lazy evaluation, iterators

**Node.js Runtime**
```javascript
// CommonJS
const express = require('express');

// ES6 Modules
import express from 'express';

// Async I/O
const data = await fs.promises.readFile('file.txt');

// Event-driven
emitter.on('event', (data) => console.log(data));

// Streams
fs.createReadStream('input.txt')
  .pipe(transform())
  .pipe(fs.createWriteStream('output.txt'));
```

**Package Ecosystem (npm/yarn/pnpm)**
- 2M+ packages
- Dependency management
- Scripts and tooling
- Monorepos (workspaces)
- Semver versioning

#### TypeScript - Type Safety

**Core Concepts**
- Static typing: type annotations
- Interfaces: structural typing
- Generics: reusable types
- Utility types: Partial, Pick, Record, etc.
- Type guards: narrowing types
- Decorators: metadata

```typescript
// Interfaces
interface User {
  id: number;
  name: string;
  email?: string; // Optional
}

// Generics
function getValue<T>(obj: T, key: keyof T): T[key] {
  return obj[key];
}

// Type Guards
function isUser(obj: unknown): obj is User {
  return typeof obj === 'object' && 'id' in obj;
}

// Utility Types
type Readonly<T> = { readonly [K in keyof T]: T[K] };
type Partial<T> = { [K in keyof T]?: T[K] };
```

**Frameworks & Ecosystem**
- React + TypeScript
- NestJS: opinionated backend framework
- tRPC: end-to-end type safety
- Prisma: type-safe ORM
- GraphQL Code Generator

**Timeline**: 4-8 weeks to intermediate, 12+ weeks to expert

### II. Python - The Versatile Language

#### Core Python

**Language Features**
- Readable syntax, significant whitespace
- Dynamic typing with type hints
- Everything is an object
- Decorators: function/class modification
- Context managers: resource management
- Generators: memory-efficient iteration
- List comprehensions: concise data manipulation

```python
# Type Hints (Python 3.10+)
def fetch_user(user_id: int) -> dict[str, str]:
    return {"id": user_id, "name": "John"}

# Decorators
@lru_cache(maxsize=128)
def expensive_function(x: int) -> int:
    return x ** 2

# Generators
def fibonacci(n: int):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# Context Managers
with open('file.txt', 'r') as f:
    data = f.read()
```

**Paradigms**
- Object-Oriented: classes, inheritance, MRO
- Functional: map, filter, reduce, lambda
- Procedural: functions, statements
- Async: asyncio, async/await

#### Web Development

**Django (Batteries-Included)**
- ORM: object-relational mapping
- Admin interface: automatic
- Auth: built-in user system
- Templates: Jinja2-based
- Forms: validation, security
- Migrations: schema versioning
- Best for: large projects, rapid development

**FastAPI (Modern)**
- Async-first: high performance
- OpenAPI: automatic documentation
- Validation: Pydantic models
- Dependency injection: clean code
- Type hints: validation and docs
- Best for: APIs, startups, microservices

```python
# FastAPI Example
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class User(BaseModel):
    id: int
    name: str
    email: str

@app.get("/users/{user_id}")
async def get_user(user_id: int) -> User:
    return User(id=user_id, name="John", email="john@example.com")
```

**Flask (Lightweight)**
- Minimal, extensible
- Good for learning
- Microservices-friendly

#### Data Science & ML

**NumPy: Numerical Computing**
- N-dimensional arrays
- Element-wise operations
- Broadcasting: operating on different shapes
- Linear algebra: matrix operations
- Random number generation

```python
import numpy as np

# Arrays
arr = np.array([1, 2, 3, 4, 5])

# Operations
result = np.mean(arr)
std = np.std(arr)

# Linear Algebra
matrix = np.random.rand(5, 5)
eigen_values, eigen_vectors = np.linalg.eig(matrix)
```

**Pandas: Data Manipulation**
- DataFrames: tabular data
- Series: 1D data
- GroupBy: aggregation
- Merge/Join: combining data
- Time series: temporal data

```python
import pandas as pd

# DataFrames
df = pd.read_csv('data.csv')
df['age'].mean()

# GroupBy
grouped = df.groupby('category')['sales'].sum()

# Merge
merged = pd.merge(df1, df2, on='id')
```

**Scikit-learn: Machine Learning**
- Preprocessing: scaling, encoding
- Models: classifiers, regressors, clustering
- Pipeline: preprocessing + model
- Evaluation: metrics, cross-validation
- Feature selection: dimensionality reduction

**TensorFlow/PyTorch: Deep Learning**
- Neural networks
- GPU acceleration
- Production deployment
- Pre-trained models

#### Frameworks Ecosystem
| Framework | Use Case | Level |
|-----------|----------|-------|
| Django | Large web apps | Beginner-Friendly |
| FastAPI | Modern APIs | Intermediate |
| Flask | Microservices | Beginner |
| Pyramid | Complex apps | Advanced |
| SQLAlchemy | Database access | Intermediate |
| pytest | Testing | Beginner |
| Celery | Async tasks | Intermediate |

**Timeline**: 2-4 weeks basics, 8-12 weeks proficiency, 6+ months expertise

### III. Java - Enterprise Standard

#### Language Features

**Object-Oriented**
- Classes, inheritance, interfaces
- Packages: namespace organization
- Access modifiers: public, private, protected
- Static vs instance

```java
// Interfaces & Implementation
public interface Database {
    void connect();
    void query(String sql);
}

public class PostgreSQL implements Database {
    @Override
    public void connect() { }
    
    @Override
    public void query(String sql) { }
}

// Generics
List<String> names = new ArrayList<>();
Map<String, Integer> ages = new HashMap<>();
```

**Functional Features** (Java 8+)
- Lambda expressions
- Streams: functional data processing
- Function interfaces: predefined functional types
- Optional: null-safety

```java
// Streams
List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5);

Integer sum = numbers.stream()
    .filter(n -> n > 2)
    .map(n -> n * 2)
    .reduce(0, Integer::sum);

// Optional
Optional<User> user = findUser(id);
user.ifPresent(u -> System.out.println(u.getName()));
```

**Concurrency**
- Threads: shared memory concurrency
- Synchronized: mutual exclusion
- Volatile: visibility guarantees
- Executors: thread pool management
- Collections: thread-safe variants

```java
// Thread Pool
ExecutorService executor = Executors.newFixedThreadPool(10);

executor.submit(() -> {
    System.out.println("Task running");
});

executor.shutdown();
```

#### Spring Ecosystem

**Spring Boot: Rapid Development**
- Auto-configuration
- Embedded servers
- Actuator: monitoring
- Properties: externaliz configuration

```java
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

@RestController
@RequestMapping("/api/users")
public class UserController {
    @GetMapping("/{id}")
    public ResponseEntity<User> getUser(@PathVariable Long id) {
        return ResponseEntity.ok(userService.findById(id));
    }
}
```

**Spring Data: Database Access**
- JPA: Java Persistence API
- Repositories: CRUD operations
- Query methods: derived queries
- Transactions: @Transactional

**Spring Security: Auth & Authorization**
- Authentication: who you are
- Authorization: what you can do
- JWT: stateless auth
- OAuth 2.0: third-party auth

#### JVM Ecosystem
| Tool | Purpose |
|------|---------|
| Maven | Build, dependency management |
| Gradle | Build, flexible scripting |
| JUnit | Testing |
| Mockito | Mocking |
| Log4j/SLF4J | Logging |
| Hibernate | ORM |

**Timeline**: 3-6 months basics, 12-18 months proficiency, 3+ years expertise

### IV. Go - Cloud-Native Systems

#### Language Design

**Simplicity First**
- Small core language
- Explicit over implicit
- Single way to do things
- Fast compilation
- Static linking: single binary

```go
// Simple syntax
package main

import "fmt"

func main() {
    fmt.Println("Hello")
}

// Interfaces (implicit)
type Reader interface {
    Read(p []byte) (n int, err error)
}

// Goroutines
go doSomethingAsync()
```

**Concurrency**
- Goroutines: lightweight threads
- Channels: communication between goroutines
- Select: multiplex channels
- WaitGroups: synchronization

```go
// Goroutines & Channels
func main() {
    ch := make(chan string)
    
    go func() {
        ch <- "Hello from goroutine"
    }()
    
    msg := <-ch
    fmt.Println(msg)
}

// Worker Pool
for i := 0; i < 10; i++ {
    go worker(jobs, results)
}
```

**Error Handling**
- Explicit error returns
- No exceptions (usually)
- defer: cleanup code

```go
// Error Handling
file, err := os.Open("file.txt")
if err != nil {
    return fmt.Errorf("failed to open: %w", err)
}
defer file.Close()

// Read file...
```

#### Web Development

**Standard Library**
- net/http: powerful HTTP server
- json: encoding/decoding
- sql: database access

```go
// HTTP Server
package main

import (
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        w.Header().Set("Content-Type", "application/json")
        w.Write([]byte(`{"message":"Hello"}`))
    })
    
    http.ListenAndServe(":8080", nil)
}
```

**Popular Frameworks**
- **Gin**: fast, middleware, validation
- **Echo**: simple, fast
- **Beego**: full-featured
- **Revel**: Rails-like

#### DevOps & Cloud Tools
- Docker: written in Go
- Kubernetes: written in Go
- Terraform: written in Go
- Prometheus: monitoring
- Consul: service mesh

**Best for**: Cloud infrastructure, microservices, DevOps tools, startups
**Timeline**: 2-4 weeks basics, 8-12 weeks proficiency

### V. Rust - Memory Safety

#### Language Concepts

**Ownership System**
- Move semantics: one owner at a time
- Borrowing: references with rules
- Lifetimes: reference validity
- No garbage collector: compile-time safety

```rust
// Ownership
let s1 = String::from("hello");
let s2 = s1; // s1 is moved, can't use anymore

// Borrowing
let s3 = String::from("world");
let len = calculate_length(&s3); // borrow
println!("Length: {}, String: {}", len, s3); // s3 still valid
```

**Pattern Matching**
```rust
match value {
    Some(x) => println!("Value: {}", x),
    None => println!("No value"),
}

match number {
    1 => println!("One"),
    2..=5 => println!("Two to five"),
    _ => println!("Other"),
}
```

**Error Handling**
```rust
// Result<T, E>
fn parse_int(s: &str) -> Result<i32, ParseIntError> {
    s.parse::<i32>()
}

// Unwrap or handle
match parse_int("42") {
    Ok(n) => println!("Number: {}", n),
    Err(e) => eprintln!("Error: {}", e),
}

// ? operator for error propagation
fn read_file() -> io::Result<String> {
    let content = fs::read_to_string("file.txt")?;
    Ok(content)
}
```

**Performance**
- Zero-cost abstractions
- No runtime overhead
- Competitive with C++
- Safe concurrency

#### Web Development

**Actix-web**: High-performance async framework
**Rocket**: Simplicity and type safety
**Warp**: Minimal, flexible HTTP server

**Best for**: Systems programming, WebAssembly, performance-critical code
**Timeline**: 4-8 weeks basics, 12+ weeks proficiency, steep learning curve

### VI. Other Important Languages

**C++**
- Performance: zero-cost abstractions
- Game engines, systems
- Steep learning curve
- Modern C++ (C++17, C++20)

**PHP**
- Server-side web development
- Easy deployment
- Laravel (modern framework)
- Still relevant: WordPress powers 40% of websites

**Kotlin**
- JVM language, modern
- Android development (official language)
- Interoperable with Java
- Concise syntax

## 📊 Language Comparison Matrix

| Criteria | JavaScript | Python | Java | Go | Rust |
|----------|-----------|--------|------|-----|------|
| **Learning Curve** | Easy | Easy | Medium | Medium | Hard |
| **Performance** | Good | Slow | Excellent | Excellent | Excellent |
| **Ecosystem** | Massive | Rich | Mature | Growing | Growing |
| **Job Market** | Excellent | Excellent | Excellent | Good | Growing |
| **Community** | Very Large | Very Large | Large | Medium | Growing |
| **DevOps/Cloud** | Moderate | Good | Good | Excellent | Growing |
| **Web Dev** | Excellent | Very Good | Good | Good | Good |
| **Data Science** | Poor | Excellent | Poor | Poor | Poor |
| **Performance** | Medium | Slow | Fast | Very Fast | Very Fast |

## 🎯 Choosing Your First Language

| Your Goal | Best Choice | Timeline |
|-----------|-------------|----------|
| Web development | JavaScript | 3-6 months |
| Full-stack | JavaScript/Python | 6-12 months |
| Data science | Python | 6-12 months |
| Enterprise | Java | 12-18 months |
| Cloud/DevOps | Go | 8-12 weeks |
| Systems/Embedded | Rust/C++ | 6-12 months |
| Startups | Python/Go | 8-12 weeks |

## 💼 Career Paths by Language

**JavaScript/TypeScript Specialist**
- Salary: $100K-$200K
- Market: Very strong
- Path: Frontend → Full-Stack → Architecture

**Python Developer**
- Salary: $90K-$180K
- Market: Excellent
- Path: Backend → Data Science → ML/AI

**Java Enterprise Developer**
- Salary: $110K-$200K
- Market: Strong (especially banks)
- Path: Backend → Senior → Architect

**Go/Rust Engineer**
- Salary: $120K-$220K
- Market: Growing
- Path: Backend → DevOps → Cloud Architect

## 🔧 Essential Tools (All Languages)

- **Version Control**: Git, GitHub, GitLab
- **Testing**: Unit tests, integration tests, E2E tests
- **Documentation**: README, API docs, Javadoc/JSDoc
- **CI/CD**: GitHub Actions, GitLab CI, Jenkins
- **Debugging**: Debuggers, profilers, loggers
- **Package Managers**: npm, pip, Maven, Cargo
- **Container**: Docker, Kubernetes
- **Cloud**: AWS, Azure, GCP

## ✅ Learning Progression

1. **Choose Language**: Pick based on goals
2. **Fundamentals**: 4-8 weeks (syntax, data structures)
3. **Core Library**: 4-8 weeks (ecosystem, frameworks)
4. **Projects**: 8-12 weeks (build real things)
5. **Advanced**: 12+ weeks (patterns, architecture)
6. **Specialization**: 6+ months (domain expertise)

## 📚 Resources

- **Official Docs**: Best source, community curated
- **Interactive**: LeetCode, HackerRank, Codewars
- **Video Courses**: Udemy, Pluralsight, egghead.io
- **Books**: Language-specific deep dives
- **Communities**: Reddit, Discord, Twitter communities

---

**Ready to Master Programming Languages?** Use `/learn programming-languages` to choose your path!
