class PokemonType {
  final String name;
  final String url;
  PokemonType({required this.name, required this.url});

  PokemonType copyWith({String? name, String? url}) {
    return PokemonType(name: name ?? this.name, url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory PokemonType.fromMap(Map<String, dynamic> map) {
    return PokemonType(name: map['name'] as String, url: map['url'] as String);
  }
}
