#!/bin/bash
# Race condition detector
set -e
echo "Running race detector..."
go test -race ./...
echo "✅ No races detected"
