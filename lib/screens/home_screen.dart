import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/colors/colors.dart';
import 'package:pokedex/screens/datail_screen.dart';
import 'package:pokedex/stores/home_screen.store.dart';
import 'package:pokedex/widgets/poke_card.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _homeScrennStore = GetIt.I.get<HomeScrennStore>();

  void scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _homeScrennStore.loadPokemons();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(scrollListener);
    _homeScrennStore.loadPokemons();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
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
                onChanged: _homeScrennStore.setSearch,
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
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: _homeScrennStore.filteredPokemons.length + 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2 / 2.9,
                          ),
                      itemBuilder: (context, index) {
                        if (index < _homeScrennStore.filteredPokemons.length) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DatailScreen(
                                  pokemon:
                                      _homeScrennStore.filteredPokemons[index],
                                ),
                              ),
                            ),
                            child: PokeCard(
                              pokemon: _homeScrennStore.filteredPokemons[index],
                            ),
                          );
                        }
                        return _homeScrennStore.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : null;
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
