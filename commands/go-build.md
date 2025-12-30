---
description: Build Go project with cross-compilation and optimization
allowed-tools: Bash, Read
exit_codes:
  0: Build successful
  1: Build failed - compilation error
  2: Invalid arguments
  64: Configuration error
---

# /go-build

Build Go project for multiple platforms with production optimizations.

## Usage

```bash
/go-build [options]
```

## Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `--platform` | string | current | Target: linux, darwin, windows, all |
| `--arch` | string | current | Architecture: amd64, arm64, all |
| `--output` | string | ./bin | Output directory |
| `--release` | bool | false | Production build with optimizations |
| `--version` | string | dev | Version string to embed |

## Input Validation

```go
func validateBuildArgs(args BuildArgs) error {
    validPlatforms := []string{"linux", "darwin", "windows", "all"}
    if !slices.Contains(validPlatforms, args.Platform) {
        return fmt.Errorf("invalid platform: %s", args.Platform)
    }

    validArch := []string{"amd64", "arm64", "all"}
    if !slices.Contains(validArch, args.Arch) {
        return fmt.Errorf("invalid arch: %s", args.Arch)
    }

    return nil
}
```

## Build Configurations

### Development Build
```bash
go build -o bin/app ./cmd/api
```

### Production Build
```bash
CGO_ENABLED=0 go build \
    -ldflags="-s -w -X main.version=${VERSION}" \
    -trimpath \
    -o bin/app ./cmd/api
```

### Cross-Compilation Matrix
```bash
# Linux AMD64
GOOS=linux GOARCH=amd64 go build -o bin/app-linux-amd64

# Linux ARM64
GOOS=linux GOARCH=arm64 go build -o bin/app-linux-arm64

# macOS AMD64
GOOS=darwin GOARCH=amd64 go build -o bin/app-darwin-amd64

# macOS ARM64 (Apple Silicon)
GOOS=darwin GOARCH=arm64 go build -o bin/app-darwin-arm64

# Windows AMD64
GOOS=windows GOARCH=amd64 go build -o bin/app-windows-amd64.exe
```

## Build Flags Reference

| Flag | Description |
|------|-------------|
| `-s` | Omit symbol table |
| `-w` | Omit DWARF debug info |
| `-X` | Set variable at build time |
| `-trimpath` | Remove file paths from binary |

## Examples

```bash
# Simple build
/go-build

# Production Linux build
/go-build --platform linux --arch amd64 --release

# All platforms
/go-build --platform all --arch all --release --version 1.0.0

# Custom output
/go-build --output ./dist --release
```

## Output

```
Building for: linux/amd64
Version: 1.0.0
Output: bin/app-linux-amd64
Size: 8.2 MB (stripped)
Build time: 2.3s
✓ Build successful
```

## Troubleshooting

| Error | Cause | Fix |
|-------|-------|-----|
| `package not found` | Missing dependency | Run `go mod tidy` |
| `CGO required` | C bindings needed | Set CGO_ENABLED=1 |
| `cross-compile fail` | Missing toolchain | Install cross-compiler |

## Related
- `go-check` command
- `go-docker` skill
