// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';

import 'package:pokemon_app/infrastructure/utils/path/image_path.dart';
import 'package:pokemon_app/modules/domain/models/pokemons/pokemon_model.dart';

class PokemonImage extends StatelessWidget {
  static const Size _cacheMaxSize = Size(700, 700);

  final PokemonModel pokemon;
  final EdgeInsets padding;
  final bool useHero;
  final ImageProvider placeholder;
  final Color? tintColor;
  final double? height;
  final double? width;

  const PokemonImage({
    Key? key,
    required this.pokemon,
    this.padding = EdgeInsets.zero,
    this.useHero = true,
    this.placeholder = const AssetImage(ImagePath.pokeball),
    this.tintColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: pokemon.imageUrl,
        child: AnimatedPadding(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeOutQuint,
          padding: padding,
          child: CachedNetworkImage(
            imageUrl: pokemon.imageUrl,
            imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
            useOldImageOnUrlChange: true,
            maxWidthDiskCache: _cacheMaxSize.width.toInt(),
            maxHeightDiskCache: _cacheMaxSize.height.toInt(),
            fadeInDuration: Duration(milliseconds: 120),
            fadeOutDuration: Duration(milliseconds: 120),
            imageBuilder: (_, image) => Image(
              image: image,
              width: width,
              height: width,
              alignment: Alignment.bottomCenter,
              color: tintColor,
              fit: BoxFit.contain,
            ),
            errorWidget: (_, __, ___) => Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: placeholder,
                  width: width,
                  height: height,
                  color: Colors.black12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
