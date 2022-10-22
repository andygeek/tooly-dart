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
    List<dynamic> result = [...initList, ...arg];
    return result;
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
  static List difference(List<dynamic> fisrList, List<dynamic> secondList) {
    List result = [];
    for (var element in fisrList) {
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
    if (length == 0 || n > length) {
      return [];
    } else {
      return list.slice(n < 0 ? 0 : n, length);
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
      index = fromIndex;
      index = fromIndex < 0 ? max(length + index, 0) : min(index, length - 1);
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
    return strictIndexOf(list, value, fromIndex ?? 0);
  }
}
