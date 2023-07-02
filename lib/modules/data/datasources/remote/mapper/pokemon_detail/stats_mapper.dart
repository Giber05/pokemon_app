import 'package:pokemon_app/infrastructure/architecture/mapper.dart';
import 'package:pokemon_app/infrastructure/utils/color/pokemon_color.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/stats_model.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class StatsMapper extends JSONMapper<StatsModel> {
  @override
  StatsModel fromJSON(json) {
    final originalName = json['stat']['name'] as String;
    final baseValue = json['base_stat'] as int;

    final color = PokemonColorUtil().getColorByStat(originalName);
    final name = toBeginningOfSentenceCase(_replaceSpecialString(originalName));
    return StatsModel(name: name!, baseValue: baseValue, colorStats: color);
  }

  @override
  toJSON(StatsModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }

  String _replaceSpecialString(String inputString) {
    return inputString.replaceAll('special-', 'Sp. ');
  }
}
