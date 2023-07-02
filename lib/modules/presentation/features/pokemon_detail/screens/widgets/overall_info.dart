part of '../pokemon_detail_screen.dart';

class _OverallInfo extends StatefulWidget {
  const _OverallInfo({
    Key? key,
  }) : super(key: key);

  @override
  _OverallInfoState createState() => _OverallInfoState();
}

class _OverallInfoState extends State<_OverallInfo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Positioned(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: size.height * .6,
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: _tabController,
                labelColor: Colors.black, // Warna tab yang dipilih
                unselectedLabelColor:
                    Colors.grey, // Warna tab yang tidak dipilih
                tabs: const [
                  Tab(text: 'About'),
                  Tab(text: 'Base Stats'),
                  Tab(text: 'Evolution'),
                  Tab(text: 'Moves'),
                ],
                onTap: (index) {},
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
                  builder: (context, state) {
                    if (state is PokemonDetailLoaded) {
                      return TabBarView(
                        controller: _tabController,
                        children: [
                          // About Tab Content
                          _AboutSection(
                            pokemon: state.pokemon.pokemonDetail,
                            species: state.pokemon.pokemonSpecies,
                          ),
                          // Base Stats Tab Content
                          _BaseStatsSection(
                              pokemon: state.pokemon.pokemonDetail),
                          // Evolution Tab Content
                          _EvolutionSection(
                              pokemon: state.pokemon.pokemonEvolution),
                          // Moves Tab Content
                          _MovesSection(pokemon: state.pokemon.pokemonDetail)
                        ],
                      );
                    }
                    return const Center(
                      child: PikaLoading(
                        size: 200,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
