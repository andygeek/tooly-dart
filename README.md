# Tooly

Tooly is a package based in Lodash for Dart that contain utilities for working with lists, maps, sets and objects.

## Method list

### Chunk

Create an list of elements split into groups the length of initial list size.

```dart
Tooly.chunk([1, 2, 3, 4, 5], 2);
// [[1, 2], [3, 4], 5]
```

### Compact

Create a list without `null`, `false`, `0` and `''` from another list. 

```dart
Tooly.compact([0, 77, '', 55, false]);
// [77, 55]
```

### Concat

Create a list that contain the initial list and additional list.

```dart
Tooly.concat([1, 2, 3], [4, 5, 6]);
// [1, 2, 3, 4, 5, 6]
```

### Difference

Create a list of values that not include in the second list.
```dart
Tooly.difference([1, 2, 3], [3, 4, 5]);
// [1, 2]
```

### Drop

Create a list with n elements dropped from the beginning.
```dart
Tooly.drop([1, 2, 3], 2);
// [3]
```

### Uniq

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

### Fill

Fills elements of `list` with `value` from `start` up to, but not including `end`.

```dart
Tooly.fill([1, 2, 3, 4, 5], '*', 1, 3)
// [1, *, *, 4, 5]
```

### Flatten

Flattens list a single level deep.

```dart
Tooly.flatten([1, 2, [3, 4], ['a', 'b']]);
// [1, 2, 3, 4, a, b]
```

Much more under construction...
