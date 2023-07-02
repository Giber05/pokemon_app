// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../pokemon_detail_screen.dart';

class _MovesSection extends StatelessWidget {
  const _MovesSection({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final PokemonDetailModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: SingleChildScrollView(
        child: Wrap(
            runSpacing: 8,
            spacing: 8,
            children: pokemon.moves
                .map((e) => Tag(
                      title: e.name,
                      tagColor: pokemon.color,
                    ))
                .toList()),
      ),
    );
  }
}
