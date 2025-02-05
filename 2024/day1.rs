use std::io::{self, BufReader};
use std::io::prelude::*;
use std::collections::HashSet;

fn sol(arr1: Vec<i32>, arr2: Vec<i32>) -> i32 {
    let sum = arr1.iter().zip(arr2.iter()).fold(0, |accu, (c, d)| accu + (c - d).abs());
    return sum
}

fn main() -> io::Result<()> {
    let mut buffer: Vec<String> = Vec::new();
    let stdin = io::stdin();
    let f = BufReader::new(stdin);
    for line in f.lines() {
        buffer.push(line.unwrap())
    }
    let ops: Vec<Vec<&str>> = buffer
        .iter()
        .map(|s| s.split_whitespace().collect())
        .collect::<Vec<_>>();
    let mut line1: Vec<i32> = ops.iter().map(|op| op[0].parse::<i32>().unwrap()).collect();
    let mut line2: Vec<i32> = ops.iter().map(|op| op[1].parse::<i32>().unwrap()).collect();
    line1.sort();
    line2.sort();

    let accu = sol(line1, line2);
    println!("{}", accu);
    Ok(())
}