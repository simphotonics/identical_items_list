import 'package:test/test.dart';
import 'package:identical_items_list/identical_items_list.dart';

void main() {
  final i1 = IdenticalItemsIterable(value: 'a', length: 10);

  group(' Iterable length:', () {
    test('default', () {
      expect(IdenticalItemsIterable(value: 1).length, 1);
    });
    test('10', () {
      expect(i1.length, 10);
    });
    test('-10', () {
      final i1 = IdenticalItemsIterable(value: 'a', length: -10);
      expect(i1.length, 1);
    });
  });
  group(' Getters:', () {
    test('first', () {
      expect(i1.first, 'a');
    });
    test('last', () {
      expect(i1.last, 'a');
    });
    test('at index 5', () {
      expect(i1.elementAt(5), 'a');
    });
  });
  group('Operators:', () {
    test('out of range', () {
      expect(() => i1.elementAt(5000), throwsRangeError);
    });

    test('followedBy', () {
      final i2 = IdenticalItemsIterable(value: 'a', length: 2);
      final i3 = IdenticalItemsIterable(value: 'b');
      expect(i2.followedBy(i3), ['a', 'a', 'b']);
    });
  });

  group('Comparison:', () {
    final i1 = IdenticalItemsIterable(value: 1, length: 5);
    final i2 = IdenticalItemsIterable(value: 1, length: 5);
    test('== ', () {
      expect(i1 == i2, isFalse);
    });
    test('identical', () {
      expect(identical(i1, i2), isFalse);
    });
  });
  group('Comparison Const:', () {
    final i1 = const IdenticalItemsIterable(value: 1, length: 5);
    final i2 = const IdenticalItemsIterable(value: 1, length: 5);
    test('== ', () {
      expect(i1 == i2, isTrue);
    });
    test('identical', () {
      expect(identical(i1, i2), isTrue);
    });
  });
}
