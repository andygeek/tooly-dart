import 'package:tooly/tooly.dart';

void flatten() {
  var initList = [1, 2, [3, 4, 5], ['a', 'b']];
  print(Tooly.flatten(initList));
}