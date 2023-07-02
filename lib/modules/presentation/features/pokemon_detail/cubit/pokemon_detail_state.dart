// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_detail_cubit.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();

  @override
  List<Object> get props => [];
}

class PokemonDetailInitial extends PokemonDetailState {}

class PokemonDetailLoading extends PokemonDetailState {}

class PokemonDetailLoaded extends PokemonDetailState {
  final PokemonDetailWrapperModel pokemon;
  const PokemonDetailLoaded({
    required this.pokemon,
  });
}

class PokemonDetailFailed extends PokemonDetailState {
  final String message;
  const PokemonDetailFailed({
    required this.message,
  });
}
