import 'package:pokedex/models/type.model.dart';
import 'package:pokedex/models/stat.model.dart';

class PokemonDetails {
  final String name;
  final int id;
  final int height;
  final int weight;
  final int baseExperience;
  final List<Stat>? status;
  final List<Type>? type;
  PokemonDetails({
    required this.name,
    required this.id,
    required this.height,
    required this.weight,
    required this.baseExperience,
    this.status,
    this.type,
  });

  PokemonDetails copyWith({
    String? name,
    int? id,
    int? height,
    int? weight,
    int? baseExperience,
    List<Stat>? status,
    List<Type>? type,
  }) {
    return PokemonDetails(
      name: name ?? this.name,
      id: id ?? this.id,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      baseExperience: baseExperience ?? this.baseExperience,
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'height': height,
      'weight': weight,
      'baseExperience': baseExperience,
      'status': status?.map((x) => x.toMap()).toList(),
      'type': type?.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonDetails.fromMap(Map<String, dynamic> map) {
    return PokemonDetails(
      name: map['name'] as String,
      id: map['id'] as int,
      height: map['height'] as int,
      weight: map['weight'] as int,
      baseExperience: map['base_experience'] as int? ?? 0,
      status: map['stats'] != null
          ? List<Stat>.from(
              (map['stats'] as List<dynamic>).map<Stat>(
                (x) => Stat.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      type: map['types'] != null
          ? List<Type>.from(
              (map['types'] as List<dynamic>).map<Type>(
                (x) => Type.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
