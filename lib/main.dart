import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/my_app.dart';
import 'package:pokedex/stores/home_screen.store.dart';

void main() {
  final getIt = GetIt.I;
  getIt.registerLazySingleton<HomeScrennStore>(() => HomeScrennStore());
  runApp(const MyApp());
}
