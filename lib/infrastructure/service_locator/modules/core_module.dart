import 'package:injectable/injectable.dart';
import 'package:pokemon_app/infrastructure/routing/router.dart';

@module
abstract class CoreModule {
  @singleton
  AppRouter getAppRouter() {
    return AppRouter();
  }
}
