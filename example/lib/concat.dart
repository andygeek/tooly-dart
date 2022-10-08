import 'package:tooly/tooly.dart';

void concat() {
  var firstList = [1, 2, 3];
  var secondList = [4, 5, 6];
  print(Tooly.concat(firstList, secondList)); // [1, 2, 3, 4, 5, 6]
}