#!/bin/bash
PATTERN=${1:-factory}
echo "Creating $PATTERN pattern scaffold..."
mkdir -p patterns/$PATTERN
touch patterns/$PATTERN/{main.go,${PATTERN}.go,${PATTERN}_test.go}
echo "✅ Pattern scaffold created"
