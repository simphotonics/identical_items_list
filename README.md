
# Identical Items List
[![Dart](https://github.com/simphotonics/identical_items_list/actions/workflows/dart.yml/badge.svg)](https://github.com/simphotonics/identical_items_list/actions/workflows/dart.yml)


## Introduction

The package [`identical_items_list`][identical_items_list] provides
a *non-empty* unmodifiable Dart list containing *identical*
items. An object of type [`IdenticalItemsList`][IdenticalItemsList] is
unmodifiable in the sense that methods changing the list-length or its
elements throw an [`UnsupportedError`][UnsupportedError].


## Use Case

Consider a function that returns a (potentially very long) list which
for a certain case contains identical entries. In such a case,
it might be more efficient to return an
[`IdenticalItemsList`][IdenticalItemsList] instead of
creating and returning a standard `List` object,:
```Dart
final list = List.filled(1000000, 42); // 14000 microseconds
final iList = IdenticalItemsList(value: 42, length: 1000000); // 0.02 microseconds
```
For more details see the page showing [benchmark][benchmark] scores.


## Usage

To use this library include [`identical_items_list`][identical_items_list]
as a dependency in your pubspec.yaml file. The
example below shows how to construct an object of type
[`IdenticalItemsList`][IdenticalItemsList]:

```Dart
import 'package:identical_items_list/identical_items_list.dart';

void main(List<String> args) {
  final list = IdenticalItemsList(value: 42, length: 1000000);

  print('List: $list \n');

  print('Type: list is List<int>: ${list is List<int>} \n');

  print('Length:  ${list.length} \n');

  final sum = list.reduce((previousValue, item) => previousValue + item);
  print('Sum: $sum \n');

  print('Access: list[1024] = ${list[1024]}');
}
```

<details> <summary> Click to show the console output. </summary>

```Console
$ dart example/bin/example.dart
List: [42, 42, 42, 42, 42, ..., 42, 42]

Type: is List<int>: true

Length: 1000000

Sum: 42000000

Access: list[1024] = 42
```
</details>

## Notes

* It is *not* possible to create an
empty [`IdenticalItemsList`][IdenticalItemsList]. The constructor parameter
`value` is required and the default list `length` is one.

* The class [`IdenticalItemsList`][IdenticalItemsList] provides a `const`
constructor making it possible to define const objects:
  ```Dart
  final list1 = const IdenticalItemsList(value: 42, length: 1000);
  final list2 = const IdenticalItemsList(value: 42, length: 1000);

  print(list1 == list2); // true
  print(identical(list1 == list2)); // true
  ```

*  An object of type [`IdenticalItemsList<T>`][IdenticalItemsList] is immutable if the
constructor parameter `value` is an immutable object.

## Examples

For further information see [example].

## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/identical_items_list/issues

[benchmark]: https://github.com/simphotonics/identical_items_list/tree/main/benchmark

[collections]: https://api.dart.dev/stable/dart-collection/dart-collection-library.html

[example]: https://github.com/simphotonics/identical_items_list/tree/main/example

[identical_items_list]: https://pub.dev/packages/identical_items_list

[IdenticalItemsList]: https://pub.dev/documentation/identical_items_list/latest/identical_items_list/IdenticalItemsList-class.html

[IdenticalItemsIterable]: https://pub.dev/documentation/identical_items_list/latest/identical_items_list/IdenticalItemsIterable-class.html

[IdenticalItemsIterator]: https://pub.dev/documentation/identical_items_list/latest/identical_items_list/IdenticalItemsIterator-class.html

[List]:https://api.dart.dev/dart-core/List-class.html

[UnsupportedError]: https://api.dart.dev/dart-core/UnsupportedError-class.html