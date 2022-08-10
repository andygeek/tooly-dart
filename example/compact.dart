import 'package:tooly/tooly.dart';

void main() {
  var initList = [1, 3, 0, null, '', false, 4];
  print(Tooly.compact(initList)); // [1, 3, 4]
}