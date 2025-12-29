# Go Channels Guide

## Channel Types
- Unbuffered: `make(chan T)` - synchronous
- Buffered: `make(chan T, n)` - async up to n

## Channel Operations
```go
ch <- v     // Send
v := <-ch   // Receive
close(ch)   // Close (no more sends)
```

## Select Statement
- Non-blocking multi-channel
- Random if multiple ready
- default for non-blocking
