#!/bin/bash
# Go type checking
set -e
echo "Running type checks..."
go build -o /dev/null ./...
echo "✅ All types valid"
