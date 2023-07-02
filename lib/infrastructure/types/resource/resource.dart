

import 'package:pokemon_app/infrastructure/types/base_exception.dart';
import 'package:pokemon_app/infrastructure/types/repo_result.dart';

part 'success.dart';
part 'error.dart';

abstract class Resource<T> {
  static Resource<T> success<T>(T data, String message) =>
      _Success<T>(data, message);

  static Resource<T> error<T>(BaseException exception) => _Error<T>(exception);

  when(
      {void Function(T data)? success,
      void Function(BaseException exception)? error}) {
    final current = this;
    if (current is _Success<T>) {
      success?.call(current.data);
      return;
    }
    if (current is _Error<T>) {
      error?.call(current.exception);
    }
  }

  bool get isSuccess => this is _Success<T>;

  bool get isError => this is _Error<T>;

  whenWithMessage(
      {void Function(T data, String message)? success,
      void Function(BaseException exception)? error}) {
    final current = this;
    if (current is _Success<T>) {
      success?.call(current.data, current.message);
      return;
    }
    if (current is _Error<T>) {
      error?.call(current.exception);
    }
  }
}

extension RepoResultResourceExt<T> on Future<Result<T>> {
  Future<Resource<T>> get asFutureResource async {
    return (await this).asResource;
  }
}
