import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/infrastructure/ext/dynamic_ext.dart';
import 'package:pokemon_app/infrastructure/routing/router.gr.dart';
import 'package:pokemon_app/infrastructure/service_locator/locator_container.dart';
import 'package:pokemon_app/infrastructure/utils/path/image_path.dart';
import 'package:pokemon_app/infrastructure/widgets/loading/loading_indicator.dart';
import 'package:pokemon_app/infrastructure/widgets/loading/pika_loading.dart';
import 'package:pokemon_app/modules/presentation/features/pokemons/cubit/pokemons_cubit.dart';
import 'package:pokemon_app/modules/presentation/features/pokemons/screens/widgets/pokemon_card.dart';
import 'package:pokemon_app/modules/presentation/widgets/pokeball_background.dart';

part 'widgets/main_content.dart';

@RoutePage()
class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PokemonsCubit>()..getPokemons(),
      child: PokeballBackground(child: Builder(builder: (context) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<PokemonsCubit>().getPokemons();
          },
          child: Stack(
            children: [
              ListView(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                child: _MainContent(),
              )
            ],
          ),
        );
      })),
    );
  }
}
