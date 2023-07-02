// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../pokemon_detail_screen.dart';

class _BaseStatsSection extends StatelessWidget {
  const _BaseStatsSection({
    Key? key,
    required this.pokemon,
  }) : super(key: key);
  final PokemonDetailModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: pokemon.stats
              .map((stat) => Column(
                    children: [
                      _InfoTile(
                        title: stat.name,
                        infoValue: stat.baseValue.toString(),
                        additionalWidget: LinearProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(stat.colorStats),
                            backgroundColor: Colors.black.withOpacity(.1),
                            value: stat.baseValue.toDouble() /
                                AppConstants.maxStats),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
