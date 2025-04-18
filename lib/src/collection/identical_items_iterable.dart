import 'identical_items_iterator.dart';

/// An efficient iterable with [length] identical elements.
/// The value of all elements is [value].
///
/// ---
/// The number of elements be larger than 0.
/// If an unsuitable [length is provided, the default value of 1
/// is used instead.
class SingleValueIterable<E> extends Iterable<E> {
  SingleValueIterable({required this.value, int length = 1})
    : length = (length > 0) ? length : 1;

  /// The value of the identical elements in this iterable.
  final E value;

  @override
  E get first => value;

  @override
  E get last => value;

  @override
  final int length;

  @override
  Iterator<E> get iterator =>
      IdenticalItemsIterator(value: first, length: length);
}
