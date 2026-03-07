import 'dart:convert';

class Pokemon {
  final String name;
  final String url;
  Pokemon({required this.name, required this.url});

  Pokemon copyWith({String? name, String? url}) {
    return Pokemon(name: name ?? this.name, url: url ?? this.url);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(name: map['name'] as String, url: map['url'] as String);
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Pokemon(name: $name, url: $url)';

  @override
  bool operator ==(covariant Pokemon other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
