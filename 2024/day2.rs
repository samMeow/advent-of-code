use std::io::{self, BufReader};
use std::io::prelude::*;

fn valid(line: Vec<i32>) -> i32 {
  if line.len() == 1 { return 1; }
  if line[0] == line[1] { return 0; }
  let upper = if line[0] > line[1] { -1 } else { 3 };
  let lower = if line[0] > line[1] { -3 } else { 1 };
  for x in 1..line.len() {
    let diff = line[x] - line[x-1];
    if diff < lower || diff > upper {
      return 0;
    }
  }
  return 1;
}

fn sol(problem: Vec<Vec<i32>>) -> i32 {
    return problem.into_iter().fold(0, |accu, line| accu + valid(line))
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
    let problem: Vec<Vec<i32>> = ops.iter().map(|line| line.iter().map(|x| x.parse::<i32>().unwrap()).collect()).collect();

    let accu = sol(problem);
    println!("{}", accu);
    Ok(())
}