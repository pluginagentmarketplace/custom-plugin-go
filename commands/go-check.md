---
description: Run comprehensive Go code quality checks
allowed-tools: Bash, Read, Grep
exit_codes:
  0: All checks passed
  1: One or more checks failed
  2: Invalid arguments
  64: Tool not installed
---

# /go-check

Run comprehensive quality checks on Go codebase including formatting, linting, testing, and security scanning.

## Usage

```bash
/go-check [path] [options]
```

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `--path` | string | ./... | Path to check |
| `--fix` | bool | false | Auto-fix issues where possible |
| `--skip` | string | - | Skip checks: fmt,vet,lint,test,build |
| `--coverage` | int | 0 | Minimum coverage threshold |
| `--timeout` | string | 5m | Test timeout |

## Input Validation

```go
func validateCheckArgs(args CheckArgs) error {
    if args.Coverage < 0 || args.Coverage > 100 {
        return fmt.Errorf("coverage must be 0-100")
    }

    validSkips := []string{"fmt", "vet", "lint", "test", "build", "security"}
    for _, skip := range strings.Split(args.Skip, ",") {
        if skip != "" && !slices.Contains(validSkips, skip) {
            return fmt.Errorf("invalid skip value: %s", skip)
        }
    }

    return nil
}
```

## Checks Performed

### 1. Format Check (gofmt)
```bash
gofmt -l -d .

# With auto-fix
gofmt -w .
```

### 2. Vet Analysis
```bash
go vet ./...
```

### 3. Lint (golangci-lint)
```bash
golangci-lint run ./...

# With auto-fix
golangci-lint run --fix ./...
```

### 4. Tests with Race Detection
```bash
go test -race -cover -coverprofile=coverage.out ./...
```

### 5. Build Check
```bash
go build -o /dev/null ./...
```

### 6. Security Scan (gosec)
```bash
gosec -quiet ./...
```

### 7. Vulnerability Check
```bash
govulncheck ./...
```

## Examples

```bash
# Full check
/go-check

# Check specific package
/go-check ./internal/handlers

# Auto-fix issues
/go-check --fix

# Skip tests
/go-check --skip test

# Require 80% coverage
/go-check --coverage 80

# Custom timeout
/go-check --timeout 10m
```

## Output

```
Go Quality Check Report
=======================

📁 Path: ./...
🕐 Started: 2024-01-15 10:30:00

┌─────────────┬────────┬─────────────────────────────┐
│ Check       │ Status │ Details                     │
├─────────────┼────────┼─────────────────────────────┤
│ Format      │ ✓ PASS │ All files formatted         │
│ Vet         │ ✓ PASS │ No issues found             │
│ Lint        │ ✓ PASS │ 0 issues                    │
│ Test        │ ✓ PASS │ 42 passed, 0 failed         │
│ Coverage    │ ✓ PASS │ 85.2% (threshold: 80%)      │
│ Build       │ ✓ PASS │ Compiled successfully       │
│ Security    │ ✓ PASS │ No vulnerabilities found    │
│ Vulncheck   │ ✓ PASS │ No known vulnerabilities    │
└─────────────┴────────┴─────────────────────────────┘

Overall: PASS ✓
Duration: 23.4s
```

### Failure Output
```
┌─────────────┬────────┬─────────────────────────────┐
│ Check       │ Status │ Details                     │
├─────────────┼────────┼─────────────────────────────┤
│ Format      │ ✗ FAIL │ 2 files need formatting     │
│ Lint        │ ✗ FAIL │ 3 issues found              │
│ Coverage    │ ✗ FAIL │ 65.2% (threshold: 80%)      │
└─────────────┴────────┴─────────────────────────────┘

Issues:
  internal/handlers/user.go:45: error return value not checked
  internal/models/order.go:23: exported function missing comment
  cmd/api/main.go: needs gofmt

Overall: FAIL ✗
Run with --fix to auto-fix where possible
```

## Required Tools

| Tool | Install Command |
|------|-----------------|
| golangci-lint | `go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest` |
| gosec | `go install github.com/securego/gosec/v2/cmd/gosec@latest` |
| govulncheck | `go install golang.org/x/vuln/cmd/govulncheck@latest` |

## Troubleshooting

| Error | Cause | Fix |
|-------|-------|-----|
| `golangci-lint not found` | Not installed | Install golangci-lint |
| `coverage below threshold` | Insufficient tests | Add more test cases |
| `test timeout` | Slow tests | Increase --timeout |

## Related
- `go-testing` skill
- `go-build` command
