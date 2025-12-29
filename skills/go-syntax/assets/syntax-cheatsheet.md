# Go Syntax Cheatsheet

## Variables
```go
var x int = 10      // Explicit
x := 10             // Short declaration
const Pi = 3.14     // Constant
```

## Control Flow
```go
if x > 0 { }
for i := 0; i < 10; i++ { }
for range slice { }
switch x { case 1: }
```

## Functions
```go
func name(a int) int { return a }
func name() (int, error) { }
defer cleanup()
```
