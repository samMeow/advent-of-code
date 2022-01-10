import std/strutils
import std/sequtils
import std/tables


type Bingo = ref object of RootObj
  base: seq[seq[int]]
  size: int
  lookup: Table[int, tuple[a: int,b: int]]
  rows: seq[int]
  cols: seq[int]
  dias: array[2, int]

method mark(this: Bingo, num: int): int {.base.} =
  var output = 0
  if this.lookup.hasKey(num):
    let (a, b) = this.lookup[num]
    this.lookup.del(num)
    var checklist = newSeq[int]()
    this.rows[a] += 1
    checklist.add(this.rows[a])
    this.cols[b] += 1
    checklist.add(this.cols[b])
    #[
    if a == b:
      this.dias[0] += 1
      checklist.add(this.dias)
    if a + b == this.size - 1:
      this.dias[1] += 1
      checklist.add(this.dias)
    ]#
    if checklist.anyIt(it == this.size):
      output = this.lookup.keys.toSeq.foldl(a+b) * num
  output



proc newBingo(base: seq[seq[int]]): Bingo =
  let size = base.len
  var lookup = initTable[int, tuple[a: int,b: int]]()
  for x, row in base:
    for y, v in row:
      lookup[v] = (x, y)
  var rows = newSeq[int](size)
  var cols = newSeq[int](size)
  var dias: array[2, int]
  Bingo(base: base, size: size, lookup: lookup, rows: rows, cols: cols, dias: dias)

func tokenize(buffer: string): (seq[int], seq[seq[seq[int]]]) =
  let token = strutils.split(buffer, "\n\n");
  let prize =  sequtils.map(
    strutils.split(token[0], ','),
    proc(x: string): int = strutils.parseInt(x),
  );
  let bingos = sequtils.map(
    token[1..^1],
    proc(b: string): seq[seq[int]] =
      sequtils.map(
        strutils.split(b, '\n'),
        proc(line: string): seq[int] =
          sequtils.map(
            strutils.split(line, ' ').filterIt(it != ""),
            proc(x: string): int = strutils.parseInt(x),
          )
      )
  );
  (prize, bingos)


func solution(prize: seq[int], bingos: seq[seq[seq[int]]]): int =
  var output = 0
  let bs = bingos.map(newBingo)
  block nested:
    for _, v in prize:
      for _, b in bs:
        let x = b.mark(v)
        if x != 0:
          output = x
          break nested
  output
let input = io.readAll(io.stdin);
let (a, b) = tokenize(input);
echo solution(a, b);