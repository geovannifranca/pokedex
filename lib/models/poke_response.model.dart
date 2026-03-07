import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:pokedex/models/pokemon.model.dart';

class PokeResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Pokemon> results;
  PokeResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  PokeResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<Pokemon>? results,
  }) {
    return PokeResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory PokeResponse.fromMap(Map<String, dynamic> map) {
    return PokeResponse(
      count: map['count'] as int,
      next: map['next'] != null ? map['next'] as String : null,
      previous: map['previous'] != null ? map['previous'] as String : null,
      results: List<Pokemon>.from(
        (map['results'] as List<dynamic>).map(
          (x) => Pokemon.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokeResponse.fromJson(String source) =>
      PokeResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokeResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(covariant PokeResponse other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}
