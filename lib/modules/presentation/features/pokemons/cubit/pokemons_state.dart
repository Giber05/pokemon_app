// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemons_cubit.dart';

abstract class PokemonsState extends Equatable {
  const PokemonsState();

  @override
  List<Object> get props => [];
}

class PokemonsInitial extends PokemonsState {}

class PokemonsLoading extends PokemonsState {}

class PokemonsLoaded extends PokemonsState {
  final List<PokemonModel> pokemons;
  final int currentPage;
  final bool isLoading;
  final bool hasReachedMax;
  const PokemonsLoaded({
    required this.pokemons,
    required this.currentPage,
    required this.isLoading,
    required this.hasReachedMax,
  });

  PokemonsLoaded copyWith({
    List<PokemonModel>? pokemons,
    bool? hasReachedMax,
    int? currentPage,
    bool? isLoading,
  }) {
    return PokemonsLoaded(
        pokemons: pokemons ?? this.pokemons,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        currentPage: currentPage ?? this.currentPage,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [pokemons, hasReachedMax, currentPage, isLoading];
}

class PokemonsFailed extends PokemonsState {
  final String message;
  PokemonsFailed({
    required this.message,
  });
}
