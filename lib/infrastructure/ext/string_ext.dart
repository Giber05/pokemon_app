import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

extension StringExt on String {
  String capitalize() => toBeginningOfSentenceCase(this)!;
}
