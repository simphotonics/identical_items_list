import 'dart:math';

import 'identical_items_iterable.dart';
import 'identical_items_iterator.dart';

final unsupportedError = UnsupportedError('Cannot modify an unmodifiable list');

/// Efficient representation of a list with [length] identical elements with
/// value [value].
///
/// ---
/// The number of elements must be larger than 0.
/// If an unsuitable [length] is provided, the default value of 1
/// is used instead.
class IdenticalItemsList<E> implements List<E> {
  const IdenticalItemsList({required this.value, int length = 1})
    : length = (length > 0) ? length : 1;

  /// The value of the identical elements in this list.
  final E value;

  @override
  E get first => value;

  @override
  E get last => value;

  @override
  final int length;

  /// Returns a [Iterable] with [length] elements. All elements
  /// have value [first].
  SingleValueIterable<E> get iterable =>
      SingleValueIterable(value: value, length: length);

  @override
  List<E> operator +(List<E> other) {
    return [...iterable, ...other];
  }

  @override
  E operator [](int index) {
    if (index < length) {
      return value;
    } else {
      throw RangeError.index(index, this);
    }
  }

  @override
  void operator []=(int index, E value) {
    throw unsupportedError;
  }

  @override
  void add(E element) {
    throw unsupportedError;
  }

  @override
  void addAll(Iterable<E> iterable) {
    throw unsupportedError;
  }

  @override
  bool any(bool Function(E element) test) => test(value);

  @override
  Map<int, E> asMap() => Map.fromIterable(iterable);

  @override
  List<R> cast<R>() => IdenticalItemsList<R>(value: value as R, length: length);

  @override
  void clear() {
    throw UnimplementedError('Cannot clear a SingleValueList.');
  }

  @override
  bool contains(Object? element) => element == value;

  @override
  E elementAt(int index) {
    if (index < length) {
      return value;
    } else {
      throw RangeError.index(index, this);
    }
  }

  @override
  bool every(bool Function(E element) test) => test(value);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E element) f) {
    return iterable.expand(f);
  }

  @override
  void fillRange(int start, int end, [E? fill]) {
    throw unsupportedError;
  }

  @override
  E firstWhere(bool Function(E element) test, {E Function()? orElse}) {
    if (test(value)) {
      return value;
    } else if (orElse != null) {
      return orElse();
    } else {
      throw StateError(
        'No element satisfies test: $test and '
        '<orElse> is missing.',
      );
    }
  }

  @override
  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) {
    var value = initialValue;
    for (E element in iterable) {
      value = combine(value, element);
    }
    return value;
  }

  @override
  Iterable<E> followedBy(Iterable<E> other) => iterable.followedBy(other);

  @override
  void forEach(void Function(E element) action) => iterable.forEach(action);

  @override
  Iterable<E> getRange(int start, int end) =>
      iterable.skip(start).take(end - start);

  @override
  int indexOf(Object? element, [int start = 0]) {
    if (element == value && start < length) {
      return start;
    } else {
      return -1;
    }
  }

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) {
    if (test(value) && start < length) {
      return start;
    } else {
      return -1;
    }
  }

  @override
  void insert(int index, E element) {
    throw unsupportedError;
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    throw unsupportedError;
  }

  @override
  bool get isEmpty => false;

  @override
  bool get isNotEmpty => true;

  @override
  Iterator<E> get iterator =>
      IdenticalItemsIterator(value: value, length: length);

  @override
  String join([String separator = ""]) => iterable.join(separator);

  @override
  int lastIndexOf(Object? element, [int? start]) {
    if (element != value) {
      return -1;
    }
    if (start == null) {
      return length - 1;
    }
    if (start < 0 || start > length) {
      return length - 1;
    } else {
      return start;
    }
  }

  @override
  int lastIndexWhere(bool Function(E element) test, [int? start]) {
    if (!test(value)) {
      return -1;
    }
    // test(value) must be true.
    if (start == null) {
      return length - 1;
    }
    if (start < 0 || start > length) {
      return length - 1;
    } else {
      return start;
    }
  }

  @override
  E lastWhere(bool Function(E element) test, {E Function()? orElse}) {
    if (test(value)) {
      return value;
    } else if (orElse != null) {
      return orElse();
    } else {
      throw StateError(
        'No element satisfies test: $test and '
        '<orElse> is missing.',
      );
    }
  }

  @override
  Iterable<T> map<T>(T Function(E element) f) => iterable.map<T>(f);

  @override
  E reduce(E Function(E previousValue, E element) combine) =>
      iterable.reduce(combine);

  @override
  bool remove(Object? element) {
    throw unsupportedError;
  }

  @override
  E removeAt(int index) {
    throw unsupportedError;
  }

  @override
  E removeLast() {
    throw unsupportedError;
  }

  @override
  void removeRange(int start, int end) {
    throw unsupportedError;
  }

  @override
  void removeWhere(bool Function(E element) test) {
    throw unsupportedError;
  }

  @override
  void replaceRange(int start, int end, Iterable<E> newContents) {
    throw unsupportedError;
  }

  @override
  void retainWhere(bool Function(E element) test) {
    throw unsupportedError;
  }

  @override
  Iterable<E> get reversed => iterable;

  @override
  void setAll(int index, Iterable<E> iterable) {
    throw unsupportedError;
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    throw unsupportedError;
  }

  @override
  void shuffle([Random? random]) {}

  @override
  E get single => value;

  @override
  E singleWhere(bool Function(E element) test, {E Function()? orElse}) {
    if (test(value) && length == 1) {
      return value;
    } else if (orElse != null) {
      return orElse();
    } else {
      throw StateError(
        'There is no single element that satisfies test: $test '
        'and <orElse> is missing',
      );
    }
  }

  @override
  Iterable<E> skip(int count) => iterable.skip(count);

  @override
  Iterable<E> skipWhile(bool Function(E element) test) =>
      iterable.skipWhile(test);

  @override
  void sort([int Function(E a, E b)? compare]) {}

  @override
  List<E> sublist(int start, [int? end]) {
    if (end != null && end - start > 0) {
      return IdenticalItemsList(value: value, length: end - start);
    } else if (length - start > 0) {
      return IdenticalItemsList(value: value, length: length - start);
    } else {
      return [];
    }
  }

  @override
  Iterable<E> take(int count) => iterable.take(count);

  @override
  Iterable<E> takeWhile(bool Function(E element) test) =>
      iterable.takeWhile(test);

  @override
  List<E> toList({bool growable = true}) =>
      List.filled(length, value, growable: growable);

  @override
  Set<E> toSet() => {value};

  @override
  Iterable<E> where(bool Function(E element) test) => iterable.where(test);

  @override
  Iterable<T> whereType<T>() => iterable.whereType<T>();

  @override
  set last(E value) {
    throw unsupportedError;
  }

  @override
  String toString() {
    final b = StringBuffer('[');
    if (length < 10) {
      b.writeAll(iterable, ', ');
      b.write(']');
    } else {
      b.writeAll(iterable.take(5), ', ');
      b.write(', ..., ');
      b.writeAll(iterable.take(2), ', ');
      b.write(']');
    }
    return b.toString();
  }

  @override
  set first(E value) {
    throw unsupportedError;
  }

  @override
  set length(int newLength) {
    throw unsupportedError;
  }
}
