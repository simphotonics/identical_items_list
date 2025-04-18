import 'package:identical_items_list/identical_items_list.dart';

void main(List<String> args) {
  final list = IdenticalItemsList(value: 42, length: 1000000);

  print('List: $list \n');

  // ignore: unnecessary_type_check
  print('Type: list is List<int>: ${list is List<int>} \n');

  print('Length: ${list.length} \n');

  final sum = list.reduce((previousValue, item) => previousValue + item);
  print('Sum: $sum \n');

  print('Access: list[5764] = ${list[5764]}');
}
