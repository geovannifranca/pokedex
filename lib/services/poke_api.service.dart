import 'dart:io';

import 'package:pokedex/models/poke_response.model.dart';
import 'package:pokedex/models/pokemon_details.model.dart';
import 'package:uno/uno.dart';

class PokeApiService {
  late final Uno _uno;

  PokeApiService() {
    _uno = Uno(baseURL: 'https://pokeapi.co/api/v2');
  }

  Future<PokemonDetails> getPokemonDetail(String nameOrId) async {
    final response = await _uno.get("/pokemon/$nameOrId");
    if (response.status != HttpStatus.ok) {
      throw Exception("Erro ao buscar detalhes do Pokemons na API");
    }

    return PokemonDetails.fromMap(response.data);
  }

  Future<PokeResponse> loadPokemons({required int offset}) async {
    final response = await _uno.get('/pokemon?offset=$offset&limit=20');
    if (response.status != HttpStatus.ok) {
      throw Exception("Erro ao buscar Pokemons na API");
    }
    final pokeResponse = PokeResponse.fromMap(response.data);
    return pokeResponse;
  }
}
