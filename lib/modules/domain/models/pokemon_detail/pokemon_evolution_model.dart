
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';

class PokemonEvolutionModel {
  final List<PokemonModel> evolutions;
  final List<int> evolutionLevels;

  PokemonEvolutionModel({
    required this.evolutions,
    required this.evolutionLevels,
  });

 
}

class Evolution {
  final int id;
  final String name;
  final String imageUrl;

  Evolution({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
