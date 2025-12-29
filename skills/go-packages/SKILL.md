---
name: go-packages
description: Go modules and packages - dependency management and project organization
sasmp_version: "1.3.0"
bonded_agent: go-packages
bond_type: PRIMARY_BOND
---

# Go Packages Skill

## Overview

Master Go modules, package organization, and dependency management.

## Core Concepts

### 1. Go Modules
```bash
# Initialize module
go mod init github.com/user/project

# Add dependency
go get github.com/gin-gonic/gin@latest
go get github.com/gin-gonic/gin@v1.9.0

# Update dependencies
go get -u ./...
go get -u github.com/gin-gonic/gin

# Tidy dependencies
go mod tidy

# Vendor dependencies
go mod vendor

# Download dependencies
go mod download
```

### 2. go.mod File
```go
module github.com/user/myproject

go 1.21

require (
    github.com/gin-gonic/gin v1.9.0
    github.com/lib/pq v1.10.9
    golang.org/x/sync v0.3.0
)

require (
    // Indirect dependencies
    github.com/go-playground/validator/v10 v10.14.0 // indirect
)

replace github.com/old/module => github.com/new/module v1.0.0

exclude github.com/bad/module v1.2.3
```

### 3. Package Organization
```
myproject/
├── go.mod
├── go.sum
├── main.go
├── cmd/
│   ├── api/
│   │   └── main.go
│   └── cli/
│       └── main.go
├── internal/
│   ├── config/
│   │   └── config.go
│   ├── handlers/
│   │   └── user.go
│   └── repository/
│       └── user.go
├── pkg/
│   └── utils/
│       └── helpers.go
├── api/
│   └── openapi.yaml
├── web/
│   └── templates/
├── scripts/
│   └── build.sh
└── docs/
    └── README.md
```

### 4. Package Basics
```go
// Package declaration
package mypackage

// Exported (public) - starts with uppercase
func PublicFunction() {}
type PublicType struct{}
var PublicVar int
const PublicConst = 1

// Unexported (private) - starts with lowercase
func privateFunction() {}
type privateType struct{}
var privateVar int

// Import
import (
    "fmt"
    "os"

    // Alias
    myfmt "github.com/user/myfmt"

    // Blank import (for side effects)
    _ "github.com/lib/pq"

    // Dot import (use sparingly)
    . "math"
)
```

### 5. Internal Packages
```
myproject/
├── internal/           # Only importable by myproject
│   └── secret/
│       └── secret.go
├── pkg/               # Importable by anyone
│   └── public/
│       └── public.go
```

```go
// internal/secret/secret.go
package secret

func DoSecret() {} // Only myproject can use this

// pkg/public/public.go
package public

func DoPublic() {} // Anyone can import and use
```

### 6. Build Tags
```go
//go:build linux
// +build linux

package mypackage

// Linux-specific implementation
```

```go
//go:build !windows
// +build !windows

package mypackage

// Non-Windows implementation
```

```bash
# Build with tags
go build -tags "production"
go build -tags "linux,amd64"
```

### 7. Private Modules
```bash
# Set GOPRIVATE
export GOPRIVATE=github.com/mycompany/*

# Configure git
git config --global url."git@github.com:".insteadOf "https://github.com/"

# .netrc for authentication
machine github.com
    login USERNAME
    password TOKEN
```

## Quick Reference

| Command | Description |
|---------|-------------|
| `go mod init` | Initialize module |
| `go mod tidy` | Clean up dependencies |
| `go get -u` | Update dependencies |
| `go mod vendor` | Vendor dependencies |
| `go list -m all` | List all dependencies |

## Related
- `go-tools` - Go toolchain
- `go-fundamentals` agent
