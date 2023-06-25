import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex/pokemon_card.dart';
import 'package:pokedex/structs/pokemon.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key, required this.pokemon});
  final Pokemon pokemon;
  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  late Map<String, String> sprites;
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
    sprites = widget.pokemon.sprites.toMap();
    sprites.removeWhere((key, value) => value == "");
  }

  @override
  Widget build(BuildContext context) {
    widget.pokemon.sprites.toMap();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 30),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.transparent,
              child: AppBar(
                backgroundColor: Colors.black,
                elevation: 0,
                title: const Text(
                  'Pokedex',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                height: 375,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(92, 255, 255, 255),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "n°${widget.pokemon.id} ${widget.pokemon.name.capitalize()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    CarouselSlider(
                      carouselController: _controller,
                      options: CarouselOptions(
                        height: 250.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: sprites
                          .map((key, value) {
                            bool isShiny = key.contains("Shiny");
                            IconData genderIcon = key.contains("Female")
                                ? Icons.female_rounded
                                : Icons.male_rounded;
                            return MapEntry(
                              key,
                              Center(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          genderIcon,
                                          color: key.contains("Female")
                                              ? Colors.pink
                                              : Colors.blue,
                                        ),
                                        isShiny ? const Text("✨") : Container(),
                                      ],
                                    ),
                                    Image.network(
                                      value,
                                      fit: BoxFit.fill,
                                      width: 192,
                                      isAntiAlias: false,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                          .values
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...widget.pokemon.types.map(
                          (type) => Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(120, 248, 89, 137),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              type.capitalize(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: sprites.keys.map((key) {
                        final int index = sprites.keys.toList().indexOf(key);
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 225),
                          ),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white.withOpacity(
                                      _current == index ? 0.9 : 0.4)
                                  : Colors.black.withOpacity(
                                      _current == index ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              const Text(
                "Statistics",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView(
                  children: widget.pokemon.stats.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: LinearPercentIndicator(
                        center: Text(
                          e.name.capitalize(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        alignment: MainAxisAlignment.center,
                        lineHeight: 30,
                        percent: (e.baseStat / 252),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
