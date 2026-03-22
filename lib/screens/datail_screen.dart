import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/colors/colors.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/stores/details_screen.store.dart';
import 'package:pokedex/widgets/characteristc.widget.dart';
import 'package:pokedex/widgets/percentage_indicator.widget.dart';

class DatailScreen extends StatefulWidget {
  final Pokemon pokemon;
  const DatailScreen({super.key, required this.pokemon});

  @override
  State<DatailScreen> createState() => _DatailScreenState();
}

class _DatailScreenState extends State<DatailScreen> {
  final _detailScreenStore = GetIt.I.get<DetailsScreenStore>();

  @override
  void initState() {
    _detailScreenStore.getPokemonDetailsData(widget.pokemon.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              foregroundColor: Colors.white,
              backgroundColor: widget.pokemon.color,
              pinned: false,
              floating: true,
              collapsedHeight: 100,
              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: ValueKey(widget.pokemon.id),
                  child: CachedNetworkImage(imageUrl: widget.pokemon.imageUrl),
                ),
              ),
            ),
            Observer(
              builder: (context) {
                return _detailScreenStore.isLoading
                    ? const SliverToBoxAdapter(child: LinearProgressIndicator())
                    : SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Text(
                                _detailScreenStore.pokemonDetails!.name
                                    .toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '#${_detailScreenStore.pokemonDetails!.id}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Wrap(
                                spacing: 10,
                                children:
                                    _detailScreenStore.pokemonDetails?.type
                                        ?.map(
                                          (e) => Chip(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            label: Text(e.type.name),
                                            backgroundColor:
                                                widget.pokemon.color,
                                          ),
                                        )
                                        .toList() ??
                                    [],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Characteristc(
                                    value: _detailScreenStore
                                        .pokemonDetails!
                                        .height
                                        .toString(),
                                    name: 'Heigth',
                                  ),
                                  Characteristc(
                                    value: _detailScreenStore
                                        .pokemonDetails!
                                        .baseExperience
                                        .toString(),
                                    name: 'Experience',
                                  ),
                                  Characteristc(
                                    value: _detailScreenStore
                                        .pokemonDetails!
                                        .weight
                                        .toString(),
                                    name: 'Weight',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Stats',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Divider(color: Colors.black),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount:
                                    _detailScreenStore
                                        .pokemonDetails
                                        ?.status
                                        ?.length ??
                                    0,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final stat = _detailScreenStore
                                      .pokemonDetails!
                                      .status![index];
                                  return PercentageIndicator(
                                    name: stat.stat.name,
                                    value: stat.baseStat.toDouble(),
                                    color: widget.pokemon.color,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
