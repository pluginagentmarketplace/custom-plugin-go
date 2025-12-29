#!/bin/bash
echo "Starting simple HTTP server..."
go run -e 'package main; import "net/http"; func main() { http.ListenAndServe(":8080", nil) }'
