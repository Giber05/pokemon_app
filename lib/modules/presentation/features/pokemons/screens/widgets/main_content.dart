part of '../pokemons_screen.dart';

class _MainContent extends StatelessWidget {
  const _MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            ImagePath.pokemonLogo,
            width: 200,
          ),
        ),
        const SizedBox(height: 24),
        const Expanded(
          child: _PokemonGrid(),
        ),
      ],
    );
  }
}

class _PokemonGrid extends StatefulWidget {
  const _PokemonGrid({
    super.key,
  });

  @override
  State<_PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<_PokemonGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<PokemonsCubit>().getMorePokemons();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonsCubit, PokemonsState>(
      builder: (context, state) {
        if (state is PokemonsLoading) {
          return const Center(
            child: LoadingIndicator(),
          );
        }
        if (state is PokemonsLoaded) {
          final pokemons = state.pokemons;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pokedex',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Stack(
                  children: [
                    GridView.builder(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2.responsive(context, lg: 6, md: 4, sm: 3, xs: 3),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.hasReachedMax
                          ? pokemons.length
                          : pokemons.length + 1,
                      itemBuilder: (context, index) {
                        if (index < pokemons.length) {
                          final pokemon = pokemons[index];
                          return PokemonCard(
                            pokemon,
                            onPress: () {
                              context.router.push( PokemonDetailRoute(id: pokemon.id));
                            },
                          );
                        }
                        return state.isLoading
                            ? const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Center(child: PikaLoading()),
                              )
                            : const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
