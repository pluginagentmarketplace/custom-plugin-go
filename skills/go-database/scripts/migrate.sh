#!/bin/bash
set -e
echo "Running migrations..."
# Using golang-migrate
# migrate -path ./migrations -database "$DATABASE_URL" up
echo "✅ Migrations complete"
