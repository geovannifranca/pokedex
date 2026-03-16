import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex/colors/colors.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/stores/home_screen.store.dart';

class PokeCard extends StatefulWidget {
  final Pokemon _pokemon;
  const PokeCard({super.key, required Pokemon pokemon}) : _pokemon = pokemon;

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  final _homeScrennStore = GetIt.I.get<HomeScrennStore>();

  @override
  void initState() {
    super.initState();
    getPaletteColor();
  }

  Future<void> getPaletteColor() async {
    if (widget._pokemon.color != Colors.white) return;

    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget._pokemon.imageUrl),
    );

    if (paletteGenerator.dominantColor != null && mounted) {
      _homeScrennStore.updatePokemonsColor(
        pokemonId: widget._pokemon.id,
        color: paletteGenerator.dominantColor!.color,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: widget._pokemon.color,
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
      ),
    );
  }
}
