// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:pokemon_app/modules/presentation/features/pokemon_detail/screens/pokemon_detail_screen.dart'
    as _i3;
import 'package:pokemon_app/modules/presentation/features/pokemons/screens/pokemons_screen.dart'
    as _i1;
import 'package:pokemon_app/modules/presentation/features/stacktrace/screens/stacktrace_screen.dart'
    as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PokemonsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.PokemonsScreen(),
      );
    },
    StackTraceRoute.name: (routeData) {
      final args = routeData.argsAs<StackTraceRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.StackTraceScreen(
          key: args.key,
          stackTrace: args.stackTrace,
          error: args.error,
        ),
      );
    },
    PokemonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PokemonDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.PokemonsScreen]
class PokemonsRoute extends _i4.PageRouteInfo<void> {
  const PokemonsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PokemonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.StackTraceScreen]
class StackTraceRoute extends _i4.PageRouteInfo<StackTraceRouteArgs> {
  StackTraceRoute({
    _i5.Key? key,
    required StackTrace stackTrace,
    required Object error,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          StackTraceRoute.name,
          args: StackTraceRouteArgs(
            key: key,
            stackTrace: stackTrace,
            error: error,
          ),
          initialChildren: children,
        );

  static const String name = 'StackTraceRoute';

  static const _i4.PageInfo<StackTraceRouteArgs> page =
      _i4.PageInfo<StackTraceRouteArgs>(name);
}

class StackTraceRouteArgs {
  const StackTraceRouteArgs({
    this.key,
    required this.stackTrace,
    required this.error,
  });

  final _i5.Key? key;

  final StackTrace stackTrace;

  final Object error;

  @override
  String toString() {
    return 'StackTraceRouteArgs{key: $key, stackTrace: $stackTrace, error: $error}';
  }
}

/// generated route for
/// [_i3.PokemonDetailScreen]
class PokemonDetailRoute extends _i4.PageRouteInfo<PokemonDetailRouteArgs> {
  PokemonDetailRoute({
    _i5.Key? key,
    required int id,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          PokemonDetailRoute.name,
          args: PokemonDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailRoute';

  static const _i4.PageInfo<PokemonDetailRouteArgs> page =
      _i4.PageInfo<PokemonDetailRouteArgs>(name);
}

class PokemonDetailRouteArgs {
  const PokemonDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'PokemonDetailRouteArgs{key: $key, id: $id}';
  }
}
