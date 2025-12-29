---
name: go-gin
description: Gin web framework - routing, middleware, validation, and REST APIs
sasmp_version: "1.3.0"
bonded_agent: go-web
bond_type: SECONDARY_BOND
---

# Go Gin Framework Skill

## Overview

Master Gin - the high-performance HTTP web framework for building REST APIs in Go.

## Core Concepts

### 1. Getting Started
```go
package main

import "github.com/gin-gonic/gin"

func main() {
    // Create router
    r := gin.Default() // Logger + Recovery middleware

    // Routes
    r.GET("/ping", func(c *gin.Context) {
        c.JSON(200, gin.H{"message": "pong"})
    })

    r.Run(":8080") // Listen on 0.0.0.0:8080
}
```

### 2. Routing
```go
// HTTP methods
r.GET("/users", getUsers)
r.POST("/users", createUser)
r.PUT("/users/:id", updateUser)
r.DELETE("/users/:id", deleteUser)
r.PATCH("/users/:id", patchUser)

// Path parameters
r.GET("/users/:id", func(c *gin.Context) {
    id := c.Param("id")
    c.JSON(200, gin.H{"id": id})
})

// Query parameters
r.GET("/search", func(c *gin.Context) {
    query := c.Query("q")              // Returns "" if not exists
    page := c.DefaultQuery("page", "1") // With default
    c.JSON(200, gin.H{"query": query, "page": page})
})

// Route groups
api := r.Group("/api")
{
    v1 := api.Group("/v1")
    {
        v1.GET("/users", getUsers)
        v1.POST("/users", createUser)
    }
}

// Any method
r.Any("/any", handler)

// No route (404)
r.NoRoute(func(c *gin.Context) {
    c.JSON(404, gin.H{"error": "Not found"})
})
```

### 3. Request Binding
```go
type CreateUserRequest struct {
    Name     string `json:"name" binding:"required,min=2,max=100"`
    Email    string `json:"email" binding:"required,email"`
    Age      int    `json:"age" binding:"required,gte=18,lte=120"`
    Password string `json:"password" binding:"required,min=8"`
}

func createUser(c *gin.Context) {
    var req CreateUserRequest

    // Bind JSON
    if err := c.ShouldBindJSON(&req); err != nil {
        c.JSON(400, gin.H{"error": err.Error()})
        return
    }

    // Bind query params
    // c.ShouldBindQuery(&req)

    // Bind form
    // c.ShouldBind(&req)

    // Bind URI (path params)
    // c.ShouldBindUri(&req)

    c.JSON(201, gin.H{"user": req})
}
```

### 4. Response Types
```go
// JSON
c.JSON(200, gin.H{"message": "success"})
c.JSON(200, user)  // Struct to JSON

// IndentedJSON (pretty)
c.IndentedJSON(200, data)

// XML
c.XML(200, data)

// YAML
c.YAML(200, data)

// String
c.String(200, "Hello %s", name)

// HTML
c.HTML(200, "index.html", gin.H{"title": "Home"})

// File
c.File("./files/report.pdf")
c.FileAttachment("./files/report.pdf", "report.pdf")

// Redirect
c.Redirect(301, "/new-url")
```

### 5. Middleware
```go
// Global middleware
r.Use(gin.Logger())
r.Use(gin.Recovery())
r.Use(CORSMiddleware())

// Custom middleware
func AuthMiddleware() gin.HandlerFunc {
    return func(c *gin.Context) {
        token := c.GetHeader("Authorization")
        if token == "" {
            c.AbortWithStatusJSON(401, gin.H{"error": "Unauthorized"})
            return
        }

        // Validate token...
        userID := validateToken(token)

        // Set value for handlers
        c.Set("userID", userID)

        c.Next() // Continue to handler
    }
}

// Use middleware
protected := r.Group("/api")
protected.Use(AuthMiddleware())
{
    protected.GET("/profile", getProfile)
}

// Get value in handler
func getProfile(c *gin.Context) {
    userID, _ := c.Get("userID")
    // ...
}

// CORS middleware
func CORSMiddleware() gin.HandlerFunc {
    return func(c *gin.Context) {
        c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
        c.Writer.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
        c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")

        if c.Request.Method == "OPTIONS" {
            c.AbortWithStatus(204)
            return
        }

        c.Next()
    }
}
```

### 6. Error Handling
```go
type APIError struct {
    Code    int    `json:"code"`
    Message string `json:"message"`
}

func ErrorHandler() gin.HandlerFunc {
    return func(c *gin.Context) {
        c.Next()

        // Check for errors
        if len(c.Errors) > 0 {
            err := c.Errors.Last()
            c.JSON(500, APIError{
                Code:    500,
                Message: err.Error(),
            })
        }
    }
}

// In handler
func handler(c *gin.Context) {
    if err := doSomething(); err != nil {
        c.Error(err)
        c.AbortWithStatusJSON(500, gin.H{"error": err.Error()})
        return
    }
}
```

### 7. File Upload
```go
func uploadFile(c *gin.Context) {
    // Single file
    file, err := c.FormFile("file")
    if err != nil {
        c.JSON(400, gin.H{"error": err.Error()})
        return
    }

    // Save file
    dst := "./uploads/" + file.Filename
    c.SaveUploadedFile(file, dst)

    c.JSON(200, gin.H{"filename": file.Filename})
}

// Multiple files
func uploadFiles(c *gin.Context) {
    form, _ := c.MultipartForm()
    files := form.File["files"]

    for _, file := range files {
        c.SaveUploadedFile(file, "./uploads/"+file.Filename)
    }

    c.JSON(200, gin.H{"count": len(files)})
}
```

### 8. Graceful Shutdown
```go
func main() {
    r := gin.Default()
    setupRoutes(r)

    srv := &http.Server{
        Addr:    ":8080",
        Handler: r,
    }

    go func() {
        if err := srv.ListenAndServe(); err != http.ErrServerClosed {
            log.Fatal(err)
        }
    }()

    // Wait for interrupt
    quit := make(chan os.Signal, 1)
    signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
    <-quit

    ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
    defer cancel()
    srv.Shutdown(ctx)
}
```

## Quick Reference

| Feature | Code |
|---------|------|
| Get param | `c.Param("id")` |
| Get query | `c.Query("q")` |
| Get header | `c.GetHeader("Authorization")` |
| Bind JSON | `c.ShouldBindJSON(&req)` |
| JSON response | `c.JSON(200, data)` |
| Set value | `c.Set("key", value)` |
| Get value | `c.Get("key")` |
| Abort | `c.AbortWithStatus(401)` |

## Related
- `go-http` - Standard library HTTP
- `go-grpc` - gRPC services
