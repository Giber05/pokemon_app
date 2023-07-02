import 'package:flutter/material.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/move_model.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/stats_model.dart';

class PokemonDetailModel {
  final String name;
  final List<String> types;
  final int id;
  final String imageUrl;
  final double height;
  final double weight;
  final List<String> abilities;
  final List<StatsModel> stats;
  final List<MoveModel> moves;
  final Color color;

  PokemonDetailModel({
    required this.name,
    required this.types,
    required this.id,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    required this.moves,
    required this.color,
  });

  String getAbilitiesString() {
    return abilities.join(', ');
  }
}

class Evolution {
  final String name;
  final String imageUrl;

  Evolution({required this.name, required this.imageUrl});

  factory Evolution.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final imageUrl = json['image_url'] as String;

    return Evolution(name: name, imageUrl: imageUrl);
  }
}
