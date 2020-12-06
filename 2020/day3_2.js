const fs = require('fs')
const map = fs.readFileSync(0).toString().split('\n')

const height = map.length;
const width = map[0].length;

function solution(down, right) {
    let x = 0
    let count = 0
    for(let i = 0; i < height; i = i + down) {
        const tile = map[i][x]
        if (tile === '#') {
            count = count + 1;
        }
        x = (x + right) % width
    }
    return count;
}


console.log(
    solution(1, 1) * solution(1, 3) * solution(1, 5) * solution(1, 7) * solution(2, 1)
)