val hole = BooleanArray(1024)
val lookup = mapOf('F' to '0', 'B' to '1', 'L' to '0', 'R' to '1')
val numbers = generateSequence(::readLine).map {
    line -> Integer.parseInt(line.asSequence().map { lookup[it] }.toList().joinToString(""), 2)
}
numbers.forEach { it -> hole.set(it, true) }
val x = hole.withIndex().find { hole.getOrElse(it.index - 1, { false }) && !it.value }
println(x?.index)
