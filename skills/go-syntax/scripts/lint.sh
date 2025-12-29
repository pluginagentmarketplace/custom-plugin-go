#!/bin/bash
# Go linting script
set -e

echo "Running go fmt..."
go fmt ./...

echo "Running go vet..."
go vet ./...

echo "Running staticcheck..."
if command -v staticcheck &> /dev/null; then
    staticcheck ./...
fi

echo "✅ Lint complete"
