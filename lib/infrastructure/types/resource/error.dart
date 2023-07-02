part of 'resource.dart';

class _Error<T> extends Resource<T> {
  final BaseException exception;

  _Error(this.exception);
}
