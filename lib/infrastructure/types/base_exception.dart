const unknownError = "Error tidak diketahui";

class BaseException implements Exception {
  final String message;

  const BaseException(this.message);

  factory BaseException.unknownError() => const BaseException(unknownError);
}
