---
name: go-syntax
description: Go basic syntax, variables, constants, operators, and control flow
sasmp_version: "1.3.0"
bonded_agent: go-fundamentals
bond_type: PRIMARY_BOND
---

# Go Syntax Skill

## Overview

Master Go's clean and simple syntax - variables, constants, operators, and control flow structures.

## Core Concepts

### 1. Variables & Constants
```go
// Variable declaration
var name string = "Gopher"
var age int = 10
var isActive = true // Type inference

// Short declaration
count := 42
message := "Hello"

// Constants
const Pi = 3.14159
const (
    StatusOK    = 200
    StatusError = 500
)

// iota for enums
const (
    Sunday = iota // 0
    Monday        // 1
    Tuesday       // 2
)
```

### 2. Basic Types
```go
// Numeric types
var i int = 42
var f float64 = 3.14
var c complex128 = 1 + 2i

// String
var s string = "Hello, Go!"

// Boolean
var b bool = true

// Zero values
var zeroInt int      // 0
var zeroStr string   // ""
var zeroBool bool    // false
```

### 3. Control Flow
```go
// If-else
if x > 10 {
    fmt.Println("Greater")
} else if x < 10 {
    fmt.Println("Less")
} else {
    fmt.Println("Equal")
}

// If with initialization
if value, err := getData(); err == nil {
    fmt.Println(value)
}

// For loop (only loop in Go)
for i := 0; i < 10; i++ {
    fmt.Println(i)
}

// While-style loop
for count > 0 {
    count--
}

// Infinite loop
for {
    // break to exit
}

// Range
for index, value := range slice {
    fmt.Println(index, value)
}

// Switch
switch day {
case "Monday":
    fmt.Println("Start of week")
case "Friday":
    fmt.Println("End of week")
default:
    fmt.Println("Mid week")
}

// Type switch
switch v := value.(type) {
case int:
    fmt.Println("Integer:", v)
case string:
    fmt.Println("String:", v)
}
```

### 4. Functions
```go
// Basic function
func greet(name string) string {
    return "Hello, " + name
}

// Multiple return values
func divide(a, b float64) (float64, error) {
    if b == 0 {
        return 0, errors.New("division by zero")
    }
    return a / b, nil
}

// Named return values
func getCoordinates() (x, y int) {
    x = 10
    y = 20
    return // naked return
}

// Variadic function
func sum(nums ...int) int {
    total := 0
    for _, n := range nums {
        total += n
    }
    return total
}

// Anonymous function
add := func(a, b int) int {
    return a + b
}

// Defer
func readFile() {
    file := openFile()
    defer file.Close() // Called when function returns
    // ... use file
}
```

## Quick Reference

| Syntax | Description | Example |
|--------|-------------|---------|
| `:=` | Short declaration | `x := 10` |
| `var` | Variable declaration | `var x int` |
| `const` | Constant declaration | `const Pi = 3.14` |
| `for` | Loop (only loop in Go) | `for i := 0; i < 10; i++` |
| `range` | Iterate over collections | `for k, v := range m` |
| `defer` | Deferred execution | `defer file.Close()` |

## Related
- `go-types` - Type system deep dive
- `go-fundamentals` agent - Complete fundamentals

## Assets
- `assets/syntax-cheatsheet.md` - Quick reference guide
- `scripts/lint.sh` - Go linting script
- `references/EFFECTIVE_GO.md` - Effective Go patterns
