package main

import (
	"fmt"
	"bufio"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

func main() {
	fmt.Print("Enter number of expressions: ")
	reader := bufio.NewReader(os.Stdin)

	line, _ := reader.ReadString('\n')
	nExprsStr := strings.TrimSpace(line)
	numExprs, err := strconv.Atoi(nExprsStr)

	if err != nil {
		fmt.Println("Argument should be a number: ", nExprsStr)
		os.Exit(0)
	}

	args := make([]string, numExprs + 1)
	args[0] = nExprsStr

	for i := 1; i <= numExprs; i = i + 1 {
		line, _ = reader.ReadString('\n')
		arg := strings.TrimSpace(line)
		args[i] = arg
	}

	cmd := exec.Command("python/api.py", args...)
	cmd.Stderr = os.Stderr

	out, err := cmd.Output()

	if err != nil {
		fmt.Println("Error", err)
		os.Exit(0)
	}

	fmt.Print(string(out))
}
