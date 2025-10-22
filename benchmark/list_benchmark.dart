// ignore_for_file: unused_local_variable
import 'package:benchmark_runner/benchmark_runner.dart';
import 'package:identical_items_list/identical_items_list.dart';

void main() {
  final iiList = IdenticalItemsList(value: 42, length: 1000000);
  final list = List.filled(1000000, 42);

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
