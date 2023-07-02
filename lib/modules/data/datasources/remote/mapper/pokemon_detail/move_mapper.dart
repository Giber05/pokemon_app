import 'package:pokemon_app/infrastructure/architecture/mapper.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/move_model.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class MoveMapper extends JSONMapper<MoveModel> {
  @override
  MoveModel fromJSON(json) {
    final name = json['move']['name'] as String;

    return MoveModel(name: toBeginningOfSentenceCase(name)!);
  }

  @override
  toJSON(MoveModel data) {
    // TODO: implement toJSON
    throw UnimplementedError();
  }
}
