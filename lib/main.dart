import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/infrastructure/routing/router.dart';
import 'package:pokemon_app/modules/pokemon_app.dart';

import 'infrastructure/service_locator/locator_container.dart';

void main() {
   if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
 WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runApp( PokemonApp(
     appRouter: getIt<AppRouter>(),
  ));
}

