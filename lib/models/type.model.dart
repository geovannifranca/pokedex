import 'package:pokedex/models/pokemon_type.model.dart';

class Type {
  final int slot;
  final PokemonType type;
  Type({required this.slot, required this.type});

  Type copyWith({int? slot, PokemonType? type}) {
    return Type(slot: slot ?? this.slot, type: type ?? this.type);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'slot': slot, 'type': type.toMap()};
  }

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      slot: map['slot'] as int,
      type: PokemonType.fromMap(map['type'] as Map<String, dynamic>),
    );
  }
}
