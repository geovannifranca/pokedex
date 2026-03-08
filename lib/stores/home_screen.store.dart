import 'package:mobx/mobx.dart';
import 'package:pokedex/models/poke_response.model.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/services/poke_api.service.dart';

part 'home_screen.store.g.dart';

class HomeScrennStore = HomeScrennStoreBase with _$HomeScrennStore;

abstract class HomeScrennStoreBase with Store {
  final PokeApiService _pokeApiService = PokeApiService();

  @observable
  bool _isLoading = false;

  @observable
  ObservableList<Pokemon> _pokemons = <Pokemon>[].asObservable();

  bool get isLoading => _isLoading;
  ObservableList<Pokemon> get pokemons => _pokemons;

  @action
  Future<List<Pokemon>> loadPokemons() async {
    _isLoading = true;
    PokeResponse response = await _pokeApiService.loadPokemons();
    _pokemons = response.results.asObservable();
    _isLoading = false;
    return _pokemons;
  }
}
