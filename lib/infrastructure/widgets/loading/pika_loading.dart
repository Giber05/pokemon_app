// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemon_app/infrastructure/utils/path/image_path.dart';

class PikaLoading extends StatelessWidget {
  const PikaLoading({
    Key? key,
    this.size = 500,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath.pikaLoader,
      width: size,
    );
  }
}
