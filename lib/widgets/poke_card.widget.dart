import 'package:flutter/material.dart';
import 'package:pokedex/colors/colors.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://archives.bulbagarden.net/media/upload/thumb/f/fb/0001Bulbasaur.png/600px-0001Bulbasaur.png',
            height: 120,
          ),
          const SizedBox(height: 12),
          const Text(
            'Bulbasaur',
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '0001',
            style: TextStyle(fontSize: 16, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
