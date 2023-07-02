// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/infrastructure/constant/app_constants.dart';
import 'package:pokemon_app/infrastructure/ext/string_ext.dart';
import 'package:pokemon_app/infrastructure/service_locator/locator_container.dart';
import 'package:pokemon_app/infrastructure/utils/path/image_path.dart';
import 'package:pokemon_app/infrastructure/widgets/loading/pika_loading.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_evolution_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_species_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';
import 'package:pokemon_app/modules/presentation/features/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokemon_app/modules/presentation/widgets/pokemon_image.dart';
import 'package:pokemon_app/modules/presentation/widgets/rotating_image.dart';
import 'package:pokemon_app/modules/presentation/widgets/tag.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

part 'widgets/background_decoration.dart';
part 'widgets/header.dart';
part 'widgets/overall_info.dart';
part 'widgets/pokemon.dart';
part 'widgets/info_tile.dart';
part 'widgets/overall_info_section/about_section.dart';
part 'widgets/overall_info_section/base_stats_section.dart';
part 'widgets/overall_info_section/evolution_section.dart';
part 'widgets/overall_info_section/moves_section.dart';

@RoutePage()
class PokemonDetailScreen extends StatelessWidget {
  final int id;
  const PokemonDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PokemonDetailCubit>()..getPokemonDetail(id),
      child: Builder(builder: (context) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<PokemonDetailCubit>().getPokemonDetail(id);
            },
            child: const CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(
                  child: Stack(
                    children: [
                      _BackgroundDecoration(),
                      _Header(),
                      _OverallInfo(),
                      _Pokemon(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
