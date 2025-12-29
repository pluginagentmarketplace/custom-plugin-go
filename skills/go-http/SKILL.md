---
name: go-http
description: Go HTTP development - servers, clients, middleware, and REST APIs
sasmp_version: "1.3.0"
bonded_agent: go-web
bond_type: PRIMARY_BOND
---

# Go HTTP Skill

## Overview

Master HTTP development in Go - build servers, clients, middleware, and REST APIs.

## Core Concepts

### 1. HTTP Server Basics
```go
package main

import (
    "fmt"
    "net/http"
)

func main() {
    // Handler function
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, World!")
    })

    // Handler type
    http.Handle("/api", &MyHandler{})

    // Start server
    http.ListenAndServe(":8080", nil)
}

// Custom handler
type MyHandler struct{}

func (h *MyHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte("Custom handler"))
}
```

### 2. Request Handling
```go
func handler(w http.ResponseWriter, r *http.Request) {
    // Method
    method := r.Method // GET, POST, etc.

    // URL and path
    path := r.URL.Path
    query := r.URL.Query()
    id := query.Get("id")

    // Headers
    auth := r.Header.Get("Authorization")
    contentType := r.Header.Get("Content-Type")

    // Body
    body, err := io.ReadAll(r.Body)
    defer r.Body.Close()

    // Form data
    r.ParseForm()
    name := r.FormValue("name")

    // Multipart form
    r.ParseMultipartForm(10 << 20) // 10 MB
    file, header, err := r.FormFile("upload")

    // Context
    ctx := r.Context()

    // Response
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(http.StatusOK)
    w.Write([]byte(`{"status": "ok"}`))
}
```

### 3. Router with ServeMux
```go
func main() {
    mux := http.NewServeMux()

    // Go 1.22+ pattern matching
    mux.HandleFunc("GET /users", listUsers)
    mux.HandleFunc("GET /users/{id}", getUser)
    mux.HandleFunc("POST /users", createUser)
    mux.HandleFunc("PUT /users/{id}", updateUser)
    mux.HandleFunc("DELETE /users/{id}", deleteUser)

    http.ListenAndServe(":8080", mux)
}

func getUser(w http.ResponseWriter, r *http.Request) {
    id := r.PathValue("id") // Go 1.22+
    // ...
}
```

### 4. Middleware
```go
// Middleware function
func loggingMiddleware(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        start := time.Now()
        next.ServeHTTP(w, r)
        log.Printf("%s %s %v", r.Method, r.URL.Path, time.Since(start))
    })
}

// Auth middleware
func authMiddleware(next http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        token := r.Header.Get("Authorization")
        if token == "" {
            http.Error(w, "Unauthorized", http.StatusUnauthorized)
            return
        }
        // Validate token...
        next.ServeHTTP(w, r)
    })
}

// Chain middleware
handler := loggingMiddleware(authMiddleware(myHandler))
```

### 5. JSON API
```go
type User struct {
    ID    int    `json:"id"`
    Name  string `json:"name"`
    Email string `json:"email"`
}

func createUser(w http.ResponseWriter, r *http.Request) {
    var user User

    // Decode request
    if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }

    // Process...

    // Encode response
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(http.StatusCreated)
    json.NewEncoder(w).Encode(user)
}

// Error response
type ErrorResponse struct {
    Error   string `json:"error"`
    Code    int    `json:"code"`
    Message string `json:"message"`
}

func sendError(w http.ResponseWriter, code int, message string) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(code)
    json.NewEncoder(w).Encode(ErrorResponse{
        Error:   http.StatusText(code),
        Code:    code,
        Message: message,
    })
}
```

### 6. HTTP Client
```go
// Simple client
resp, err := http.Get("https://api.example.com/users")
defer resp.Body.Close()

// Custom client
client := &http.Client{
    Timeout: 10 * time.Second,
    Transport: &http.Transport{
        MaxIdleConns:        100,
        MaxIdleConnsPerHost: 10,
        IdleConnTimeout:     90 * time.Second,
    },
}

// Custom request
req, err := http.NewRequestWithContext(ctx, "POST", url, bytes.NewBuffer(data))
req.Header.Set("Content-Type", "application/json")
req.Header.Set("Authorization", "Bearer "+token)

resp, err := client.Do(req)
```

### 7. Graceful Shutdown
```go
func main() {
    server := &http.Server{
        Addr:         ":8080",
        Handler:      router,
        ReadTimeout:  15 * time.Second,
        WriteTimeout: 15 * time.Second,
        IdleTimeout:  60 * time.Second,
    }

    // Start server
    go func() {
        if err := server.ListenAndServe(); err != http.ErrServerClosed {
            log.Fatal(err)
        }
    }()

    // Wait for interrupt
    quit := make(chan os.Signal, 1)
    signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
    <-quit

    // Graceful shutdown
    ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
    defer cancel()
    server.Shutdown(ctx)
}
```

## Quick Reference

| Status Code | Constant | Use Case |
|-------------|----------|----------|
| 200 | `StatusOK` | Success |
| 201 | `StatusCreated` | Resource created |
| 400 | `StatusBadRequest` | Invalid request |
| 401 | `StatusUnauthorized` | Authentication required |
| 404 | `StatusNotFound` | Resource not found |
| 500 | `StatusInternalServerError` | Server error |

## Related
- `go-gin` - Gin framework
- `go-grpc` - gRPC services
