---
name: go-testing
description: Go testing practices - unit tests, benchmarks, mocks, coverage
sasmp_version: "1.3.0"
bonded_agent: 05-go-testing
bond_type: PRIMARY_BOND
---

# Go Testing Skill

Comprehensive testing strategies for Go applications.

## Overview

Master Go testing including table-driven tests, benchmarks, mocking, fuzzing, and achieving high code coverage.

## Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| test_type | string | yes | - | Type: "unit", "integration", "benchmark", "fuzz" |
| coverage_min | int | no | 80 | Minimum coverage percentage |
| mock_lib | string | no | "testify" | Mock library: "testify", "gomock" |

## Core Topics

### Table-Driven Tests
```go
func TestParseURL(t *testing.T) {
    tests := []struct {
        name    string
        input   string
        want    *URL
        wantErr bool
    }{
        {
            name:  "valid http",
            input: "http://example.com/path",
            want:  &URL{Scheme: "http", Host: "example.com", Path: "/path"},
        },
        {
            name:    "empty string",
            input:   "",
            wantErr: true,
        },
        {
            name:    "invalid scheme",
            input:   "ftp://example.com",
            wantErr: true,
        },
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            got, err := ParseURL(tt.input)
            if tt.wantErr {
                require.Error(t, err)
                return
            }
            require.NoError(t, err)
            assert.Equal(t, tt.want, got)
        })
    }
}
```

### Mocking
```go
type MockStore struct {
    mock.Mock
}

func (m *MockStore) Get(ctx context.Context, key string) (string, error) {
    args := m.Called(ctx, key)
    return args.String(0), args.Error(1)
}

func TestService_GetValue(t *testing.T) {
    store := new(MockStore)
    store.On("Get", mock.Anything, "key1").Return("value1", nil)

    svc := NewService(store)
    val, err := svc.GetValue(context.Background(), "key1")

    require.NoError(t, err)
    assert.Equal(t, "value1", val)
    store.AssertExpectations(t)
}
```

### Benchmarks
```go
func BenchmarkSort(b *testing.B) {
    data := generateData(10000)

    b.ResetTimer()
    b.ReportAllocs()

    for i := 0; i < b.N; i++ {
        sorted := make([]int, len(data))
        copy(sorted, data)
        Sort(sorted)
    }
}

func BenchmarkSort_Parallel(b *testing.B) {
    data := generateData(10000)

    b.RunParallel(func(pb *testing.PB) {
        for pb.Next() {
            sorted := make([]int, len(data))
            copy(sorted, data)
            Sort(sorted)
        }
    })
}
```

### Fuzz Testing
```go
func FuzzJSON(f *testing.F) {
    f.Add([]byte(`{"name": "test"}`))
    f.Add([]byte(`{}`))
    f.Add([]byte(`[]`))

    f.Fuzz(func(t *testing.T, data []byte) {
        var v interface{}
        if err := json.Unmarshal(data, &v); err != nil {
            return // invalid input, skip
        }

        // Re-marshal should work
        _, err := json.Marshal(v)
        if err != nil {
            t.Errorf("Marshal failed: %v", err)
        }
    })
}
```

## Test Commands

```bash
# Run all tests
go test ./...

# Verbose with race detection
go test -v -race ./...

# Coverage
go test -coverprofile=coverage.out ./...
go tool cover -html=coverage.out -o coverage.html

# Benchmark
go test -bench=. -benchmem ./...

# Fuzz for 30 seconds
go test -fuzz=FuzzJSON -fuzztime=30s ./...
```

## Troubleshooting

### Failure Modes
| Symptom | Cause | Fix |
|---------|-------|-----|
| Flaky test | Race condition | Add `-race` flag |
| Test timeout | Deadlock | Check goroutines |
| Mock not called | Wrong signature | Verify interface |

## Usage

```
Skill("go-testing")
```
