# Gin Middleware Guide

## Built-in
- `gin.Logger()` - Request logging
- `gin.Recovery()` - Panic recovery

## Custom Middleware
```go
func AuthMiddleware() gin.HandlerFunc {
    return func(c *gin.Context) {
        token := c.GetHeader("Authorization")
        if token == "" {
            c.AbortWithStatus(401)
            return
        }
        c.Next()
    }
}
```
