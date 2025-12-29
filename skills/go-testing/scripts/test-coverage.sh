#!/bin/bash
set -e
echo "Running tests with coverage..."
go test -coverprofile=coverage.out ./...
go tool cover -func=coverage.out
go tool cover -html=coverage.out -o coverage.html
echo "✅ Coverage report: coverage.html"
