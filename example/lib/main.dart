import 'package:tooly/tooly.dart';

void main() {
  List firstList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(Tooly.chunk(firstList, 3));
  // [[1, 2], [3, 4], [5, 6], [7, 8], 9]

  var secondList = [1, 2, 3];
  var thirdList = [3, 4, 5];
  print(Tooly.difference(secondList, thirdList));
  // [1, 2]

  var fourthList = [1, 2, 3, 4];
  print(Tooly.findIndex(fourthList, (e) => e == 2));
  // 1
}
