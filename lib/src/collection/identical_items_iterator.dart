/// Iterates an [Iterable] with [length] elements. All elements have value
///  [first].
class IdenticalItemsIterator<E> implements Iterator<E> {
  /// Constructs an object of type [IdenticalItemsIterator].
  /// * [first]: The value of all iterator elements.
  /// * [length]: The number of elements. Must be larger than 0.
  /// If an unsuitable length is provided, the default value of 1
  /// is used instead.
  IdenticalItemsIterator({required E value, int length = 1})
    : _position = 0,
      current = value,
      length = (length > 0) ? length : 1;

  /// The length of the underlying iterable.
  final int length;

  /// The current position.
  int _position;

  @override
  final E current;

  @override
  bool moveNext() {
    if (_position >= length) {
      return false;
    }
    _position++;
    return true;
  }
}
