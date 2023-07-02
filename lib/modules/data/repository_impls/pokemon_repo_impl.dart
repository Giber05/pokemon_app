import 'package:injectable/injectable.dart';
import 'package:pokemon_app/infrastructure/types/paginated/paginated.dart';
import 'package:pokemon_app/infrastructure/types/repo_result.dart';
import 'package:pokemon_app/modules/data/datasources/remote/sources/pokemons/pokemon_remote_dts.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_detail_wrapper_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';
import 'package:pokemon_app/modules/domain/repositories/pokemon_repo.dart';

@Injectable(as: PokemonRepo)
class PokemonRepoImpl implements PokemonRepo {
  final PokemonRemoteDts _pokemonRemoteDts;

  PokemonRepoImpl(this._pokemonRemoteDts);
  @override
  Future<Result<Paginated<List<PokemonModel>>>> getPokemons(
      {required int size, required int page}) async {
    return await _pokemonRemoteDts.getPokemons(size: size, page: page);
  }

  @override
  Future<Result<PokemonDetailWrapperModel>> getPokemonDetail(int id) async {
    final pokemonDetail = (await _pokemonRemoteDts.getPokemonDetail(id)).data;
    final pokemonSpecies = (await _pokemonRemoteDts.getPokemonSpecies(id)).data;
    final pokemonEvolution = (await _pokemonRemoteDts
            .getPokemonEvolutions(pokemonSpecies.evolutionId))
        .data;
    return Result(
      data: PokemonDetailWrapperModel(
        pokemonDetail: pokemonDetail,
        pokemonSpecies: pokemonSpecies,
        pokemonEvolution: pokemonEvolution,
      ),
      message: 'Fetch data success',
    );
  }
}
