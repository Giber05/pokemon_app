import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';
import 'package:pokemon_app/modules/domain/usecases/get_pokemons.dart';

part 'pokemons_state.dart';

@injectable
class PokemonsCubit extends Cubit<PokemonsState> {
  PokemonsCubit(this._getPokemons) : super(PokemonsInitial());
  final GetPokemons _getPokemons;

  void getMorePokemons() async {
    final currentState = state;
    if (currentState is PokemonsLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final useCaseCall = await _getPokemons(
        GetPokemonsParams(
          page: currentState.currentPage + 1,
          size: 50,
        ),
      );
      useCaseCall.when(
        success: (data) {
          final newPokemons = data.data;
          if (newPokemons.isEmpty) {
            emit(currentState.copyWith(hasReachedMax: true, isLoading: false));
          } else {
            final newData = currentState.pokemons + newPokemons;
            emit(PokemonsLoaded(
              pokemons: newData,
              hasReachedMax: false,
              currentPage: data.current,
              isLoading: false,
            ));
          }
        },
        error: (exception) {
          emit(PokemonsFailed(message: exception.message));
        },
      );
    }
  }

  void getPokemons() async {
    emit(PokemonsLoading());
    final usecaseCall = await _getPokemons(
      GetPokemonsParams(
        page: 0,
        size: 50,
      ),
    );
    usecaseCall.when(
      success: (data) {
        final pokemons = data.data;
        final currentPage = data.current;
        emit(PokemonsLoaded(
          isLoading: false,
          pokemons: pokemons,
          hasReachedMax: false,
          currentPage: currentPage,
        ));
      },
      error: (exception) {
        emit(PokemonsFailed(message: exception.message));
      },
    );
  }

  void searchPokemons(String pokemonName) {
    final currentState = state;
    if (currentState is PokemonsLoaded) {
      if (pokemonName.isEmpty) {
        getPokemons();
      } else {
        final filteredPokemons = currentState.pokemons.where((pokemon) =>
            pokemon.name.toLowerCase().contains(pokemonName.toLowerCase()));
        emit(currentState.copyWith(
          pokemons: filteredPokemons.toList(),
        ));
      }
    }
  }
}
