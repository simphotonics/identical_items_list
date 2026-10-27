import 'package:test/test.dart';
import 'package:identical_items_list/identical_items_list.dart';

void main() {
  group('Iterator:', () {
    test('moveNext()', () {
      final it = IdenticalItemsIterator(value: 'a', length: 10);
      expect(it.moveNext(), isTrue);
    });
    test('move past length', () {
      final it = IdenticalItemsIterator(value: 'a', length: 1);
      it.moveNext();
      expect(it.moveNext(), isFalse);
    });

    test('loop', () {
      final it = IdenticalItemsIterator(value: 'a', length: 5);
      int i = 0;
      while (it.moveNext()) {
        i++;
      }
      expect(i, it.length);
    });
  });
  group(' Getters:', () {
    test('length', () {
      final it = IdenticalItemsIterator(value: 'a', length: 10);
      expect(it.length, 10);
    });
    test('current', () {
      final it = IdenticalItemsIterator(value: 'a', length: 10);
      it.moveNext();
      expect(it.current, 'a');
    });
  });
}
