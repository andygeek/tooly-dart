baseFill(List<dynamic> list, dynamic value, int start, int? end) {
  var length = list.length;
  if (start < 0) {
    start = -start > length ? 0 : (length + start);
  }
  end = (end == null || end > length) ? 0 : end;
  if (end < 0) {
    end += length;
  }
  end = start > end ? 0 : end;
  while (start < end) {
    list[start++] = value;
  }
  return list;
}

baseFindIndex(List<dynamic> array, bool Function(dynamic) predicate,
    int fromIndex, bool fromRight) {
  var length = array.length;
  var index = fromIndex + (fromRight ? 1 : -1);
  while (fromRight ? 0 < index-- : ++index < length) {
    if (predicate(array[index])) {
      return index;
    }
  }
  return -1;
}

strictIndexOf(List<dynamic> array, dynamic value, int fromIndex) {
  var index = fromIndex - 1;
  var length = array.length;

  while (++index < length) {
    if (array[index] == value) {
      return index;
    }
  }
  return -1;
}
