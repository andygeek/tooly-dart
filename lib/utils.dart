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
