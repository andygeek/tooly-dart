# Tooly

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

### uniq

Create a list no duplicate elements from another list.

```dart
Tooly.uniq([1, 1, 1, 5, 5, 8]);
// [1, 5, 8]
```

### listToString

Create a string from a list.

```dart
Tooly.listToString(['first', 'second', 'third']);
// first, second, third
```

### fill

Fills elements of `list` with `value` from `start` up to, but not including `end`.

```dart
Tooly.fill([1, 2, 3, 4, 5], '*', 1, 3)
// [1, *, *, 4, 5]
```

### flatten

Flattens list a single level deep.

```dart
Tooly.flatten([1, 2, [3, 4], ['a', 'b']]);
// [1, 2, 3, 4, a, b]
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

### indexOf

Gets the first index of value in the list.

```dart
Tooly.indexOf([1, 2, 3, 4], 4);
// 3
```


Much more under construction...
