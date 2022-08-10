class Tooly {

  /// Create a list without `null`, `false`, `0` and `''` from another list. 
  static List compact(List initList) {
    List listResult = [];
    if (initList.isEmpty) {
      return listResult;
    }
    for (var data in initList) {
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
      if(index < list.length - 1) {
        strFinal = '$strFinal${list[index].toString()}, ';
      } else {
        strFinal = strFinal + list[index].toString();
      }
    }
    return strFinal;
  }
}
