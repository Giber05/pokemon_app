import 'package:pokemon_app/infrastructure/architecture/mapper.dart';
import 'package:pokemon_app/infrastructure/constant/network_constants.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class PokemonMapper extends JSONMapper<PokemonModel> {
  @override
  fromJSON(json) {
    final String name = json['name'];
    final String imageUrl =
        '${NetworkConstants.baseImageUrl}/${json['url'].split('/')[6]}.png';
    final int id = int.parse(json['url'].split('/')[6]);
    return PokemonModel(
        id: id,
        name: toBeginningOfSentenceCase(name) ?? name,
        imageUrl: imageUrl);
  }

  @override
  toJSON(data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
}
