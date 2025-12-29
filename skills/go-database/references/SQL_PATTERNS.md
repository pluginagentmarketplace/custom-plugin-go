# SQL Patterns in Go

## Query Patterns
```go
// Single row
db.QueryRow("SELECT...").Scan(&v)

// Multiple rows
rows, _ := db.Query("SELECT...")
defer rows.Close()
for rows.Next() { rows.Scan(&v) }

// Execute
db.Exec("INSERT...", args...)
```

## Transaction
```go
tx, _ := db.Begin()
defer tx.Rollback()
// queries...
tx.Commit()
```
