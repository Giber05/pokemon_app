extension ListExtensions<E> on List<E> {
  List<T> mapIndexed<T>(T Function(int index, E item) f) {
    List<T> result = [];
    for (int i = 0; i < length; i++) {
      result.add(f(i, this[i]));
    }
    return result;
  }
}