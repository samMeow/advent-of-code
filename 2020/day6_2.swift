var blocks: [[String]] = []
var buffer: [String] = []
while let line = readLine() {
    if (line == "") {
        blocks.append(buffer)
        buffer = []
    } else {
        buffer.append(line)
    }
}
blocks.append(buffer)

var raw = blocks.map {
    block in
    (block.reduce(into: [:]) {
        counts, str in str.forEach {
            letter in counts[letter, default: 0] += 1
        }
    }).values.filter({ i in i == block.count }).count
}

print(raw.reduce(0, +))
