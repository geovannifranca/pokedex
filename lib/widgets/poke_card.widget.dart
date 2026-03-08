import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/colors/colors.dart';
import 'package:pokedex/models/pokemon.model.dart';

class PokeCard extends StatefulWidget {
  final Pokemon _pokemon;
  const PokeCard({super.key, required Pokemon pokemon}) : _pokemon = pokemon;

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    getPaletterColor();
    super.initState();
  }

  Future<void> getPaletterColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget._pokemon.imageUrl),
    );
    if (paletteGenerator.dominantColor != null) {
      setState(() {
        backgroundColor = paletteGenerator.dominantColor!.color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(widget._pokemon.imageUrl, height: 100),
          const SizedBox(height: 12),
          Text(
            widget._pokemon.name,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget._pokemon.id.padLeft(4, '0'),
            style: const TextStyle(fontSize: 16, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
