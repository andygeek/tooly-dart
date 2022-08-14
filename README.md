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

### Flatten

Flattens list a single level deep.

```dart
Tooly.flatten([1, 2, [3, 4], ['a', 'b']]);
// [1, 2, 3, 4, a, b]
```

Much more under construction...
