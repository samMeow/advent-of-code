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
		for j, v2 := range numbers[i+1:] {
			if v+v2 > 2020 {
				break
			}
			for _, v3 := range numbers[j+1:] {
				if v+v2+v3 > 2020 {
					break
				}
				if v+v2+v3 == 2020 {
					fmt.Println(v * v2 * v3)
					return
				}
			}
		}
	}
	return
}
