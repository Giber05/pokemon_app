

import 'package:pokemon_app/infrastructure/types/json.dart';

abstract class JSONMapper<Data> {
  JSON toJSON(Data data);
  Data fromJSON(JSON json);
}
