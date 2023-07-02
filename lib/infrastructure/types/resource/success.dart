part of 'resource.dart';

class _Success<T> extends Resource<T> {
  final T data;
  final String message;

  _Success(this.data, this.message);
}
