import 'package:injectable/injectable.dart';
import 'package:pokemon_app/infrastructure/http_client/http_client.dart';
import 'package:pokemon_app/infrastructure/types/api_result.dart';
import 'package:pokemon_app/infrastructure/types/paginated/paginated.dart';
import 'package:pokemon_app/modules/data/datasources/remote/mapper/pokemon_detail/pokemon_detail_mapper.dart';
import 'package:pokemon_app/modules/data/datasources/remote/mapper/pokemon_detail/pokemon_evolution_mapper.dart';
import 'package:pokemon_app/modules/data/datasources/remote/mapper/pokemon_detail/pokemon_species_mapper.dart';
import 'package:pokemon_app/modules/data/datasources/remote/mapper/pokemons/pokemon_mapper.dart';
import 'package:pokemon_app/modules/data/datasources/remote/sources/pokemons/pokemon_remote_dts.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_detail_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_evolution_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_species_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';

@Injectable(as: PokemonRemoteDts)
class PokemonRemoteDtsImpl implements PokemonRemoteDts {
  PokemonRemoteDtsImpl(this._client);

  final BaseHttpClient _client;
  final PokemonMapper _pokemonMapper = PokemonMapper();
  final PokemonDetailMapper _pokemonDetailMapper = PokemonDetailMapper();
  final PokemonSpeciesMapper _pokemonSpeciesMapper = PokemonSpeciesMapper();
  final PokemonEvolutionMapper _pokemonEvolutionMapper =
      PokemonEvolutionMapper();

  @override
  Future<APIResult<Paginated<List<PokemonModel>>>> getPokemons(
      {required int size, required int page}) async {
    final offset = size * page;
    return await _client.get(
      shouldPrint: false,
      path: '/pokemon?limit=$size&offset=$offset',
      mapper: (json) {
        final result = json['results'] as List<dynamic>;
        final data = result.map((e) => _pokemonMapper.fromJSON(e)).toList();
        return Paginated.resultMapper(json, data, page);
      },
    );
  }

  @override
  Future<APIResult<PokemonDetailModel>> getPokemonDetail(int id) async {
    await getAllPokemonDetails();
    return await _client.get(
      shouldPrint: false,
      path: '/pokemon/$id',
      mapper: (json) {
        return _pokemonDetailMapper.fromJSON(json);
      },
    );
  }

  @override
  Future<APIResult<PokemonSpeciesModel>> getPokemonSpecies(int id) async {
    return await _client.get(
      path: '/pokemon-species/$id',
      mapper: (json) => _pokemonSpeciesMapper.fromJSON(json),
      shouldPrint: false,
    );
  }

  @override
  Future<APIResult<PokemonEvolutionModel>> getPokemonEvolutions(int id) async {
    return await _client.get(
      path: '/evolution-chain/$id',
      mapper: (json) => _pokemonEvolutionMapper.fromJSON(json),
      shouldPrint: false,
    );
  }

  Future<void> getAllPokemonDetails() async {
    for (var i = 1; i <= 10270; i++) {
      print('Getting Data for id:$i ');
      await _client.get(
        shouldPrint: false,
        path: '/pokemon/$i',
        mapper: (json) {
          return _pokemonDetailMapper.fromJSON(json);
        },
      );
    }
  }
}
