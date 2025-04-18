
# Identical Items List

[![Dart](https://github.com/simphotonics/identical_items_list/actions/workflows/dart.yml/badge.svg)](https://github.com/simphotonics/identical_items_list/actions/workflows/dart.yml)

## Introduction

The package [`identical_items_list`][identical_items_list] provides
a *non-empty* unmodifiable Dart list containing identical
items. The list is unmodifiable in the sense that object mutating methods
are not implemented. `IdenticalItemsList` implements the interface
[`List<E>`][List]
without using an underlying collection.


## Usage

To use this library include [`identical_items_list`][identical_items_list]
as a dependency in your pubspec.yaml file.


```Dart
import 'package:identical_items_list/identical_items_list.dart';

void main(List<String> args) {
  // Creating an IdentialItemsList
  final list = IdenticalItemsList(value: 42, length: 10);

  // Creating an IdenticalItemsIterator
  final it = list.iterator;
  int index = 0;

  // Iterating
  while (it.moveNext()) {
    print('${index++}: ${it.current}');
  }
}
}
```

<details> <summary> Click to show the console output. </summary>

```Console
$ dart example/bin/iterator_example.dart
0: 42
1: 42
2: 42
3: 42
4: 42
5: 42
6: 42
7: 42
8: 42
9: 42
```
</details>


## Features and bugs

Please file feature requests and bugs at the [issue tracker].

[issue tracker]: https://github.com/simphotonics/identical_items_list/issues

[collections]: https://api.dart.dev/stable/dart-collection/dart-collection-library.html

[example]: https://github.com/simphotonics/identical_items_list/tree/main/example

[identical_items_list]: https://pub.dev/packages/identical_items_list

[IdenticalItemsList]: https://pub.dev/documentation/identical_items_list/latest/identical_items_list/IdenticalItemsList-class.html

[IdenticalItemsIterable]: https://pub.dev/documentation/identical_items_list/latest/identical_items_list/IdenticalItemsIterable-class.html

[IdenticalItemsIterator]: https://pub.dev/documentation/identical_items_list/latest/identical_items_list/IdenticalItemsIterator-class.html

[List]:https://api.dart.dev/dart-core/List-class.html