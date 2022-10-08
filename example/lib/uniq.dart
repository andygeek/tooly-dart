import 'package:tooly/tooly.dart';

void uniq() {
  var initList = [1, 1, 1, 1, 4, 5, 5, 4, 7];
  print(Tooly.uniq(initList)); // [1, 4, 5, 7]
}