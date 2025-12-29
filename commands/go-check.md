---
description: Run comprehensive Go code quality checks (fmt, vet, lint, test)
allowed-tools: Bash, Read, Grep
---

# Go Check Command

Run comprehensive quality checks on Go codebase.

## Usage
```
/go-check [path]
```

## Checks Performed
1. **go fmt** - Code formatting
2. **go vet** - Static analysis
3. **golangci-lint** - Extended linting
4. **go test** - Unit tests
5. **go build** - Compilation check

## Execution Steps

### 1. Format Check
```bash
gofmt -l .
```
If files need formatting, show them.

### 2. Vet Analysis
```bash
go vet ./...
```

### 3. Lint (if available)
```bash
golangci-lint run
```

### 4. Test
```bash
go test -v ./...
```

### 5. Build
```bash
go build -o /dev/null ./...
```

## Output Format
```
✅ Format: OK (or list files needing format)
✅ Vet: No issues
✅ Lint: Passed
✅ Tests: 42 passed, 0 failed
✅ Build: Successful

Overall: PASS ✅
```

## Related
- `go-build` command
- `go-testing` skill
