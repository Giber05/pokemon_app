import 'package:pokemon_app/infrastructure/architecture/mapper.dart';
import 'package:pokemon_app/infrastructure/utils/pokemon_url_util.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_species_model.dart';

class PokemonSpeciesMapper extends JSONMapper<PokemonSpeciesModel> {
  @override
  PokemonSpeciesModel fromJSON(json) {
    final evolvesFromSpecies = json['evolves_from_species'] != null
        ? json['evolves_from_species']['name']
        : '';
    final growthRate = json['growth_rate']['name'] ?? '';
    final evolutionId = PokemonURLUtil.extractIdFromUrl(json['evolution_chain']['url']);
    final habitat = json['habitat'] != null ? json['habitat']['name'] : '';
    final eggGroups = (json['egg_groups'] as List<dynamic>)
        .map((group) => group['name'] as String)
        .toList();
    return PokemonSpeciesModel(
      evolvesFromSpecies: evolvesFromSpecies,
      growthRate: growthRate,
      evolutionId: evolutionId,
      habitat: habitat,
      eggGroups: eggGroups,
    );
  }

  @override
  toJSON(PokemonSpeciesModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }

 
}
