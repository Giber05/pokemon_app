import 'package:flutter/material.dart';

class PokemonColorUtil {
  static Color colorGenerator(String val) {
    switch (val) {
      case 'grass':
      case 'bug':
        return Colors.lightGreen;

      case 'fire':
        return Colors.redAccent;

      case 'water':
        return Colors.lightBlue;

      case 'normal':
      case 'flying':
        return Colors.grey;

      case 'fighting':
        return Colors.brown;

      case 'electric':
      case 'psychic':
        return Colors.amber;

      case 'poison':
      case 'ghost':
        return Colors.purple;

      case 'ground':
      case 'rock':
        return Colors.brown;

      case 'dark':
        return Colors.black.withOpacity(.75);

      case 'fairy':
        return Colors.pinkAccent;

      default:
        return Colors.lightBlue;
    }
  }

  Color getColorByStat(String statName) {
    switch (statName) {
      case 'hp':
        return Colors.green;
      case 'attack':
        return Colors.red;
      case 'defense':
        return Colors.orange;
      case 'special-attack':
        return Colors.purple;
      case 'special-defense':
        return Colors.yellow;
      case 'speed':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}
