# Go Development Assistant Plugin

[![SASMP v1.3.0](https://img.shields.io/badge/SASMP-v1.3.0-blue.svg)](https://github.com/pluginagentmarketplace)
[![Go](https://img.shields.io/badge/Go-1.21+-00ADD8?logo=go)](https://go.dev)

Comprehensive Go (Golang) development plugin with 8 specialized agents and 12 Golden Format skills for mastering Go programming, inspired by [roadmap.sh/golang](https://roadmap.sh/golang).

## 🎯 Overview

This plugin provides complete coverage of Go development, from fundamentals to advanced topics like concurrency, microservices, and design patterns.

## 🤖 Agents (8)

| Agent | Description | Primary Skills |
|-------|-------------|----------------|
| **go-fundamentals** | Master Go basics - syntax, variables, control flow | go-syntax, go-stdlib |
| **go-types** | Deep dive into Go type system | go-types |
| **go-concurrency** | Goroutines, channels, and sync | go-concurrency |
| **go-packages** | Modules and dependency management | go-packages |
| **go-web** | HTTP servers and REST APIs | go-http, go-gin |
| **go-database** | SQL, GORM, and data persistence | go-database |
| **go-testing** | Testing, benchmarks, and coverage | go-testing |
| **go-advanced** | Profiling, patterns, and optimization | go-patterns, go-grpc |

## 🛠️ Skills (12)

### Core Language
- `go-syntax` - Variables, control flow, functions
- `go-types` - Structs, interfaces, pointers, slices, maps
- `go-concurrency` - Goroutines, channels, select, sync

### Ecosystem
- `go-packages` - Modules, dependencies, project structure
- `go-stdlib` - Standard library essentials
- `go-tools` - Build, format, lint, debug

### Web Development
- `go-http` - HTTP servers, clients, middleware
- `go-gin` - Gin framework for REST APIs
- `go-grpc` - gRPC and Protocol Buffers

### Data & Patterns
- `go-database` - SQL, GORM, transactions
- `go-testing` - Unit tests, benchmarks, mocking
- `go-patterns` - Design patterns in Go

## 📋 Commands (4)

| Command | Description |
|---------|-------------|
| `/go-check` | Run comprehensive quality checks |
| `/go-new` | Create new Go project |
| `/go-build` | Build for multiple platforms |
| `/go-debug` | Debug with Delve |

## 🚀 Quick Start

```bash
# Install plugin
claude plugin install go-development-assistant

# Create new project
/go-new myapi api

# Run quality checks
/go-check

# Build for production
/go-build --release --platform linux
```

## 📚 Learning Path

Following [roadmap.sh/golang](https://roadmap.sh/golang):

1. **Fundamentals** → `go-fundamentals` agent
2. **Type System** → `go-types` agent
3. **Concurrency** → `go-concurrency` agent
4. **Web Development** → `go-web` agent
5. **Database** → `go-database` agent
6. **Testing** → `go-testing` agent
7. **Advanced** → `go-advanced` agent

## 🏗️ Project Structure

```
custom-plugin-go/
├── agents/           # 8 specialized agents
├── skills/           # 12 Golden Format skills
│   └── skill-name/
│       ├── SKILL.md
│       ├── assets/
│       ├── scripts/
│       └── references/
├── commands/         # 4 slash commands
├── hooks/           # Event hooks
└── .claude-plugin/  # Plugin manifest
```

## 📖 Related Resources

- [Go Documentation](https://go.dev/doc/)
- [Effective Go](https://go.dev/doc/effective_go)
- [Go by Example](https://gobyexample.com/)
- [roadmap.sh/golang](https://roadmap.sh/golang)

## 📝 License

MIT License - See LICENSE file

## 👥 Authors

- Dr. Umit Kacar & Muhsin Elcicek
- Contact: kacarumit.phd@gmail.com
