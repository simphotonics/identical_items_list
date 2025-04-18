import 'package:identical_items_list/identical_items_list.dart';

void main(List<String> args) {
  final list = IdenticalItemsList(value: 42, length: 10);

  // Creating an IdenticalItemsIterator
  final it = list.iterator;
  int index = 0;

  while (it.moveNext()) {
    print('${index++}: ${it.current}');
  }
}
