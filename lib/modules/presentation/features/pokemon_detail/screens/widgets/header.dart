part of '../pokemon_detail_screen.dart';

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: InkWell(
              onTap: () {
                context.router.pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.2),
                    borderRadius: BorderRadius.circular(100)),
                child:
                    const Icon(Icons.arrow_back, size: 20, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
                builder: (context, state) {
                  if (state is PokemonDetailLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                toBeginningOfSentenceCase(state.pokemon.pokemonDetail.name) ??
                                    '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Wrap(
                                  spacing: 8,
                                  children: state.pokemon.pokemonDetail.types
                                      .map((e) => Tag(
                                          title: toBeginningOfSentenceCase(e)!))
                                      .toList())
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '#${state.pokemon.pokemonDetail.id}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              )),
        ],
      ),
    );
  }
}
