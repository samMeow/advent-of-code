package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
)

func main() {
	numbers := []int{}
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		number, _ := strconv.Atoi(scanner.Text())
		numbers = append(numbers, number)
	}
	sort.Ints(numbers)

	for i, v := range numbers {
		for _, v2 := range numbers[i+1:] {
			if v+v2 == 2020 {
				fmt.Println(v * v2)
				return
			} else if v+v2 > 2020 {
				break
			}
		}
	}
	return
}
