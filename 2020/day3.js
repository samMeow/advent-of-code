const fs = require('fs')
const map = fs.readFileSync(0).toString().split('\n')

const height = map.length;
const width = map[0].length;

let x = 0
let count = 0
for(let i = 0; i < height; i ++) {
    const tile = map[i][x]
    if (tile === '#') {
        count = count + 1;
    }
    x = (x + 3) % width
}

console.log(count)