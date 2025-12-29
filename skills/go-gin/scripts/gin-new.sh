#!/bin/bash
set -e
PROJECT=${1:-myapi}
mkdir -p $PROJECT && cd $PROJECT
go mod init github.com/user/$PROJECT
go get github.com/gin-gonic/gin
echo "✅ Gin project created: $PROJECT"
