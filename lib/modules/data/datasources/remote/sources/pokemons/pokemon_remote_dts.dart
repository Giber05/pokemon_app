import 'package:pokemon_app/infrastructure/types/api_result.dart';
import 'package:pokemon_app/infrastructure/types/paginated/paginated.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_evolution_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_species_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';

abstract class PokemonRemoteDts {
  Future<APIResult<Paginated<List<PokemonModel>>>> getPokemons({ required int size,required int page});
  Future<APIResult<PokemonDetailModel>> getPokemonDetail(int id);
  Future<APIResult<PokemonSpeciesModel>> getPokemonSpecies(int id);
  Future<APIResult<PokemonEvolutionModel>> getPokemonEvolutions(int id);
}
