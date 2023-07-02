import 'package:injectable/injectable.dart';
import 'package:pokemon_app/infrastructure/architecture/usecase.dart';
import 'package:pokemon_app/infrastructure/types/resource/resource.dart';
import 'package:pokemon_app/modules/domain/repositories/pokemon_repo.dart';

import '../models/pokemon_detail/pokemon_detail_wrapper_model.dart';

class GetPokemonDetailParams {
  final int id;

  GetPokemonDetailParams(this.id);
}

@injectable
class GetPokemonDetail
    extends Usecase<GetPokemonDetailParams, PokemonDetailWrapperModel> {
  final PokemonRepo _pokemonRepo;

  GetPokemonDetail(this._pokemonRepo);
  @override
  Future<Resource<PokemonDetailWrapperModel>> execute(
          GetPokemonDetailParams params) async =>
      _pokemonRepo
          .getPokemonDetail(params.id)
          .asFutureResource;
}
