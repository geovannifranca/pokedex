import 'package:mobx/mobx.dart';
import 'package:pokedex/models/pokemon_details.model.dart';
import 'package:pokedex/services/poke_api.service.dart';

part 'details_screen.store.g.dart';

class DetailsScreenStore = DetailsScreenStoreBase with _$DetailsScreenStore;

abstract class DetailsScreenStoreBase with Store {
  final _service = PokeApiService();

  @observable
  bool isLoading = false;

  @observable
  PokemonDetails? pokemonDetails;

  @action
  Future<void> getPokemonDetailsData(String nameOrId) async {
    isLoading = true;

    final pokemon = await _service.getPokemonDetail(nameOrId);

    pokemonDetails = pokemon;

    isLoading = false;
  }
}
