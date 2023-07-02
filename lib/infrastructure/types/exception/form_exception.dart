
import 'package:pokemon_app/infrastructure/types/base_exception.dart';

class FormException extends BaseException {
  final Map<String, List<String>> errors;

  const FormException(super.message, this.errors);

  Map<String, String> get flattenError => {
        for (final error in errors.entries)
          if (error.value.isNotEmpty) error.key: error.value.first
      };
  Map<String, String> get joinnedError {
    Map<String, String> mapWithStringValues = {};
    for (var key in errors.keys) {
      mapWithStringValues[key] = errors[key]!.join(', ');
    }
    return mapWithStringValues;
  }
}
