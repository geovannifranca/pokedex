import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/models/poke_response.model.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/services/poke_api.service.dart';

part 'home_screen.store.g.dart';

class HomeScrennStore = HomeScrennStoreBase with _$HomeScrennStore;

abstract class HomeScrennStoreBase with Store {
  final PokeApiService _pokeApiService = PokeApiService();

  int offset = 0;

  @observable
  bool _isLoading = false;

  @observable
  ObservableList<Pokemon> _pokemons = <Pokemon>[].asObservable();

  @observable
  String? _search;

  @computed
  List<Pokemon> get filteredPokemons {
    if (_search == null || _search!.isEmpty) return pokemons.toList();

    return pokemons
        .where(
          (pokemon) =>
              pokemon.name.toLowerCase().contains(_search!.toLowerCase()) ||
              pokemon.id == _search,
        )
        .toList();
  }

  bool get isLoading => _isLoading;
  ObservableList<Pokemon> get pokemons => _pokemons;
  String? get search => _search;

  @action
  void setSearch(String? text) => _search = text;

  @action
  Future<List<Pokemon>> loadPokemons() async {
    _isLoading = true;

    try {
      PokeResponse response = await _pokeApiService.loadPokemons(
        offset: offset,
      );
      offset += 20;
      _pokemons.addAll(response.results);
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao carregar pokemons: $e');
    } finally {
      _isLoading = false;
    }
    return _pokemons;
  }

  @action
  void updatePokemonsColor({required String pokemonId, required Color color}) {
    final indexPokemon = pokemons.indexWhere(
      (element) => element.id == pokemonId,
    );
    pokemons[indexPokemon] = pokemons[indexPokemon].copyWith(color: color);
  }
}
