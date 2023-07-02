import 'package:auto_route/auto_route.dart';
import 'package:pokemon_app/infrastructure/routing/router.gr.dart';

///
///
/// flutter pub run build_runner build --delete-conflicting-outputs
///

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PokemonsRoute.page, initial: true),
        AutoRoute(page: PokemonDetailRoute.page),
        AutoRoute(page: StackTraceRoute.page),
      ];
}
