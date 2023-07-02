import 'package:pokemon_app/infrastructure/architecture/mapper.dart';
import 'package:pokemon_app/infrastructure/utils/color/pokemon_color.dart';
import 'package:pokemon_app/modules/data/datasources/remote/mapper/pokemon_detail/move_mapper.dart';
import 'package:pokemon_app/modules/data/datasources/remote/mapper/pokemon_detail/stats_mapper.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class PokemonDetailMapper extends JSONMapper<PokemonDetailModel> {
  @override
  PokemonDetailModel fromJSON(json) {
    final name = json['name'] as String;

    final types = (json['types'] as List<dynamic>)
        .map((type) => type['type']['name'] as String)
        .toList();

    final id = json['id'] as int;

    final imageUrl =
        json['sprites']['other']['official-artwork']['front_default'] as String;

    final height =
        json['height'] / 10; // Convert height from decimetres to metres
    final weight =
        json['weight'] / 10; // Convert weight from hectograms to kilograms

    final abilities = json['abilities'] as List<dynamic>;
    final abilityNames = abilities
        .map((ability) =>
            toBeginningOfSentenceCase(ability['ability']['name'] as String)!)
        .toList();

    final stats = (json['stats'] as List<dynamic>)
        .map((stat) => StatsMapper().fromJSON(stat as Map<String, dynamic>))
        .toList();

    final moves = (json['moves'] as List<dynamic>)
        .map((move) => MoveMapper().fromJSON(move as Map<String, dynamic>))
        .toList();

    final color = PokemonColorUtil.colorGenerator(types[0]);
    return PokemonDetailModel(
      name: name,
      types: types,
      id: id,
      imageUrl: imageUrl,
      height: height,
      weight: weight,
      abilities: abilityNames,
      stats: stats,
      moves: moves,
      color: color,
    );
  }

  @override
  toJSON(PokemonDetailModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
}
