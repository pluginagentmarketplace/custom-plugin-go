---
description: Debug Go code with Delve
allowed-tools: Bash, Read, Grep
---

# Go Debug Command

Debug Go applications using Delve debugger.

## Usage
```
/go-debug [mode] [options]
```

## Modes
- `run` - Debug current package
- `test` - Debug tests
- `attach` - Attach to process

## Common Debugging Tasks

### Start Debug Session
```bash
dlv debug ./cmd/api
```

### Debug Tests
```bash
dlv test ./internal/handlers
```

### Debug Specific Test
```bash
dlv test -- -test.run TestHandler
```

### Attach to Process
```bash
dlv attach <PID>
```

## Delve Commands
```
(dlv) break main.main      # Set breakpoint
(dlv) break handler.go:42  # Breakpoint at line
(dlv) continue             # Continue execution
(dlv) next                 # Step over
(dlv) step                 # Step into
(dlv) print variable       # Print variable
(dlv) locals               # Show local variables
(dlv) args                 # Show function args
(dlv) stack                # Show call stack
(dlv) goroutines           # List goroutines
(dlv) quit                 # Exit debugger
```

## Remote Debugging
```bash
# Server
dlv debug --headless --listen=:2345 --api-version=2

# Connect
dlv connect localhost:2345
```

## Related
- `go-tools` skill
- `go-testing` skill
