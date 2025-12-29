# Go Testing Guide

## Test Naming
- `Test<FunctionName>` for unit tests
- `Benchmark<Name>` for benchmarks
- `Example<Name>` for examples

## Commands
```bash
go test -v            # Verbose
go test -run Name     # Specific test
go test -cover        # Coverage
go test -race         # Race detection
go test -bench=.      # Benchmarks
```
