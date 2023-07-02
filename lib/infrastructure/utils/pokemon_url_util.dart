class PokemonURLUtil {
  static int extractIdFromUrl(String url) {
    final regex = RegExp(r"\/(\d+)\/$");
    final match = regex.firstMatch(url);
    if (match != null) {
      final idString = match.group(1);
      return int.tryParse(idString ?? "") ?? 0;
    }
    return 0;
  }
}