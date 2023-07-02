import 'package:pokemon_app/infrastructure/architecture/mapper.dart';
import 'package:pokemon_app/infrastructure/constant/network_constants.dart';
import 'package:pokemon_app/infrastructure/utils/pokemon_url_util.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_evolution_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';

class PokemonEvolutionMapper extends JSONMapper<PokemonEvolutionModel> {
  @override
  PokemonEvolutionModel fromJSON(json) {
    final List<PokemonModel> evolutions = [];
    final List<int> evolutionLevels = [];

    var currentChain = json['chain'];
    while (currentChain != null) {
      final species = currentChain['species'];
      final id = PokemonURLUtil.extractIdFromUrl(species['url']);
      final pokemon = PokemonModel(
        id: id,
        name: species['name'],
        imageUrl: _getImageUrl(id),
      );

      final evolutionDetails = currentChain['evolves_to'];
      if (evolutionDetails.isNotEmpty) {
        final minLevel = evolutionDetails[0]['evolution_details'][0]
                    ['min_level'] ==
                null
            ? 0
            : evolutionDetails[0]['evolution_details'][0]['min_level'] as int;
        evolutions.add(pokemon);
        evolutionLevels.add(minLevel);
        currentChain = evolutionDetails[0];
      } else {
        evolutions.add(pokemon);
        evolutionLevels.add(0);
        currentChain = null;
      }
    }

    return PokemonEvolutionModel(
      evolutions: evolutions,
      evolutionLevels: evolutionLevels,
    );
  }

  @override
  toJSON(PokemonEvolutionModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }

  String _getImageUrl(int pokemonId) {
    return '${NetworkConstants.baseImageUrl}/$pokemonId.png';
  }
}
