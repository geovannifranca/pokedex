// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScrennStore on HomeScrennStoreBase, Store {
  late final _$_isLoadingAtom = Atom(
    name: 'HomeScrennStoreBase._isLoading',
    context: context,
  );

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_pokemonsAtom = Atom(
    name: 'HomeScrennStoreBase._pokemons',
    context: context,
  );

  @override
  ObservableList<Pokemon> get _pokemons {
    _$_pokemonsAtom.reportRead();
    return super._pokemons;
  }

  @override
  set _pokemons(ObservableList<Pokemon> value) {
    _$_pokemonsAtom.reportWrite(value, super._pokemons, () {
      super._pokemons = value;
    });
  }

  late final _$loadPokemonsAsyncAction = AsyncAction(
    'HomeScrennStoreBase.loadPokemons',
    context: context,
  );

  @override
  Future<List<Pokemon>> loadPokemons() {
    return _$loadPokemonsAsyncAction.run(() => super.loadPokemons());
  }

  late final _$HomeScrennStoreBaseActionController = ActionController(
    name: 'HomeScrennStoreBase',
    context: context,
  );

  @override
  void updatePokemonsColor({required String pokemonId, required Color color}) {
    final _$actionInfo = _$HomeScrennStoreBaseActionController.startAction(
      name: 'HomeScrennStoreBase.updatePokemonsColor',
    );
    try {
      return super.updatePokemonsColor(pokemonId: pokemonId, color: color);
    } finally {
      _$HomeScrennStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
