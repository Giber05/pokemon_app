part of '../pokemon_detail_screen.dart';

class _BoxDecoration extends StatelessWidget {
  static const Size size = Size.square(144);

  const _BoxDecoration();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * 5 / 12,
      alignment: Alignment.center,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: const Alignment(-0.2, -0.2),
            end: const Alignment(4, -0.3),
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}

class _DottedDecoration extends StatelessWidget {
  static const Size size = Size(57, 31);

  const _DottedDecoration();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagePath.dotted,
      width: size.width,
      height: size.height,
      color: Colors.white30,
    );
  }
}

class _BackgroundDecoration extends StatefulWidget {
  const _BackgroundDecoration();

  @override
  State<_BackgroundDecoration> createState() => _BackgroundDecorationState();
}

class _BackgroundDecorationState extends State<_BackgroundDecoration> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildBoxDecoration(),
        _buildDottedDecoration(),
        // _buildAppBarPokeballDecoration(),
      ],
    );
  }

  Widget _buildBackground() {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        if (state is PokemonDetailLoaded) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            constraints: const BoxConstraints.expand(),
            color: state.pokemon.pokemonDetail.color,
          );
        }
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          constraints: const BoxConstraints.expand(),
          color: Colors.grey.withOpacity(.3),
        );
      },
    );
  }

  Widget _buildBoxDecoration() {
    return Positioned(
      top: -_BoxDecoration.size.height * 0.4,
      left: -_BoxDecoration.size.width * 0.4,
      child: const _BoxDecoration(),
    );
  }

  Widget _buildDottedDecoration() {
    return const Positioned(
      top: 4,
      right: 72,
      child: _DottedDecoration(),
    );
  }
}
