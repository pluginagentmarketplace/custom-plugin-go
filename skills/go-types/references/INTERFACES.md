# Go Interfaces Guide

## Implicit Implementation
- No "implements" keyword
- Type satisfies interface by implementing methods
- Small interfaces preferred (1-3 methods)

## Common Interfaces
```go
io.Reader     // Read([]byte) (int, error)
io.Writer     // Write([]byte) (int, error)
fmt.Stringer  // String() string
error         // Error() string
```

## Interface Composition
```go
type ReadWriter interface {
    Reader
    Writer
}
```
