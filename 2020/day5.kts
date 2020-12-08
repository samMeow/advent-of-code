import java.util.Arrays

val lookup = mapOf('F' to '0', 'B' to '1', 'L' to '0', 'R' to '1')
val numbers = generateSequence(::readLine).map {
    line -> Integer.parseInt(line.asSequence().map { lookup[it] }.toList().joinToString(""), 2)
}
val maxi = numbers.maxOrNull()
println(maxi)