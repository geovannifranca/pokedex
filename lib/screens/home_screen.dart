import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/colors/colors.dart';
import 'package:pokedex/stores/home_screen.store.dart';
import 'package:pokedex/widgets/poke_card.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeScrennStore = GetIt.I.get<HomeScrennStore>();

  @override
  void initState() {
    _homeScrennStore.loadPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Text(
                'Pokedéx',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Procure um Pokemon pelo nome ou identificador',
                style: TextStyle(color: primaryColor, fontSize: 18),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Nome ou Identificador',
                  hintStyle: const TextStyle(color: primaryColor),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.search, color: primaryColor),
                ),
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (_) {
                  return Expanded(
                    child: _homeScrennStore.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            itemCount: _homeScrennStore.pokemons.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2 / 2.8,
                                ),
                            itemBuilder: (context, index) {
                              return PokeCard(
                                pokemon: _homeScrennStore.pokemons[index],
                              );
                            },
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
