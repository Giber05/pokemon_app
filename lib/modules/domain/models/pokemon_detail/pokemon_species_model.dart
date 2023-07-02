// ignore_for_file: public_member_api_docs, sort_constructors_first

class PokemonSpeciesModel {
  final String evolvesFromSpecies;
  final String growthRate;
  final int evolutionId;
  final String habitat;
  final List<String> eggGroups;
  PokemonSpeciesModel({
    required this.evolvesFromSpecies,
    required this.growthRate,
    required this.evolutionId,
    required this.habitat,
    required this.eggGroups,
  });
}
