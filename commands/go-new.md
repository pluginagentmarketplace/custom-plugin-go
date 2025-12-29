---
description: Create new Go project with modern structure
allowed-tools: Bash, Write, Read
---

# Go New Command

Create a new Go project with best practices structure.

## Usage
```
/go-new <project-name> [template]
```

## Templates
- `api` - REST API with Gin
- `cli` - CLI application with Cobra
- `lib` - Library package
- `basic` - Minimal Go project (default)

## Project Structure Created

### API Template
```
project-name/
├── cmd/
│   └── api/
│       └── main.go
├── internal/
│   ├── config/
│   ├── handlers/
│   ├── middleware/
│   ├── models/
│   └── repository/
├── pkg/
├── api/
├── go.mod
├── go.sum
├── Makefile
├── Dockerfile
└── README.md
```

### CLI Template
```
project-name/
├── cmd/
│   └── root.go
├── internal/
├── main.go
├── go.mod
└── README.md
```

## Execution Steps
1. Create directory structure
2. Initialize go.mod
3. Create main.go
4. Add Makefile
5. Add Dockerfile (if api)
6. Create README.md

## Related
- `go-packages` skill
- `go-gin` skill
