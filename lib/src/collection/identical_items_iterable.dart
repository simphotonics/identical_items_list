import 'identical_items_iterator.dart';

/// An efficient iterable with [length] identical elements.
///
/// The number of elements be larger than 0.
/// If an unsuitable [length is provided, the default value of 1
/// is used instead.
class const IdenticalItemsIterable<E>(
/// The value of the identical elements in this iterable.
{required final E value, int length = 1})
    extends Iterable<E> {
  @override
  E get first => value;

  @override
  E get last => value;

  @override
  final int length = (length > 0) ? length : 1;

  @override
  Iterator<E> get iterator =>
      IdenticalItemsIterator(value: first, length: length);
}
