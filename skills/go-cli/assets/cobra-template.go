package main

import (
	"fmt"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "myapp",
	Short: "A CLI application",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("Hello, CLI!")
	},
}

func main() {
	rootCmd.Execute()
}
