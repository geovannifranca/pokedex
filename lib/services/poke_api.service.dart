import 'dart:io';

import 'package:pokedex/models/poke_response.model.dart';
import 'package:uno/uno.dart';

class PokeApiService {
  late final Uno _uno;

  PokeApiService() {
    _uno = Uno(baseURL: 'https://pokeapi.co/api/v2');
  }

  Future<PokeResponse> loadPokemons() async {
    final response = await _uno.get('/pokemon');
    if (response.status != HttpStatus.ok) {
      throw Exception("Erro ao buscar Pokemons na API");
    }
    final pokeResponse = PokeResponse.fromMap(response.data);
    return pokeResponse;
  }
}
