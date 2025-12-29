#!/bin/bash
set -e
echo "Tidying dependencies..."
go mod tidy
go mod verify
echo "✅ Modules verified"
