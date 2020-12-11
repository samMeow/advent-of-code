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

var raw = blocks.map { Set($0.reduce("", +)).count }

print(raw.reduce(0, +))