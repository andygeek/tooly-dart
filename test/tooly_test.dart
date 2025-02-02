import 'package:test/test.dart';
import 'package:tooly/utils.dart';
import 'package:tooly/tooly.dart';

void main() {
  group('Tests for utils.dart functions', () {
    test('baseFill: fills the list in the specified range', () {
      var list = [1, 2, 3, 4];
      var result = baseFill(List.from(list), 9, 1, 3);
      expect(result, equals([1, 9, 9, 4]));
    });

    test('baseFill: with negative start', () {
      var list = [1, 2, 3, 4];
      var result = baseFill(List.from(list), 7, -2, 4);
      expect(result, equals([1, 2, 7, 7]));
    });

    test('baseFill: with negative end', () {
      var list = [1, 2, 3, 4];
      var result = baseFill(List.from(list), 5, 1, -1);
      expect(result, equals([1, 5, 5, 4]));
    });

    test('baseFill: when start > end (no fill performed)', () {
      var list = [1, 2, 3, 4];
      var result = baseFill(List.from(list), 8, 3, 2);
      expect(result, equals([1, 2, 3, 4]));
    });

    test('baseFindIndex: search from left to right', () {
      var list = [1, 2, 3, 4, 5];
      int index = baseFindIndex(list, (e) => e == 3, 0, false);
      expect(index, equals(2));
    });

    test('baseFindIndex: search from right to left', () {
      var list = [1, 2, 3, 4, 3];
      int index = baseFindIndex(list, (e) => e == 3, 4, true);
      expect(index, equals(4));
    });

    test('baseFindIndex: returns -1 if element is not found', () {
      var list = [1, 2, 3, 4];
      int index = baseFindIndex(list, (e) => e == 10, 0, false);
      expect(index, equals(-1));
    });

    test('strictIndexOf: returns the correct index', () {
      var list = [1, 2, 3, 4];
      int index = strictIndexOf(list, 3, 0);
      expect(index, equals(2));
    });

    test('strictIndexOf: returns -1 if value is not found', () {
      var list = [1, 2, 3, 4];
      int index = strictIndexOf(list, 10, 0);
      expect(index, equals(-1));
    });
  });

  group('Tests for the Tooly class', () {
    test('compact: removes falsey values (null, false, 0, "")', () {
      var list = [0, 1, false, 2, '', 3, null, 4, true];
      var result = Tooly.compact(list);
      expect(result, equals([1, 2, 3, 4, true]));
    });

    test('concat: concatenates two lists', () {
      var a = [1, 2];
      var b = [3, 4];
      var result = Tooly.concat(a, b);
      expect(result, equals([1, 2, 3, 4]));
    });

    test('uniq: removes duplicate elements', () {
      var list = [1, 2, 1, 3, 2, 4];
      var result = Tooly.uniq(list);
      expect(result.toSet(), equals({1, 2, 3, 4}));
      expect(result.length, equals(4));
    });

    test('listToString: converts list to string with separator ", "', () {
      var list = [1, 2, 3];
      var result = Tooly.listToString(list);
      expect(result, equals('1, 2, 3'));
    });

    test('flatten: flattens the list one level deep', () {
      var list = [
        1,
        [2, 3],
        4
      ];
      var result = Tooly.flatten(List.from(list));
      expect(result, equals([1, 2, 3, 4]));
    });

    test('chunk: splits the list into chunks of the specified size', () {
      var list = [1, 2, 3, 4, 5];
      var result = Tooly.chunk(list, 2);
      expect(
          result,
          equals([
            [1, 2],
            [3, 4],
            5
          ]));

      list = [1, 2, 3, 4];
      result = Tooly.chunk(list, 2);
      expect(
          result,
          equals([
            [1, 2],
            [3, 4]
          ]));
    });

    test('difference: returns elements from first list not in second list', () {
      var firstList = [1, 2, 3, 4, 5];
      var secondList = [2, 4];
      var result = Tooly.difference(firstList, secondList);
      expect(result, equals([1, 3, 5]));

      result = Tooly.difference(firstList, []);
      expect(result, equals(firstList));
    });

    test('drop: removes n elements from the beginning of the list', () {
      var list = [1, 2, 3, 4];
      var result = Tooly.drop(list, 2);
      expect(result, equals([3, 4]));

      result = Tooly.drop(list, 0);
      expect(result, equals(list));

      result = Tooly.drop(list, 10);
      expect(result, equals([]));
    });

    test('fill: fills elements of the list with a value in the specified range', () {
      var list = [1, 2, 3, 4];
      var result = Tooly.fill(List.from(list), 9, 1, 3);
      expect(result, equals([1, 9, 9, 4]));
    });

    test('findIndex: returns the first index matching the predicate', () {
      var list = [1, 2, 3, 4];
      int index = Tooly.findIndex(list, (e) => e == 3);
      expect(index, equals(2));

      index = Tooly.findIndex(list, (e) => e == 1, 1);
      expect(index, equals(-1));

      index = Tooly.findIndex(list, (e) => e == 4, -1);
      expect(index, equals(3));
    });

    test('findLastIndex: returns the last index matching the predicate', () {
      var list = [1, 2, 3, 4, 3];
      int index = Tooly.findLastIndex(list, (e) => e == 3);
      expect(index, equals(4));

      index = Tooly.findLastIndex(list, (e) => e == 3, 2);
      expect(index, equals(2));

      index = Tooly.findLastIndex(list, (e) => e == 1, -4);
      expect(index, equals(0));
    });

    test('indexOf: returns the first occurrence of the value', () {
      var list = [1, 2, 3, 4, 3];
      int index = Tooly.indexOf(list, 3);
      expect(index, equals(2));

      index = Tooly.indexOf(list, 3, 3);
      expect(index, equals(4));

      index = Tooly.indexOf(list, 10);
      expect(index, equals(-1));
    });

    test('take: returns the first n elements of the list', () {
      var list = [1, 2, 3, 4];
      var result = Tooly.take(list, 2);
      expect(result, equals([1, 2]));

      result = Tooly.take(list, 10);
      expect(result, equals([1, 2, 3, 4]));

      result = Tooly.take(list, 0);
      expect(result, equals([]));
    });

    test('takeRight: returns the last n elements of the list', () {
      var list = [1, 2, 3, 4];
      var result = Tooly.takeRight(list, 2);
      expect(result, equals([3, 4]));

      result = Tooly.takeRight(list, 10);
      expect(result, equals([1, 2, 3, 4]));

      result = Tooly.takeRight(list, 0);
      expect(result, equals([]));
    });

    test('dropRight: removes n elements from the end of the list', () {
      var list = [1, 2, 3, 4];
      var result = Tooly.dropRight(list, 1);
      expect(result, equals([1, 2, 3]));

      result = Tooly.dropRight(list, 10);
      expect(result, equals([]));
    });

    test('initial: returns all elements except the last one', () {
      var list = [1, 2, 3];
      var result = Tooly.initial(list);
      expect(result, equals([1, 2]));

      result = Tooly.initial([1]);
      expect(result, equals([]));
      result = Tooly.initial([]);
      expect(result, equals([]));
    });

    test('last: returns the last element of the list', () {
      var list = [1, 2, 3];
      var result = Tooly.last(list);
      expect(result, equals(3));

      result = Tooly.last([]);
      expect(result, isNull);
    });

    test('first: returns the first element of the list', () {
      var list = [1, 2, 3];
      var result = Tooly.first(list);
      expect(result, equals(1));

      result = Tooly.first([]);
      expect(result, isNull);
    });

    test('nth: returns the element at index n (supports negative indices)', () {
      var list = [1, 2, 3, 4];
      var result = Tooly.nth(list, 1);
      expect(result, equals(2));

      result = Tooly.nth(list, -1);
      expect(result, equals(4));

      result = Tooly.nth(list, 10);
      expect(result, isNull);

      result = Tooly.nth(list, -10);
      expect(result, isNull);
    });

    test('flattenDeep: recursively flattens the list', () {
      var list = [
        1,
        [
          2,
          [
            3,
            [4]
          ],
          5
        ]
      ];
      var result = Tooly.flattenDeep(list);
      expect(result, equals([1, 2, 3, 4, 5]));
    });

    test('join: converts the list to a string with the specified separator', () {
      var list = ['a', 'b', 'c'];
      var result = Tooly.join(list, '~');
      expect(result, equals('a~b~c'));

      result = Tooly.join(list);
      expect(result, equals('a,b,c'));

      // Lista vacía
      result = Tooly.join([]);
      expect(result, equals(''));
    });

    test('sum: returns the sum of numeric elements in the list', () {
      var list = [1, 2, 3, 4];
      var result = Tooly.sum(list);
      expect(result, equals(10));

      result = Tooly.sum([]);
      expect(result, equals(0));
    });
  });
}
