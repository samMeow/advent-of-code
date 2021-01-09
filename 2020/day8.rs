use std::io::{self, BufReader};
use std::io::prelude::*;
use std::collections::HashSet;

fn sol(ops: Vec<(&str, i32)>) -> (usize, i32) {
    let mut steps: HashSet<usize> = HashSet::new();
    let mut step: usize = 0;
    let mut accu: i32 = 0;
    while !steps.contains(&step) && step < ops.len() {
        steps.insert(step);
        let (cmd, int) = ops[step];
        match cmd {
            "acc" => {
                accu += int;
                step += 1;
            },
            "jmp" => step += int as usize,
            _ => step += 1,
        }
    }
    return (step, accu)
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
    let ops: Vec<(&str, i32)> = ops.iter().map(|op| (op[0], op[1].parse::<i32>().unwrap())).collect();

    let (_, accu) = sol(ops)
    println!("{}", accu)
    Ok(())
}