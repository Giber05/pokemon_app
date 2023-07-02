import 'package:flutter/material.dart';
import 'package:pokemon_app/infrastructure/constant/app_constants.dart';
import 'package:pokemon_app/infrastructure/routing/router.dart';
import 'package:pokemon_app/infrastructure/routing/router.gr.dart';
import 'package:pokemon_app/infrastructure/service_locator/locator_container.dart';
import 'package:pokemon_app/infrastructure/types/base_exception.dart';
import 'package:pokemon_app/infrastructure/types/resource/resource.dart';


///
/// ```dart
/// class TestUseCase extends Usecase<NoParams, int> {
///  @override
///  Future<Resource<int>> execute(NoParams params) async {
///    await Future.delayed(const Duration(seconds: 5));
///    return Resource.success(1, "");
///  }
/// }
/// ```
///
///
abstract class Usecase<Params, Result> {
  Future<Resource<Result>> execute(Params params);

  Future<Resource<Result>> call(Params params) async {
    try {
      final result = await execute(params);
      return result;
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      return await handleError(e, stacktrace);
    }
  }

  Future<Resource<Result>> handleError(Object e, StackTrace stackTrace) async {
    if (AppConstants.isDevelopment) {
      getIt<AppRouter>()
          .push(StackTraceRoute(stackTrace: stackTrace, error: e));
    }
    if (e is! BaseException) {
      return Resource.error<Result>(BaseException.unknownError());
    }

    return Resource.error(e);
  }
}
