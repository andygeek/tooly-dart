# [Tooly](https://andygeek.github.io/tooly-website/)

Tooly is a package based in Lodash for Dart that contain utilities for working with lists, maps, sets and objects.

## Method list

### chunk
Create an list of elements split into groups the length of initial list size.
```dart
Tooly.chunk([1, 2, 3, 4, 5], 2);
// [[1, 2], [3, 4], 5]
```

### compact
Create a list without `null`, `false`, `0` and `''` from another list.
```dart
Tooly.compact([0, 77, '', 55, false]);
// [77, 55]
```

### concat
Create a list that contain the initial list and additional list.
```dart
Tooly.concat([1, 2, 3], [4, 5, 6]);
// [1, 2, 3, 4, 5, 6]
```

### difference
Create a list of values that not include in the second list.
```dart
Tooly.difference([1, 2, 3], [3, 4, 5]);
// [1, 2]
```

### drop
Create a list with n elements dropped from the beginning.
```dart
Tooly.drop([1, 2, 3], 2);
// [3]
```

### fill
Fills elements of `list` with `value` from `start` up to, but not including `end`.
```dart
Tooly.fill([1, 2, 3, 4, 5], '*', 1, 3);
// [1, *, *, 4, 5]
```

### findIndex
Find value index of list.
```dart
Tooly.findIndex([1, 2, 3], (e) => e == 2);
// 1
```

### findLastIndex
Find value index of list but it iterate over elements of list from right to left.
```dart
Tooly.findLastIndex([1, 2, 3], (e) => e == 2);
// 1
```

### flatten
Flattens list a single level deep.
```dart
Tooly.flatten([1, 2, [3, 4], ['a', 'b']]);
// [1, 2, 3, 4, a, b]
```

### indexOf
Gets the first index of value in the list.
```dart
Tooly.indexOf([1, 2, 3, 4], 4);
// 3
```

### listToString
Create a string from a list.
```dart
Tooly.listToString(['first', 'second', 'third']);
// first, second, third
```

### uniq
Create a list no duplicate elements from another list.
```dart
Tooly.uniq([1, 1, 1, 5, 5, 8]);
// [1, 5, 8]
```

### dropRight
Create a list with `n` elements dropped from the end.
```dart
Tooly.dropRight([1, 2, 3, 4], 1);
// [1, 2, 3]
```

### first
Gets the first element of `list`.
```dart
Tooly.first([1, 2, 3]);
// 1
```

### flattenDeep
Flattens list recursively.
```dart
Tooly.flattenDeep([1, [2, [3, [4]], 5]]);
// [1, 2, 3, 4, 5]
```

### initial
Gets all but the last element of `list`.
```dart
Tooly.initial([1, 2, 3]);
// [1, 2]
```

### join
Converts all elements in `list` into a string separated by `separator`.
```dart
Tooly.join(['a', 'b', 'c'], '~');
// a~b~c
```

### last
Gets the last element of `list`.
```dart
Tooly.last([1, 2, 3]);
// 3
```

### nth
Gets the element at index `n` of `list`. If `n` is negative, the nth element from the end is returned.
```dart
Tooly.nth([1, 2, 3, 4], 1);
// 2

Tooly.nth([1, 2, 3, 4], -2);
// 3
```

### sum
Calculates the sum of a list of numbers.
```dart
Tooly.sum([1, 2, 3, 4]);
// 10
```

### take
Creates a slice of `list` with `n` elements taken from the beginning.
```dart
Tooly.take([1, 2, 3, 4], 2);
// [1, 2]
```

### takeRight
Creates a slice of `list` with `n` elements taken from the end.
```dart
Tooly.takeRight([1, 2, 3, 4], 2);
// [3, 4]
```

Much more under construction...
