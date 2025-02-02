import 'dart:math';

List<dynamic> baseFill(List<dynamic> list, dynamic value, int start, int? end) {
  int length = list.length;
  if (start < 0) {
    start = max(length + start, 0);
  }
  end = (end == null || end > length) ? 0 : end;
  if (end < 0) {
    end += length;
  }
  if (start > end) return list;
  for (int i = start; i < end; i++) {
    list[i] = value;
  }
  return list;
}

int baseFindIndex(
  List<dynamic> array,
  bool Function(dynamic) predicate,
  int startIndex,
  bool fromRight,
) {
  if (fromRight) {
    for (int i = startIndex; i >= 0; i--) {
      if (predicate(array[i])) return i;
    }
  } else {
    for (int i = startIndex; i < array.length; i++) {
      if (predicate(array[i])) return i;
    }
  }
  return -1;
}

int strictIndexOf(List<dynamic> array, dynamic value, int fromIndex) {
  for (int i = fromIndex; i < array.length; i++) {
    if (array[i] == value) return i;
  }
  return -1;
}
