import 'package:flutter/material.dart';
import 'package:pokemon_app/infrastructure/utils/path/image_path.dart';

class PokeballBackground extends StatelessWidget {
  static const double _pokeballWidthFraction = 0.664;

  final Widget child;
  final Widget? floatingActionButton;

  const PokeballBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final pokeballSize =
        MediaQuery.of(context).size.width * _pokeballWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = 28;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin =
        -(pokeballSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin =
        -(pokeballSize / 2 - iconButtonPadding - iconSize / 2);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: pokeballTopMargin,
              right: pokeballRightMargin,
              child: Image.asset(
                ImagePath.pokeball,
                width: pokeballSize,
                height: pokeballSize,
                color: Colors.black.withOpacity(0.05),
              ),
            ),
            Positioned(
              bottom: pokeballTopMargin,
              left: pokeballRightMargin,
              child: Image.asset(ImagePath.pokeball,
                  width: pokeballSize,
                  height: pokeballSize,
                  color: Colors.black.withOpacity(0.05)),
            ),
            child,
          ],
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
