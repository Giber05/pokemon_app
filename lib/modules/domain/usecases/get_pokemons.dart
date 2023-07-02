// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/infrastructure/architecture/usecase.dart';
import 'package:pokemon_app/infrastructure/types/paginated/paginated.dart';
import 'package:pokemon_app/infrastructure/types/resource/resource.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';
import 'package:pokemon_app/modules/domain/repositories/pokemon_repo.dart';

class GetPokemonsParams {
  final int size;
  final int page;
  GetPokemonsParams({
    required this.size,
    required this.page,
  });
}

@injectable
class GetPokemons
    extends Usecase<GetPokemonsParams, Paginated<List<PokemonModel>>> {
  final PokemonRepo _pokemonRepo;

  GetPokemons(this._pokemonRepo);
  @override
  Future<Resource<Paginated<List<PokemonModel>>>> execute(
          GetPokemonsParams params) async =>
      _pokemonRepo
          .getPokemons(size: params.size, page: params.page)
          .asFutureResource;
}
