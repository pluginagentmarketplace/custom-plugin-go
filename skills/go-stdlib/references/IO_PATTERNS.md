# Go I/O Patterns

## Reader/Writer
```go
io.Copy(dst, src)
io.ReadAll(reader)
io.WriteString(w, "text")
```

## File Operations
```go
os.ReadFile(path)
os.WriteFile(path, data, 0644)
os.Create(path)
```
