import 'package:tooly/tooly.dart';

void main() {
  var initList = [1, 2, [3, 4, 5], ['a', 'b']];
  print(Tooly.flatten(initList));
}