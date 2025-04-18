import 'package:test/test.dart';
import 'package:identical_items_list/identical_items_list.dart';

void main() {
  group(' List length:', () {
    test('default', () {
      final l1 = IdenticalItemsList(value: 'a');
      expect(l1.length, 1);
    });
    test('-10', () {
      final l1 = IdenticalItemsList(value: 'a', length: -10);
      expect(l1.length, 1);
    });
    test('10000', () {
      final l1 = IdenticalItemsList(value: 'a', length: 10000);
      expect(l1.length, 10000);
    });
  });
  group(' Getters:', () {
    test('first', () {
      final l1 = IdenticalItemsList(value: 'a');
      expect(l1.first, 'a');
    });
    test('last', () {
      final l1 = IdenticalItemsList(value: 'a', length: 10);
      expect(l1.last, 'a');
    });
    test('at index 5', () {
      final l1 = IdenticalItemsList(value: 'a', length: 10000);
      expect(l1[5], 'a');
    });
  });
  group('Operators:', () {
    test('[5]', () {
      final l1 = IdenticalItemsList(value: 'a', length: 1000);
      expect(l1[5], 'a');
    });
    test('[out of range]', () {
      final l1 = IdenticalItemsList(value: 'a', length: 1000);
      expect(() => l1[5000], throwsRangeError);
    });

    test('+', () {
      final l1 = IdenticalItemsList(value: 'a', length: 2);
      final l2 = IdenticalItemsList(value: 'b');
      expect(l1 + l2, ['a', 'a', 'b']);
    });
  });
  group('Unmodifiable:', () {
    test('[] = ', () {
      final l1 = IdenticalItemsList(value: 'a', length: 1000);
      expect(() => l1[5] = 'not allowed', throwsA(unsupportedError));
    });
    test('add', () {
      final l1 = IdenticalItemsList(value: 'a', length: 1000);
      expect(() => l1.add('not allowed'), throwsA(unsupportedError));
    });
  });
  group('Comparison:', () {
    final l1 = IdenticalItemsList(value: 1, length: 5);
    final l2 = IdenticalItemsList(value: 1, length: 5);
    test('== ', () {
      expect(l1 == l2, isFalse);
    });
    test('identical', () {
      expect(identical(l1, l2), isFalse);
    });
  });
  group('Comparison Const:', () {
    final l1 = const IdenticalItemsList(value: 1, length: 5);
    final l2 = const IdenticalItemsList(value: 1, length: 5);
    test('== ', () {
      expect(l1 == l2, isTrue);
    });
    test('identical', () {
      expect(identical(l1, l2), isTrue);
    });
  });
}
