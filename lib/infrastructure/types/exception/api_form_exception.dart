
import 'package:pokemon_app/infrastructure/types/base_exception.dart';

class APIFormException extends BaseException {
  final Map<String, List<String>> errors;
  const APIFormException(super.message, {required this.errors});
}
