import 'package:tooly/tooly.dart';

void fill() {
  List<dynamic> firstList = [1, 2, 3, 4, 5];
  print(Tooly.fill(firstList, '*', 1, 3)); // [1, *, *, 4, 5]
}
