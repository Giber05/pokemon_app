// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../pokemon_detail_screen.dart';

class _AboutSection extends StatelessWidget {
  const _AboutSection({
    Key? key,
    required this.pokemon,
    required this.species,
  }) : super(key: key);
  final PokemonDetailModel pokemon;
  final PokemonSpeciesModel species;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoTile(
              title: "Height",
              infoValue: "${pokemon.height} meters",
            ),
            const SizedBox(height: 10),
            _InfoTile(
              title: "Weight",
              infoValue: "${pokemon.weight} kg",
            ),
            const SizedBox(height: 10),
            _InfoTile(
              title: "Habitat",
              infoValue: species.habitat.capitalize(),
            ),
            const SizedBox(height: 10),
            _InfoTile(
              title: "Growth rate",
              infoValue: species.growthRate.capitalize(),
            ),
            const SizedBox(height: 10),
            _InfoTile(
              title: "Egg Groups",
              infoValue: species.eggGroups
                  .map((e) => e)
                  .toList()
                  .join(', ')
                  .capitalize(),
            ),
            const SizedBox(height: 20),
            const Text(
              'Abilities',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: pokemon.abilities
                  .map((e) => Tag(
                        title: e,
                        tagColor: pokemon.color,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 20),
            _InfoTile(
                title: "Evolves from",
                infoValue: species.evolvesFromSpecies.isEmpty
                    ? '-'
                    : species.evolvesFromSpecies.capitalize()),
          ],
        ),
      ),
    );
  }
}
