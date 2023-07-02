import 'package:equatable/equatable.dart';

class PokemonModel  extends Equatable{
  final int id;
  final String name;
  final String imageUrl;

  PokemonModel({required this.id, required this.name, required this.imageUrl});
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, name,imageUrl];
}