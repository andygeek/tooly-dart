import 'package:tooly/tooly.dart';

void main() {
  // CHUNK
  final firstList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print('chunk(3) -> ${Tooly.chunk(firstList, 3)}');
  // [[1, 2], [3, 4], [5, 6], [7, 8], 9]

  // DIFFERENCE
  final secondList = [1, 2, 3];
  final thirdList = [3, 4, 5];
  print('difference -> ${Tooly.difference(secondList, thirdList)}');
  // [1, 2]

  // FIND INDEX
  final fourthList = [1, 2, 3, 4];
  print('findIndex(e == 2) -> ${Tooly.findIndex(fourthList, (e) => e == 2)}');
  // 1

  // DROP RIGHT
  print('dropRight([1, 2, 3, 4], 1) -> ${Tooly.dropRight([1, 2, 3, 4], 1)}');
  // [1, 2, 3]

  // DROP
  print('drop([1, 2, 3, 4], 2) -> ${Tooly.drop([1, 2, 3, 4], 2)}');
  // [1, 2, 3]

  // FLATTEN (single level)
  final nestedList = [
    1,
    [2, 3],
    [
      4,
      [5]
    ]
  ];
  print('flatten -> ${Tooly.flatten(nestedList)}');
  // [1, 2, 3, 4, [5]]

  // FLATTEN DEEP (recursivo)
  print('flattenDeep -> ${Tooly.flattenDeep(nestedList)}');
  // [1, 2, 3, 4, 5]

  // FIRST
  print('first([10, 20, 30]) -> ${Tooly.first([10, 20, 30])}');
  // 10

  // LAST
  print('last([10, 20, 30]) -> ${Tooly.last([10, 20, 30])}');
  // 30

  // SUM
  print('sum([1, 2, 3, 4]) -> ${Tooly.sum([1, 2, 3, 4])}');
  // 10

  // JOIN
  print('join(["a", "b", "c"], "~") -> ${Tooly.join(["a", "b", "c"], "~")}');
  // a~b~c

  // NTH
  print('nth([1, 2, 3, 4], -2) -> ${Tooly.nth([1, 2, 3, 4], -2)}');
  // 3

  // LIST TO STRING
  print('listToString(["apple", "banana", "cherry"]) -> '
      '${Tooly.listToString(["apple", "banana", "cherry"])}');
  // apple, banana, cherry
}
