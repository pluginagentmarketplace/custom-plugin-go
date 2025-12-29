---
name: go-types
description: Go type system - structs, interfaces, pointers, slices, and maps
sasmp_version: "1.3.0"
bonded_agent: go-types
bond_type: PRIMARY_BOND
---

# Go Types Skill

## Overview

Master Go's powerful type system - structs, interfaces, pointers, slices, and maps.

## Core Concepts

### 1. Structs
```go
// Basic struct
type Person struct {
    Name string
    Age  int
}

// Struct with tags
type User struct {
    ID        int    `json:"id" db:"user_id"`
    Username  string `json:"username"`
    Email     string `json:"email,omitempty"`
    CreatedAt time.Time `json:"created_at"`
}

// Embedded structs (composition)
type Employee struct {
    Person    // Embedded - fields promoted
    EmployeeID string
    Department string
}

// Anonymous struct
config := struct {
    Host string
    Port int
}{
    Host: "localhost",
    Port: 8080,
}

// Methods on structs
func (p Person) Greet() string {
    return "Hello, " + p.Name
}

func (p *Person) SetAge(age int) {
    p.Age = age // Modifies original
}
```

### 2. Interfaces
```go
// Interface definition
type Reader interface {
    Read(p []byte) (n int, err error)
}

type Writer interface {
    Write(p []byte) (n int, err error)
}

// Interface composition
type ReadWriter interface {
    Reader
    Writer
}

// Empty interface (any type)
func printAny(v interface{}) {
    fmt.Println(v)
}

// Type assertion
func process(v interface{}) {
    if str, ok := v.(string); ok {
        fmt.Println("String:", str)
    }
}

// Implementing interface (implicit)
type File struct {
    name string
}

func (f File) Read(p []byte) (n int, err error) {
    // Implementation
    return len(p), nil
}
// File now implements Reader
```

### 3. Pointers
```go
// Pointer basics
var x int = 10
var p *int = &x  // p holds address of x

fmt.Println(*p)  // 10 - dereference
*p = 20          // Modify through pointer
fmt.Println(x)   // 20

// Pointer to struct
person := &Person{Name: "John", Age: 30}
person.Name = "Jane"  // Auto-dereference

// new vs &
ptr1 := new(Person)           // Returns *Person, zero value
ptr2 := &Person{Name: "Bob"}  // Returns *Person, initialized

// Nil pointer
var nilPtr *int
if nilPtr == nil {
    fmt.Println("Pointer is nil")
}
```

### 4. Slices
```go
// Slice creation
slice1 := []int{1, 2, 3, 4, 5}
slice2 := make([]int, 5)       // len=5, cap=5
slice3 := make([]int, 0, 10)   // len=0, cap=10

// Slice operations
slice1 = append(slice1, 6)     // Append element
slice1 = append(slice1, 7, 8)  // Append multiple
slice1 = append(slice1, slice2...) // Append slice

// Slicing
sub := slice1[1:4]  // Elements 1, 2, 3
sub2 := slice1[:3]  // First 3 elements
sub3 := slice1[2:]  // From index 2 to end

// Copy
dst := make([]int, len(src))
copy(dst, src)

// Length and capacity
len(slice1)  // Number of elements
cap(slice1)  // Underlying array capacity
```

### 5. Maps
```go
// Map creation
map1 := map[string]int{
    "one": 1,
    "two": 2,
}
map2 := make(map[string]int)

// Map operations
map1["three"] = 3           // Set
value := map1["one"]        // Get (0 if not exists)
value, ok := map1["four"]   // Check existence
delete(map1, "two")         // Delete

// Iterate
for key, value := range map1 {
    fmt.Println(key, value)
}

// Map of slices
groups := map[string][]int{
    "evens": {2, 4, 6},
    "odds":  {1, 3, 5},
}
```

### 6. Type Aliases & Definitions
```go
// Type alias (same underlying type)
type Celsius = float64
type Fahrenheit = float64

// Type definition (new type)
type UserID int
type OrderID int
// UserID and OrderID are distinct types

// Methods on custom types
type StringSlice []string

func (s StringSlice) Join(sep string) string {
    return strings.Join(s, sep)
}
```

## Quick Reference

| Type | Zero Value | Example |
|------|------------|---------|
| `*T` | `nil` | `var p *int` |
| `[]T` | `nil` | `var s []int` |
| `map[K]V` | `nil` | `var m map[string]int` |
| `struct{}` | `{}` | `var s struct{}` |
| `interface{}` | `nil` | `var i interface{}` |

## Related
- `go-syntax` - Basic syntax
- `go-patterns` - Design patterns with types
