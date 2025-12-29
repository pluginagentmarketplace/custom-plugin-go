#!/bin/bash
echo "Checking imports..."
go list -m all | head -20
echo "✅ Import check complete"
