---
name: go-stdlib
description: Go standard library - fmt, io, os, strings, time, encoding
sasmp_version: "1.3.0"
bonded_agent: go-fundamentals
bond_type: SECONDARY_BOND
---

# Go Standard Library Skill

## Overview

Master Go's rich standard library - essential packages for everyday programming.

## Core Packages

### 1. fmt - Formatted I/O
```go
import "fmt"

// Print
fmt.Print("Hello")           // No newline
fmt.Println("Hello")         // With newline
fmt.Printf("Name: %s\n", n)  // Formatted

// Format verbs
%v   // Default format
%+v  // Struct with field names
%#v  // Go syntax representation
%T   // Type
%d   // Integer
%f   // Float (%.2f for 2 decimals)
%s   // String
%q   // Quoted string
%p   // Pointer
%t   // Boolean

// Sprint - return string
str := fmt.Sprintf("Value: %d", 42)

// Fprint - write to io.Writer
fmt.Fprintf(os.Stdout, "Output: %s\n", msg)

// Scan - read input
var name string
fmt.Scan(&name)
fmt.Scanf("%s %d", &name, &age)
```

### 2. io - I/O Primitives
```go
import "io"

// Reader interface
type Reader interface {
    Read(p []byte) (n int, err error)
}

// Writer interface
type Writer interface {
    Write(p []byte) (n int, err error)
}

// Copy
io.Copy(dst, src)
io.CopyN(dst, src, 1024) // Copy n bytes

// ReadAll
data, err := io.ReadAll(reader)

// MultiReader/MultiWriter
r := io.MultiReader(r1, r2, r3)
w := io.MultiWriter(w1, w2)

// TeeReader - read and copy
tee := io.TeeReader(src, dst)

// Pipe
pr, pw := io.Pipe()
```

### 3. os - Operating System
```go
import "os"

// File operations
file, err := os.Open("file.txt")       // Read only
file, err := os.Create("file.txt")     // Create/truncate
file, err := os.OpenFile("f.txt", os.O_RDWR|os.O_CREATE, 0755)
defer file.Close()

// Read/Write
data, err := os.ReadFile("file.txt")
err := os.WriteFile("file.txt", data, 0644)

// Directory
os.Mkdir("dir", 0755)
os.MkdirAll("path/to/dir", 0755)
os.Remove("file.txt")
os.RemoveAll("dir")
entries, _ := os.ReadDir(".")

// Environment
os.Getenv("HOME")
os.Setenv("KEY", "value")
os.LookupEnv("KEY") // Returns (value, ok)
os.Environ()        // All env vars

// Process
os.Getpid()
os.Exit(1)
os.Args  // Command-line args
```

### 4. strings - String Operations
```go
import "strings"

// Search
strings.Contains("hello", "ll")    // true
strings.HasPrefix("hello", "he")   // true
strings.HasSuffix("hello", "lo")   // true
strings.Index("hello", "l")        // 2
strings.Count("hello", "l")        // 2

// Transform
strings.ToUpper("hello")           // HELLO
strings.ToLower("HELLO")           // hello
strings.Title("hello world")       // Hello World
strings.TrimSpace("  hello  ")     // hello
strings.Trim("!!hello!!", "!")     // hello
strings.Replace("hello", "l", "L", -1)

// Split/Join
strings.Split("a,b,c", ",")        // []string{"a","b","c"}
strings.Join([]string{"a","b"}, "-") // "a-b"
strings.Fields("a b c")            // []string{"a","b","c"}

// Builder (efficient concatenation)
var sb strings.Builder
sb.WriteString("Hello")
sb.WriteString(" World")
result := sb.String()
```

### 5. time - Time and Duration
```go
import "time"

// Current time
now := time.Now()
now.Year(), now.Month(), now.Day()
now.Hour(), now.Minute(), now.Second()

// Parse/Format
t, _ := time.Parse("2006-01-02", "2024-01-15")
s := t.Format("Jan 2, 2006")
s := t.Format(time.RFC3339)

// Layout reference: Mon Jan 2 15:04:05 MST 2006

// Duration
d := 5 * time.Second
d := time.Hour + 30*time.Minute
time.Sleep(d)

// Timer and Ticker
timer := time.NewTimer(5 * time.Second)
<-timer.C // Wait for timer

ticker := time.NewTicker(1 * time.Second)
for t := range ticker.C {
    fmt.Println("Tick at", t)
}
ticker.Stop()

// After and Tick
<-time.After(5 * time.Second)
for range time.Tick(1 * time.Second) {}
```

### 6. encoding/json
```go
import "encoding/json"

type User struct {
    Name  string `json:"name"`
    Email string `json:"email,omitempty"`
    Age   int    `json:"age"`
}

// Marshal
user := User{Name: "John", Age: 30}
data, err := json.Marshal(user)
data, err := json.MarshalIndent(user, "", "  ")

// Unmarshal
var user User
err := json.Unmarshal(data, &user)

// Encoder/Decoder (streaming)
encoder := json.NewEncoder(writer)
encoder.Encode(user)

decoder := json.NewDecoder(reader)
decoder.Decode(&user)

// Raw message (delayed parsing)
var raw json.RawMessage
json.Unmarshal(data, &raw)
```

### 7. net/http
```go
import "net/http"

// Simple GET
resp, err := http.Get("https://api.example.com")
defer resp.Body.Close()
body, _ := io.ReadAll(resp.Body)

// POST
resp, err := http.Post(url, "application/json", bytes.NewBuffer(data))

// Custom request
req, _ := http.NewRequest("GET", url, nil)
req.Header.Set("Authorization", "Bearer token")
client := &http.Client{Timeout: 10 * time.Second}
resp, err := client.Do(req)

// HTTP Server
http.HandleFunc("/", handler)
http.ListenAndServe(":8080", nil)
```

## Quick Reference

| Package | Primary Use |
|---------|-------------|
| `fmt` | Formatted I/O |
| `io` | I/O interfaces |
| `os` | OS functions |
| `strings` | String manipulation |
| `time` | Time operations |
| `encoding/json` | JSON encoding |
| `net/http` | HTTP client/server |

## Related
- `go-http` - Web development deep dive
- `go-testing` - Testing stdlib usage
