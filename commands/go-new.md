---
description: Create new Go project with best practices structure
allowed-tools: Bash, Write, Read
exit_codes:
  0: Project created successfully
  1: Creation failed
  2: Invalid arguments
  64: Directory already exists
---

# /go-new

Create a new Go project with modern structure and best practices.

## Usage

```bash
/go-new <project-name> [template] [options]
```

## Templates

| Template | Description |
|----------|-------------|
| `basic` | Minimal Go project (default) |
| `api` | REST API with Gin |
| `cli` | CLI with Cobra |
| `lib` | Library package |
| `grpc` | gRPC service |

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `--module` | string | auto | Go module path |
| `--docker` | bool | true | Include Dockerfile |
| `--ci` | string | github | CI: github, gitlab, none |
| `--license` | string | MIT | License type |

## Input Validation

```go
func validateNewArgs(args NewArgs) error {
    if args.ProjectName == "" {
        return fmt.Errorf("project name is required")
    }

    if !regexp.MustCompile(`^[a-z][a-z0-9-]*$`).MatchString(args.ProjectName) {
        return fmt.Errorf("invalid project name: use lowercase letters, numbers, hyphens")
    }

    if _, err := os.Stat(args.ProjectName); !os.IsNotExist(err) {
        return fmt.Errorf("directory already exists: %s", args.ProjectName)
    }

    return nil
}
```

## Project Structures

### API Template
```
project-name/
├── cmd/
│   └── api/
│       └── main.go
├── internal/
│   ├── config/
│   │   └── config.go
│   ├── handlers/
│   │   └── handlers.go
│   ├── middleware/
│   │   └── middleware.go
│   ├── models/
│   │   └── models.go
│   └── repository/
│       └── repository.go
├── pkg/
│   └── .gitkeep
├── api/
│   └── openapi.yaml
├── migrations/
│   └── .gitkeep
├── go.mod
├── go.sum
├── Makefile
├── Dockerfile
├── .github/
│   └── workflows/
│       └── ci.yml
├── .gitignore
└── README.md
```

### CLI Template
```
project-name/
├── cmd/
│   ├── root.go
│   └── version.go
├── internal/
│   └── .gitkeep
├── main.go
├── go.mod
├── Makefile
├── .goreleaser.yaml
├── .gitignore
└── README.md
```

### Library Template
```
project-name/
├── pkg_name.go
├── pkg_name_test.go
├── examples/
│   └── basic/
│       └── main.go
├── go.mod
├── .gitignore
└── README.md
```

## Execution Steps

1. Validate project name and options
2. Create directory structure
3. Initialize go.mod
4. Create main.go / entry point
5. Add Makefile with common targets
6. Add Dockerfile (if --docker)
7. Add CI config (if --ci)
8. Add .gitignore
9. Create README.md
10. Run go mod tidy

## Examples

```bash
# Basic project
/go-new myapp

# REST API
/go-new myapi api --module github.com/myorg/myapi

# CLI tool
/go-new mycli cli --ci github

# Library
/go-new mylib lib --license Apache-2.0

# No Docker/CI
/go-new simple basic --docker=false --ci=none
```

## Output

```
Creating project: myapi
Template: api
Module: github.com/myorg/myapi

✓ Created directory structure
✓ Initialized go.mod
✓ Created main.go
✓ Added Makefile
✓ Added Dockerfile
✓ Added .github/workflows/ci.yml
✓ Created .gitignore
✓ Created README.md
✓ Ran go mod tidy

Project created successfully!

Next steps:
  cd myapi
  make run
```

## Troubleshooting

| Error | Cause | Fix |
|-------|-------|-----|
| `directory exists` | Name conflict | Choose different name |
| `invalid module` | Bad module path | Use valid Go module path |
| `go mod failed` | Network issue | Check internet connection |

## Related
- `go-fundamentals` skill
- `go-modules` skill
