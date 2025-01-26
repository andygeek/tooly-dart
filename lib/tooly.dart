import 'dart:math';

import 'package:collection/collection.dart';
import 'package:tooly/utils.dart';

class Tooly {
  /// Create a list without `null`, `false`, `0` and `''` from another list.
  static List compact(List list) {
    List listResult = [];
    if (list.isEmpty) {
      return listResult;
    }
    for (var data in list) {
      if (data == null || data == false || data == "" || data == 0) {
      } else {
        listResult.add(data);
      }
    }

    return listResult;
  }

  /// Create a list that contain the initial list and additional list
  static List<dynamic> concat(List<dynamic> initList, List<dynamic> arg) {
    return [...initList, ...arg];
  }

  /// Create a list no duplicate elements from another list.
  static List uniq(List list) {
    return list.toSet().toList();
  }

  /// Create a string from a list.
  static String listToString(List list) {
    String strFinal = '';
    for (var index = 0; index < list.length; index++) {
      if (index < list.length - 1) {
        strFinal = '$strFinal${list[index].toString()}, ';
      } else {
        strFinal = strFinal + list[index].toString();
      }
    }
    return strFinal;
  }

  /// Flattens list a single level deep.
  static List flatten(List list) {
    for (var i = 0; i < list.length; i++) {
      if (list[i] is! List) {
        list[i] = [list[i]];
      }
    }
    return list.expand((element) => element).toList();
  }

  /// Create an list of elements split into groups the length of initial list size.
  static List chunk(List list, int size) {
    List result = [];
    List aux = [];
    for (var i = 0; i < list.length; i++) {
      if ((i + 1) % size == 0) {
        aux.add(list[i]);
        result.add([...aux]);
        aux.clear();
      } else {
        aux.add(list[i]);
      }
    }
    if (aux.isNotEmpty) {
      result.addAll(aux);
    }
    return result;
  }

  /// Create a list of values that not include in the second list.
  static List difference(List<dynamic> firstList, List<dynamic> secondList) {
    List result = [];
    for (var element in firstList) {
      dynamic searchElement = secondList.firstWhereOrNull((e) => element == e);

      if (searchElement == null) {
        result.add(element);
      }
    }
    return result;
  }

  /// Create a list with `n` elements dropped from the beginning.
  static List drop(List<dynamic> list, int n) {
    var length = list.length;
    if (length == 0 || n >= length) {
      return [];
    } else if (n <= 0) {
      return list;
    } else {
      return list.sublist(n, length);
    }
  }

  /// Fills elements of `list` with `value` from `start` up to, but not including `end`.
  static List fill(List<dynamic> list, dynamic value, int start, int? end) {
    var length = list.length;
    if (length == 0) {
      return [];
    } else {
      return baseFill(list, value, start, end);
    }
  }

  /// Find value index of list
  static findIndex(List<dynamic> list, bool Function(dynamic e) predicate,
      [int? fromIndex]) {
    var length = list.length;
    if (length == 0) {
      return -1;
    }
    int index = fromIndex ?? 0;
    if (index < 0) {
      index = max(length + index, 0);
    }
    return baseFindIndex(list, predicate, index, false);
  }

  /// Find value index of list but it iterate over elements of list from right to left
  static findLastIndex(List<dynamic> list, bool Function(dynamic e) predicate,
      [int? fromIndex]) {
    var length = list.length;
    if (length == 0) {
      return -1;
    }
    int index = length - 1;
    if (fromIndex != null) {
      index = fromIndex < 0
          ? max(length + fromIndex, 0)
          : min(fromIndex, length - 1);
    }
    return baseFindIndex(list, predicate, index, true);
  }

  /// Gets the first index of value in the list
  static indexOf(List<dynamic> list, dynamic value, [int? fromIndex]) {
    var length = list.length;
    if (length == 0) {
      return -1;
    }
    var index = fromIndex ?? 0;
    if (index < 0) {
      index = max(length + index, 0);
    }
    return strictIndexOf(list, value, index);
  }

  /// Creates a slice of `list` with `n` elements taken from the beginning.
  /// Example: take([1,2,3,4],2) => [1,2]
  static List<dynamic> take(List<dynamic> list, [int n = 1]) {
    if (list.isEmpty) return [];
    if (n <= 0) return [];
    return list.sublist(0, n > list.length ? list.length : n);
  }

  /// Creates a slice of `list` with `n` elements taken from the end.
  /// Example: takeRight([1,2,3,4],2) => [3,4]
  static List<dynamic> takeRight(List<dynamic> list, [int n = 1]) {
    if (list.isEmpty) return [];
    if (n <= 0) return [];
    int start = list.length - n;
    if (start < 0) start = 0;
    return list.sublist(start);
  }

  /// Creates a slice of `list` with `n` elements dropped from the end.
  /// Example: dropRight([1,2,3,4],1) => [1,2,3]
  static List<dynamic> dropRight(List<dynamic> list, [int n = 1]) {
    if (list.isEmpty) return [];
    int end = list.length - n;
    if (end <= 0) {
      return [];
    }
    return list.sublist(0, end);
  }

  /// Gets all but the last element of `list`.
  /// Example: initial([1, 2, 3]) => [1, 2]
  static List<dynamic> initial(List<dynamic> list) {
    if (list.length <= 1) {
      return [];
    }
    return list.sublist(0, list.length - 1);
  }

  /// Gets the last element of `list`.
  /// Example: last([1, 2, 3]) => 3
  static dynamic last(List<dynamic> list) {
    if (list.isEmpty) return null;
    return list[list.length - 1];
  }

  /// Gets the first element of `list`.
  /// Example: first([1, 2, 3]) => 1
  static dynamic first(List<dynamic> list) {
    if (list.isEmpty) return null;
    return list[0];
  }

  /// Gets the element at index `n` of `list`. If n is negative,
  /// the nth element from the end is returned.
  /// Example: nth([1,2,3,4],1) => 2
  ///          nth([1,2,3,4],-2) => 3
  static dynamic nth(List<dynamic> list, int n) {
    if (list.isEmpty) return null;
    int length = list.length;
    if (n < 0) {
      n = length + n; // si es -1, entonces último elemento
    }
    if (n < 0 || n >= length) return null;
    return list[n];
  }

  /// Flattens list recursively.
  /// Example: flattenDeep([1,[2,[3,[4]],5]]) => [1, 2, 3, 4, 5]
  static List<dynamic> flattenDeep(List<dynamic> list) {
    List<dynamic> result = [];
    void flatRec(dynamic value) {
      if (value is List) {
        for (var element in value) {
          flatRec(element);
        }
      } else {
        result.add(value);
      }
    }

    for (var element in list) {
      flatRec(element);
    }
    return result;
  }

  /// Converts all elements in `list` into a string separated by `separator`.
  /// Example: join(['a', 'b', 'c'], '~') => 'a~b~c'
  static String join(List<dynamic> list, [String separator = ',']) {
    if (list.isEmpty) return '';
    return list.map((e) => e.toString()).join(separator);
  }

  /// Calculates the sum of a list of numbers.
  /// Example: sum([1,2,3,4]) => 10
  static num sum(List<num> list) {
    if (list.isEmpty) return 0;
    num total = 0;
    for (var element in list) {
      total += element;
    }
    return total;
  }
}
