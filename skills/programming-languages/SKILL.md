---
name: programming-languages
description: Master 10+ programming languages including JavaScript, TypeScript, Python, Java, Go, Rust, C++, and more. Learn syntax, concepts, frameworks, and ecosystem best practices.
sasmp_version: "1.3.0"
bonded_agent: 01-web-development
bond_type: PRIMARY_BOND
---

# Programming Languages Skills

## Quick Start

Get started with your chosen language:

### JavaScript - Web and Backend
```javascript
// Modern JavaScript (ES6+)
const fetchUsers = async (userId) => {
  const response = await fetch(`/api/users/${userId}`);
  const user = await response.json();
  return user;
};

// Promises and async/await
Promise.all([
  fetchUsers(1),
  fetchUsers(2),
  fetchUsers(3)
]).then(users => console.log(users));
```

### Python - Versatile and Readable
```python
# Python fundamentals
def fibonacci(n):
    """Generate Fibonacci sequence up to n terms"""
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# List comprehension and decorators
squares = [x**2 for x in range(10)]

# Object-oriented programming
class Calculator:
    @staticmethod
    def add(a, b):
        return a + b
```

### Go - Concurrent and Efficient
```go
// Go concurrency with goroutines
package main

import (
    "fmt"
    "sync"
)

func main() {
    var wg sync.WaitGroup

    for i := 1; i <= 3; i++ {
        wg.Add(1)
        go func(num int) {
            defer wg.Done()
            fmt.Printf("Processing %d\n", num)
        }(i)
    }

    wg.Wait()
}
```

## Language Specializations

### JavaScript/TypeScript
- Event-driven, non-blocking I/O
- First-class functions, closures
- Async programming with promises
- Prototype-based inheritance
- Modern ES6+ features
- Ecosystem: Node.js, React, Express.js

### Python
- Readable, expressive syntax
- Dynamic typing, duck typing
- List comprehensions, generators
- Object-oriented and functional
- Extensive standard library
- Frameworks: Django, FastAPI, Flask

### Java
- Strong static typing, JVM
- Object-oriented paradigm
- Concurrency model (threads)
- Mature ecosystem
- Spring framework dominance
- Enterprise applications

### Go
- Simple, clean syntax
- Built-in concurrency (goroutines)
- Fast compilation, single binary
- Efficient memory usage
- Strong standard library
- Cloud-native applications

### Rust
- Memory safety without garbage collection
- Ownership and borrowing system
- Fearless concurrency
- Performance comparable to C++
- Growing ecosystem
- Systems programming and WebAssembly

## Core Concepts (All Languages)

### Variables and Data Types
- Primitive types: integers, floats, strings, booleans
- Collections: arrays, lists, maps, sets
- Type systems: static vs dynamic, strong vs weak

### Functions and Scope
- Function parameters and return values
- Variable scope: local, global, closure
- Higher-order functions, callbacks
- Recursion and tail call optimization

### Object-Oriented Programming
- Classes and objects
- Inheritance and polymorphism
- Encapsulation, access modifiers
- Abstract classes and interfaces
- Composition over inheritance

### Functional Programming
- First-class functions
- Pure functions and immutability
- Higher-order functions
- Map, filter, reduce operations
- Lambda expressions

### Error Handling
- Exceptions and try-catch blocks
- Error propagation
- Custom exceptions
- Panic and recovery (language-specific)
- Result types (Rust, Go)

## Frameworks by Language

### JavaScript
- **Frontend**: React, Vue.js, Angular, Svelte
- **Backend**: Express.js, NestJS, Koa, Hapi
- **Fullstack**: Next.js, Remix, Nuxt

### Python
- **Web**: Django, FastAPI, Flask, Pyramid
- **Data Science**: NumPy, Pandas, Scikit-learn
- **ML/AI**: TensorFlow, PyTorch, JAX
- **Automation**: Celery, APScheduler

### Java
- **Enterprise**: Spring Boot, Quarkus, Micronaut
- **Web**: Apache Struts, Play Framework
- **Testing**: JUnit, Mockito, Selenium
- **Build**: Maven, Gradle

### Go
- **Web**: Gin, Echo, Iris, Chi
- **Cloud**: Docker, Kubernetes (written in Go)
- **DevOps**: Terraform, Helm, Prometheus
- **Systems**: High-performance services

## Learning Pathways

### First Language (Pick One)
- **Python**: Best for beginners, most versatile
- **JavaScript**: Best for web development
- **Java**: Best for enterprise careers
- **Go**: Best for DevOps and systems

### Second Language
- **Complementary**: After Python, choose JavaScript or Go
- **Depth**: After JavaScript, add Python or Go
- **Enterprise**: After Java, add Python or Go

### Advanced Languages
- **Rust**: For systems programming
- **C++**: For high-performance systems
- **Kotlin**: For Android development
- **R**: For data science

## Hands-On Projects

### Beginner
- FizzBuzz and basic algorithms
- To-do list with persistence
- Calculator application
- Temperature converter

### Intermediate
- Web API with CRUD operations
- Data processing script
- Web scraper
- Chat application

### Advanced
- Microservices architecture
- Distributed system
- Performance-critical application
- Open-source contribution

## Best Practices

### Code Quality
- Clear naming conventions
- DRY (Don't Repeat Yourself)
- SOLID principles
- Design patterns
- Code reviews

### Performance
- Algorithm complexity analysis
- Profiling and optimization
- Memory management
- Caching strategies
- Benchmarking

### Testing
- Unit testing
- Integration testing
- Test coverage
- TDD (Test-Driven Development)
- Mocking and fixtures

### Documentation
- Code comments
- Docstrings/Javadoc
- README files
- API documentation
- Architecture decision records

## Comparison Matrix

| Language | Learning Curve | Performance | Job Market | Best Use |
|----------|---|---|---|---|
| **Python** | Easy | Good | Excellent | Data, Web, ML |
| **JavaScript** | Medium | Good | Excellent | Web, Full-stack |
| **Java** | Medium | Excellent | Excellent | Enterprise |
| **Go** | Medium | Excellent | Growing | Cloud, DevOps |
| **Rust** | Hard | Excellent | Growing | Systems |
| **C++** | Hard | Excellent | Stable | Performance |

## Career Paths

### Full-Stack Web Developer
- Primary: JavaScript/TypeScript
- Secondary: Python or Java
- Timeline: 6-12 months

### Backend Engineer
- Primary: Python, Java, or Go
- Secondary: SQL, database design
- Timeline: 12-24 months

### Data Science/ML
- Primary: Python
- Secondary: R, SQL
- Timeline: 12-18 months

### DevOps/Cloud Engineer
- Primary: Go, Bash, Python
- Secondary: Infrastructure tools
- Timeline: 18-24 months

### Systems Engineer
- Primary: Rust or C++
- Secondary: Assembly, OS concepts
- Timeline: 24+ months

## Key Takeaways

1. Learn fundamentals deeply before picking frameworks
2. Master one language, then add others
3. Build projects to reinforce learning
4. Read others' code to improve
5. Understand concepts beyond syntax
6. Stay updated with language evolution
7. Join language-specific communities

## Related Skills

- **Web Development**: Frontend/backend frameworks
- **Cloud & DevOps**: Infrastructure automation
- **Data Engineering**: Database and ETL tools
- **AI/ML Engineering**: Model development
- **Mobile Development**: Cross-platform frameworks

---

*For detailed language-specific learning paths, use `/learn programming-languages`*
