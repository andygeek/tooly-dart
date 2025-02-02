import 'dart:math';

import 'package:tooly/utils.dart';

class Tooly {
  static List compact(List list) {
    return list.where((data) => data != null && data != false && data != "" && data != 0).toList();
  }

  static List<dynamic> concat(List<dynamic> initList, List<dynamic> arg) {
    return [...initList, ...arg];
  }

  static List uniq(List list) {
    return list.toSet().toList();
  }

  static String listToString(List list) {
    var buffer = StringBuffer();
    for (var i = 0; i < list.length; i++) {
      buffer.write(list[i].toString());
      if (i < list.length - 1) {
        buffer.write(', ');
      }
    }
    return buffer.toString();
  }

  static List flatten(List list) {
    for (var i = 0; i < list.length; i++) {
      list[i] = (list[i] is List) ? list[i] : [list[i]];
    }
    return list.expand((element) => element).toList();
  }

  static List chunk(List list, int size) {
    List result = [];
    List aux = [];
    for (var i = 0; i < list.length; i++) {
      aux.add(list[i]);
      if ((i + 1) % size == 0) {
        result.add([...aux]);
        aux.clear();
      }
    }
    if (aux.isNotEmpty) {
      result.addAll(aux);
    }
    return result;
  }

  static List difference(List<dynamic> firstList, List<dynamic> secondList) {
    final secondSet = secondList.toSet();
    return firstList.where((element) => !secondSet.contains(element)).toList();
  }

  static List drop(List<dynamic> list, int n) {
    if (n <= 0) return list;
    return n >= list.length ? [] : list.sublist(n);
  }

  static List fill(List<dynamic> list, dynamic value, int start, int? end) {
    return list.isEmpty ? [] : baseFill(list, value, start, end);
  }

  static int findIndex(
    List<dynamic> list,
    bool Function(dynamic e) predicate, [
    int? fromIndex,
  ]) {
    if (list.isEmpty) return -1;
    int index = fromIndex ?? 0;
    if (index < 0) index = max(list.length + index, 0);
    return baseFindIndex(list, predicate, index, false);
  }

  static int findLastIndex(
    List<dynamic> list,
    bool Function(dynamic e) predicate, [
    int? fromIndex,
  ]) {
    if (list.isEmpty) return -1;
    int index = fromIndex != null ? (fromIndex < 0 ? max(list.length + fromIndex, 0) : min(fromIndex, list.length - 1)) : list.length - 1;
    return baseFindIndex(list, predicate, index, true);
  }

  static int indexOf(List<dynamic> list, dynamic value, [int? fromIndex]) {
    if (list.isEmpty) return -1;
    int index = fromIndex ?? 0;
    if (index < 0) index = max(list.length + index, 0);
    return strictIndexOf(list, value, index);
  }

  static List<dynamic> take(List<dynamic> list, [int n = 1]) {
    if (n <= 0 || list.isEmpty) return [];
    return list.sublist(0, min(n, list.length));
  }

  static List<dynamic> takeRight(List<dynamic> list, [int n = 1]) {
    if (n <= 0 || list.isEmpty) return [];
    int start = max(list.length - n, 0);
    return list.sublist(start);
  }

  static List<dynamic> dropRight(List<dynamic> list, [int n = 1]) {
    if (list.isEmpty) return [];
    int end = list.length - n;
    return end <= 0 ? [] : list.sublist(0, end);
  }

  static List<dynamic> initial(List<dynamic> list) {
    return list.length <= 1 ? [] : list.sublist(0, list.length - 1);
  }

  static dynamic last(List<dynamic> list) {
    return list.isEmpty ? null : list.last;
  }

  static dynamic first(List<dynamic> list) {
    return list.isEmpty ? null : list.first;
  }

  static dynamic nth(List<dynamic> list, int n) {
    if (list.isEmpty) return null;
    int length = list.length;
    if (n < 0) n = length + n;
    return (n < 0 || n >= length) ? null : list[n];
  }

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

  static String join(List<dynamic> list, [String separator = ',']) {
    return list.isEmpty ? '' : list.map((e) => e.toString()).join(separator);
  }

  static num sum(List<num> list) {
    num total = 0;
    for (var element in list) {
      total += element;
    }
    return total;
  }
}
