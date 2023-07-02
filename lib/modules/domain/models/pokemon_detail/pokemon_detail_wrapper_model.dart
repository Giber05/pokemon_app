// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_evolution_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_species_model.dart';

class PokemonDetailWrapperModel {
  final PokemonDetailModel pokemonDetail;
  final PokemonSpeciesModel pokemonSpecies;
  final PokemonEvolutionModel pokemonEvolution;
  PokemonDetailWrapperModel({
    required this.pokemonDetail,
    required this.pokemonSpecies,
    required this.pokemonEvolution,
  });
}
