import 'package:flutter/material.dart';
import 'package:pokemon_app/infrastructure/constant/color_constant.dart';
import 'package:pokemon_app/infrastructure/ext/dynamic_ext.dart';
import 'package:pokemon_app/infrastructure/utils/path/image_path.dart';

import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';
import 'package:pokemon_app/modules/presentation/widgets/pokemon_image.dart';

class PokemonCard extends StatelessWidget {
  static const double _pokeballFraction = 0.75;
  static const double _pokemonFraction = 0.76;

  final PokemonModel pokemon;
  final void Function()? onPress;

  const PokemonCard(
    this.pokemon, {
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: ColorConstant.whiteGrey,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.4),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, .5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: Colors.grey.withOpacity(.3),
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPokeballDecoration(height: itemHeight),
                    _buildPokemon(height: itemHeight),
                    _buildPokemonNumber(context),
                    _CardContent(pokemon),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPokeballDecoration({required double height}) {
    final pokeballSize = height * _pokeballFraction;

    return Positioned(
      bottom: -height * 0.13,
      right: -height * 0.03,
      child: Image.asset(
        ImagePath.pokeball,
        width: pokeballSize,
        height: pokeballSize,
        color: ColorConstant.whiteGrey,
      ),
    );
  }

  Widget _buildPokemon({required double height}) {
    final pokemonSize = height * _pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: PokemonImage(
        height: pokemonSize,
        width: pokemonSize,
        pokemon: pokemon,
      ),
    );
  }

  Widget _buildPokemonNumber(BuildContext context) {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        '# ${pokemon.id}',
        style: TextStyle(
          fontSize: 14.0.responsive(context, lg: 24, md: 20, sm: 16),
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final PokemonModel pokemon;

  const _CardContent(this.pokemon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 35, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: pokemon.id.toString() + pokemon.name,
              child: Text(
                pokemon.name,
                style: TextStyle(
                  fontSize:
                      16.0.responsive(context, lg: 30, md: 25, sm: 25, xs: 20),
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.primary,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
