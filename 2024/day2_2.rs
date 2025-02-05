use std::io::{self, BufReader};
use std::io::prelude::*;

fn valid(line: Vec<i32>) -> i32 {
  if line.len() == 1 { return 1; }
  let mut trend = 0;
  for x in 1..line.len() {
    let diff = line[x] - line[x-1];
    if diff == 0 { continue }
    trend += diff / diff.abs();
  }
  let upper = if trend < 0 { -1 } else { 3 };
  let lower = if trend < 0 { -3 } else { 1 };

  let mut temp = 1;
  for x in 2..line.len() {
    let diff = line[x] - line[x-1];
    if diff < lower || diff > upper {
      temp = 0;
      break;
    }
  }
  if temp == 1 { return 1 }
  let mut last = line[0];
  let mut tol = 0;
  for x in 1..line.len() {
    let diff = line[x] - last;
    last = line[x];
    if diff < lower || diff > upper {
      tol += 1;
      last = line[x-1];
    }
    if tol > 1 {
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