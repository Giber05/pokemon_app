import 'package:pokemon_app/infrastructure/types/paginated/paginated.dart';
import 'package:pokemon_app/infrastructure/types/repo_result.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_detail_wrapper_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';

abstract class PokemonRepo {
  Future<Result<Paginated<List<PokemonModel>>>> getPokemons(
      {required int size, required int page});
  Future<Result<PokemonDetailWrapperModel>> getPokemonDetail(int id);

}
