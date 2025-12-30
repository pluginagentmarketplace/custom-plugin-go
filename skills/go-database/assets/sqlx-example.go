package main

import (
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

type User struct {
	ID    int    `db:"id"`
	Name  string `db:"name"`
	Email string `db:"email"`
}

func main() {
	db := sqlx.MustConnect("postgres", "postgres://localhost/mydb")
	var users []User
	db.Select(&users, "SELECT * FROM users")
}
