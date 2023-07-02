import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/infrastructure/utils/path/image_path.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double? radius;
  const LoadingIndicator({super.key, this.color, this.radius});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          ImagePath.pikaLoader,
          width: 300,
        ),
      ],
    );
  }
}
