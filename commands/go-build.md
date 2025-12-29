---
description: Build Go project for multiple platforms
allowed-tools: Bash, Read
---

# Go Build Command

Build Go project with optimization and cross-compilation support.

## Usage
```
/go-build [options]
```

## Options
- `--platform` - Target platform (linux, darwin, windows, all)
- `--arch` - Architecture (amd64, arm64, all)
- `--output` - Output directory
- `--release` - Production build with optimizations

## Build Configurations

### Development Build
```bash
go build -o bin/app ./cmd/api
```

### Production Build
```bash
CGO_ENABLED=0 go build -ldflags="-s -w" -o bin/app ./cmd/api
```

### Cross-Compilation
```bash
# Linux AMD64
GOOS=linux GOARCH=amd64 go build -o bin/app-linux-amd64

# macOS ARM64
GOOS=darwin GOARCH=arm64 go build -o bin/app-darwin-arm64

# Windows AMD64
GOOS=windows GOARCH=amd64 go build -o bin/app-windows-amd64.exe
```

## Build Flags
- `-s` - Omit symbol table
- `-w` - Omit DWARF
- `-X` - Set variables at build time

```bash
go build -ldflags="-X main.version=1.0.0 -X main.buildTime=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
```

## Output
```
Building for: linux/amd64
Output: bin/app-linux-amd64
Size: 8.2 MB (stripped)
✅ Build successful
```

## Related
- `go-tools` skill
