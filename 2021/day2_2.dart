import 'dart:async';
import 'dart:io';
import 'dart:convert';

class P<T> {
  T x;
  T y;
  T aim;

  P(this.x, this.y, this.aim);

  toString() {
    return '{ x: ${this.x}, y: ${this.y}, aim: ${this.aim} }';
  }
}

Stream<String> inputStream() => stdin
  .transform(utf8.decoder)
  .transform(const LineSplitter());

Future<void> main() async {
  var pt = await inputStream().fold(P(0, 0, 0), (P<int> cur, ins) {
    List<String> temp = ins.split(' ');
    int val = int.parse(temp[1]);
    switch (temp[0]) {
      case 'forward':
        cur.x = cur.x + val;
        cur.y = cur.y + val * cur.aim;
        break;
      case 'down':
        cur.aim = cur.aim + val;
        break;
      case 'up':
        cur.aim = cur.aim - val;
        break;
      default:
        return cur;
    }
    return cur;
  });
  print(pt.x * pt.y);
}