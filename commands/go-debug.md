---
description: Debug Go applications with Delve
allowed-tools: Bash, Read, Grep
exit_codes:
  0: Debug session ended normally
  1: Debug error
  2: Invalid arguments
  64: Delve not installed
---

# /go-debug

Debug Go applications using Delve debugger with guided workflows.

## Usage

```bash
/go-debug [mode] [options]
```

## Modes

| Mode | Description |
|------|-------------|
| `run` | Debug current package |
| `test` | Debug tests |
| `attach` | Attach to running process |
| `core` | Analyze core dump |

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `--package` | string | . | Package to debug |
| `--test` | string | - | Specific test to debug |
| `--pid` | int | - | Process ID to attach |
| `--port` | int | 2345 | Debug server port |

## Input Validation

```go
func validateDebugArgs(args DebugArgs) error {
    if args.Mode == "attach" && args.PID == 0 {
        return fmt.Errorf("--pid required for attach mode")
    }

    if args.Mode == "test" && args.Package == "" {
        return fmt.Errorf("--package required for test mode")
    }

    return nil
}
```

## Debug Workflows

### Debug Application
```bash
# Start debug session
dlv debug ./cmd/api

# With arguments
dlv debug ./cmd/api -- --config config.yaml
```

### Debug Tests
```bash
# Debug all tests in package
dlv test ./internal/handlers

# Debug specific test
dlv test ./internal/handlers -- -test.run TestCreateUser
```

### Attach to Process
```bash
# Find process
pgrep -f myapp

# Attach
dlv attach <PID>
```

### Remote Debugging
```bash
# Start headless server
dlv debug --headless --listen=:2345 --api-version=2 ./cmd/api

# Connect from another terminal
dlv connect localhost:2345
```

## Delve Commands

| Command | Description |
|---------|-------------|
| `break main.main` | Set breakpoint at function |
| `break handler.go:42` | Set breakpoint at line |
| `continue` / `c` | Continue execution |
| `next` / `n` | Step over |
| `step` / `s` | Step into |
| `stepout` / `so` | Step out of function |
| `print var` / `p var` | Print variable |
| `locals` | Show local variables |
| `args` | Show function arguments |
| `stack` / `bt` | Show call stack |
| `goroutines` / `grs` | List goroutines |
| `goroutine N` | Switch to goroutine N |
| `restart` / `r` | Restart debugging |
| `quit` / `q` | Exit debugger |

## Examples

```bash
# Debug application
/go-debug run

# Debug specific test
/go-debug test --package ./internal/user --test TestValidation

# Attach to running service
/go-debug attach --pid 12345

# Remote debug setup
/go-debug run --port 2345
```

## Output

```
Delve debugger started
Listening on :2345
Type 'help' for list of commands.

(dlv) break main.main
Breakpoint 1 set at 0x12345 for main.main() ./cmd/api/main.go:15

(dlv) continue
> main.main() ./cmd/api/main.go:15 (hits goroutine(1):1 total:1)
    14: func main() {
=>  15:     cfg := config.Load()
    16:     srv := server.New(cfg)
```

## Troubleshooting

| Error | Cause | Fix |
|-------|-------|-----|
| `dlv not found` | Not installed | `go install github.com/go-delve/delve/cmd/dlv@latest` |
| `could not attach` | Permission denied | Run with sudo or ptrace enabled |
| `optimized out` | Release build | Build with `-gcflags="all=-N -l"` |

## Related
- `go-testing` skill
- `go-build` command
