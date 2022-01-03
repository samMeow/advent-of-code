import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:math';

Stream<String> inputStream() => stdin
  .transform(utf8.decoder)
  .transform(const LineSplitter());

Future<void> main() async {
  var pt = await inputStream().fold(new Point(0, 0), (Point<int> cur, ins) {
    List<String> temp = ins.split(' ');
    int val = int.parse(temp[1]);
    switch (temp[0]) {
      case 'forward':
        return cur + new Point(val, 0);
      case 'down':
        return cur + new Point(0, val);
      case 'backward':
        return cur - new Point(val, 0);
      case 'up':
        return cur - new Point(0, val);
      default:
        return cur;
    }
    return cur;
  });
  print(pt.x * pt.y);
}