
# Identical Items List
[![Dart](https://github.com/simphotonics/identical_items_list/actions/workflows/dart.yml/badge.svg)](https://github.com/simphotonics/identical_items_list/actions/workflows/dart.yml)


## Introduction

The package [`identical_items_list`][identical_items_list] provides
a *non-empty* unmodifiable Dart list containing identical
items.

## Benchmark Code

In order to compare the efficiency of  and , the following benchmark were
performed:

```Dart
// ignore_for_file: unused_local_variable
import 'package:benchmark_runner/benchmark_runner.dart';
import 'package:identical_items_list/identical_items_list.dart';

void main() {
  final iiList = IdenticalItemsList(value: 42, length: 1000000);
  final list = List.filled(1000000, 42, growable: true);

  group('construct:', () {
    benchmark('IdenticalItemsList<int>', () {
      final list = IdenticalItemsList(value: 42, length: 1000000);
    });
    benchmark('List<int>', () {
      final list1 = List.filled(1000000, 42, growable: true);
    });
  });

  group('access:', () {
    benchmark('iiList.first', () {
      final first = iiList.first;
    });
    benchmark('list.first', () {
      final first = list.first;
    });

    benchmark('iiList[34568]', () {
      final first = iiList[34568];
    });
    benchmark('list[34568]', () {
      final first = list[34568];
    });

    benchmark('iiList.last', () {
      final first = iiList.last;
    });
    benchmark('list.last', () {
      final first = list.last;
    });
  });

  group('search:', () {
    benchmark('iiList.lastWhere', () {
      final item = iiList.lastWhere((element) => element < 10, orElse: () => 0);
    });
    benchmark('list.lastWhere', () {
      final item = list.lastWhere((element) => element < 10, orElse: () => 0);
    });
  });

  group('reduce:', () {
    benchmark('iiList.reduce', () {
      final item = iiList.reduce(
        (previousValue, element) => previousValue = previousValue + element,
      );
    });
    benchmark('list.reduce', () {
      final item = list.reduce(
        (previousValue, element) => previousValue = previousValue + element,
      );
    });
  });
}
```

## Benchmark Scores
<details> <summary> Click to show the console output. </summary>
![Benchmark Scores](https://github.com/simphotonics/identical_items_list/raw/main/images/benchmark_report.png)
</details>

The benchmark scores show that a standart list performs equally well when it
comes to accessing its elements. The advantage of using
an [`IdenticalItemsList`][IdenticalItemsList] lies in the fact that
constructing the object is more efficient compared to using the list
constructor `List.filled`.


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

[UnsupportedError]: https://api.dart.dev/dart-core/UnsupportedError-class.html