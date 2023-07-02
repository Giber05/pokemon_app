// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../pokemon_detail_screen.dart';

class _EvolutionSection extends StatelessWidget {
  const _EvolutionSection({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final PokemonEvolutionModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => Divider(height: 58),
            itemCount: pokemon.evolutions.length - 1,
            itemBuilder: (_, index) => _buildRow(
              current: pokemon.evolutions[index],
              next: pokemon.evolutions[index + 1],
              reason: pokemon.evolutionLevels[index].toString(),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildRow({
    required PokemonModel current,
    required PokemonModel next,
    required String reason,
  }) {
    return Row(
      children: <Widget>[
        Expanded(child: _PokemonBall(pokemon: current)),
        Expanded(
          child: Column(
            children: <Widget>[
              Icon(Icons.arrow_forward, color: Colors.grey[200]),
              const SizedBox(height: 7),
              Text('Level $reason',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(child: _PokemonBall(pokemon: next)),
      ],
    );
  }
}

class _PokemonBall extends StatelessWidget {
  final PokemonModel pokemon;

  const _PokemonBall({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final pokeballSize = screenHeight * 0.1;
    final pokemonSize = pokeballSize * 0.85;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              ImagePath.pokeball,
              width: pokeballSize,
              height: pokeballSize,
              color: Colors.grey[200],
            ),
            PokemonImage(
              pokemon: PokemonModel(
                id: pokemon.id,
                imageUrl: pokemon.imageUrl,
                name: pokemon.name,
              ),
              height: pokemonSize,
              width: pokemonSize,
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(pokemon.name.capitalize()),
      ],
    );
  }
}
