part of '../pokemon_detail_screen.dart';

class _Pokemon extends StatelessWidget {
  const _Pokemon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Positioned(
      top: height * .18,
      left: width * .25,
      child: Stack(
        children: [
          RotatingWidget(
            child: Image.asset(
              ImagePath.pokeball,
              height: height / 4,
              width: height / 4,
              color: Colors.white.withOpacity(.3),
            ),
          ),
          BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
            builder: (context, state) {
              if (state is PokemonDetailLoaded) {
                return PokemonImage(
                  pokemon: PokemonModel(
                      id: state.pokemon.pokemonDetail.id,
                      imageUrl: state.pokemon.pokemonDetail.imageUrl,
                      name: state.pokemon.pokemonDetail.name),
                  height: height / 4,
                  width: height / 4,
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
