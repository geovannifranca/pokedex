import 'dart:convert';

import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final String url;
  final Color color;
  Pokemon({required this.name, required this.url, this.color = Colors.white});

  String get id {
    final data = url.split("/");
    data.removeLast();
    return data.last;
  }

  String get imageUrl =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/refs/heads/master/sprites/pokemon/other/official-artwork/$id.png";

  Pokemon copyWith({String? name, String? url, Color? color}) {
    return Pokemon(
      name: name ?? this.name,
      url: url ?? this.url,
      color: color ?? this.color,
    );
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
}
