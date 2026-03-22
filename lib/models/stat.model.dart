import 'package:pokedex/models/pokemon_stat.model.dart';

class Stat {
  final int baseStat;
  final int effort;
  final PokemonStat stat;
  Stat({required this.baseStat, required this.effort, required this.stat});

  Stat copyWith({int? baseStat, int? effort, PokemonStat? stat}) {
    return Stat(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseStat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory Stat.fromMap(Map<String, dynamic> map) {
    return Stat(
      baseStat: map['base_stat'] as int? ?? 0,
      effort: map['effort'] as int,
      stat: PokemonStat.fromMap(map['stat'] as Map<String, dynamic>),
    );
  }
}
