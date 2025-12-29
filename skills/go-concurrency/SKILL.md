---
name: go-concurrency
description: Go concurrency - goroutines, channels, select, and sync primitives
sasmp_version: "1.3.0"
bonded_agent: go-concurrency
bond_type: PRIMARY_BOND
---

# Go Concurrency Skill

## Overview

Master Go's powerful concurrency model - goroutines, channels, and synchronization primitives.

## Core Concepts

### 1. Goroutines
```go
// Start a goroutine
go func() {
    fmt.Println("Running in goroutine")
}()

// Goroutine with parameter
go func(msg string) {
    fmt.Println(msg)
}("Hello")

// Named function as goroutine
go processData(data)

// Wait for goroutines
var wg sync.WaitGroup
for i := 0; i < 5; i++ {
    wg.Add(1)
    go func(id int) {
        defer wg.Done()
        fmt.Println("Worker", id)
    }(i)
}
wg.Wait()
```

### 2. Channels
```go
// Unbuffered channel
ch := make(chan int)

// Buffered channel
buffered := make(chan int, 10)

// Send and receive
ch <- 42       // Send
value := <-ch  // Receive

// Channel direction in function
func send(ch chan<- int) {    // Send-only
    ch <- 1
}

func receive(ch <-chan int) { // Receive-only
    v := <-ch
}

// Close channel
close(ch)

// Check if closed
value, ok := <-ch
if !ok {
    fmt.Println("Channel closed")
}

// Range over channel
for value := range ch {
    fmt.Println(value)
}
```

### 3. Select Statement
```go
select {
case msg := <-ch1:
    fmt.Println("Received from ch1:", msg)
case msg := <-ch2:
    fmt.Println("Received from ch2:", msg)
case ch3 <- "hello":
    fmt.Println("Sent to ch3")
case <-time.After(1 * time.Second):
    fmt.Println("Timeout")
default:
    fmt.Println("No communication ready")
}

// Non-blocking receive
select {
case msg := <-ch:
    fmt.Println(msg)
default:
    fmt.Println("No message available")
}
```

### 4. Common Patterns

#### Worker Pool
```go
func workerPool(numWorkers int, jobs <-chan Job, results chan<- Result) {
    var wg sync.WaitGroup
    for i := 0; i < numWorkers; i++ {
        wg.Add(1)
        go func(id int) {
            defer wg.Done()
            for job := range jobs {
                result := process(job)
                results <- result
            }
        }(i)
    }
    wg.Wait()
    close(results)
}
```

#### Fan-Out/Fan-In
```go
// Fan-out: multiple goroutines reading from same channel
func fanOut(in <-chan int, n int) []<-chan int {
    outs := make([]<-chan int, n)
    for i := 0; i < n; i++ {
        outs[i] = worker(in)
    }
    return outs
}

// Fan-in: merge multiple channels into one
func fanIn(channels ...<-chan int) <-chan int {
    out := make(chan int)
    var wg sync.WaitGroup
    for _, ch := range channels {
        wg.Add(1)
        go func(c <-chan int) {
            defer wg.Done()
            for v := range c {
                out <- v
            }
        }(ch)
    }
    go func() {
        wg.Wait()
        close(out)
    }()
    return out
}
```

#### Pipeline
```go
func generator(nums ...int) <-chan int {
    out := make(chan int)
    go func() {
        for _, n := range nums {
            out <- n
        }
        close(out)
    }()
    return out
}

func square(in <-chan int) <-chan int {
    out := make(chan int)
    go func() {
        for n := range in {
            out <- n * n
        }
        close(out)
    }()
    return out
}

// Usage: pipeline
nums := generator(1, 2, 3, 4)
squares := square(nums)
```

### 5. Sync Package
```go
// Mutex
var mu sync.Mutex
mu.Lock()
// Critical section
mu.Unlock()

// RWMutex
var rwmu sync.RWMutex
rwmu.RLock()  // Multiple readers
rwmu.RUnlock()
rwmu.Lock()   // Exclusive writer
rwmu.Unlock()

// Once
var once sync.Once
once.Do(func() {
    // Runs exactly once
})

// Cond
cond := sync.NewCond(&mu)
cond.Wait()      // Wait for signal
cond.Signal()    // Wake one goroutine
cond.Broadcast() // Wake all goroutines

// Pool
var pool = sync.Pool{
    New: func() interface{} {
        return new(Buffer)
    },
}
buf := pool.Get().(*Buffer)
pool.Put(buf)
```

### 6. Context
```go
// With cancel
ctx, cancel := context.WithCancel(context.Background())
defer cancel()

// With timeout
ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
defer cancel()

// With deadline
deadline := time.Now().Add(10 * time.Second)
ctx, cancel := context.WithDeadline(context.Background(), deadline)

// With value
ctx := context.WithValue(parentCtx, "key", "value")
value := ctx.Value("key").(string)

// Check cancellation
select {
case <-ctx.Done():
    return ctx.Err()
default:
    // Continue work
}
```

## Quick Reference

| Pattern | Use Case | Key Construct |
|---------|----------|---------------|
| Goroutine | Concurrent execution | `go func()` |
| Channel | Communication | `make(chan T)` |
| Select | Multiplex channels | `select { case: }` |
| WaitGroup | Wait for goroutines | `sync.WaitGroup` |
| Mutex | Protect shared state | `sync.Mutex` |
| Context | Cancellation/timeout | `context.Context` |

## Related
- `go-patterns` - Concurrency patterns
- `go-testing` - Testing concurrent code
