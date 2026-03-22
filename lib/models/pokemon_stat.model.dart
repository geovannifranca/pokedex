class PokemonStat {
  final String name;
  final String url;
  PokemonStat({required this.name, required this.url});

  PokemonStat copyWith({String? name, String? url}) {
    return PokemonStat(name: name ?? this.name, url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory PokemonStat.fromMap(Map<String, dynamic> map) {
    return PokemonStat(name: map['name'] as String, url: map['url'] as String);
  }
}
