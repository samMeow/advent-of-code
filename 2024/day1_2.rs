use std::io::{self, BufReader};
use std::io::prelude::*;
use std::collections::HashMap;

fn sol(arr1: Vec<i32>, arr2: Vec<i32>) -> i32 {
    let mut occur_map: HashMap<i32, i32> = HashMap::new();
    for x in arr2 {
      *occur_map.entry(x).or_default() += 1;
    }
    let sum = arr1.into_iter().fold(0, |accu, a| accu + a * occur_map.get(&a).unwrap_or(&0));
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
    let line1: Vec<i32> = ops.iter().map(|op| op[0].parse::<i32>().unwrap()).collect();
    let line2: Vec<i32> = ops.iter().map(|op| op[1].parse::<i32>().unwrap()).collect();

    let accu = sol(line1, line2);
    println!("{}", accu);
    Ok(())
}