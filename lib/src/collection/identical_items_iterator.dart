class IdenticalItemsIterator<E>({
  /// The value of all iterator elements.
  required E value,

  /// The number of elements. Must be larger than 0.
  /// If an unsuitable length is provided, the default value of 1
  /// is used instead.
  int length = 1,
}) implements Iterator<E> {
  this : _position = -1;

  /// The length of the iterated iterable.
  final int length = (length > 0) ? length : 1;

  /// The current position.
  int _position;

  @override
  final E current = value;

  @override
  bool moveNext() {
    _position++;
    if (_position >= length) {
      return false;
    }
    return true;
  }
}
