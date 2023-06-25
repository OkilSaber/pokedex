import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_details.dart';
import 'package:pokedex/structs/pokemon.dart';

extension StringExtension on String {
  String capitalize() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

class PokemonCard extends StatefulWidget {
  const PokemonCard({super.key, required this.pokemon});
  final Pokemon pokemon;
  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoModalPopupRoute(
            builder: (context) => PokemonDetails(
              pokemon: widget.pokemon,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(92, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 210,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              "n°${widget.pokemon.id} ${widget.pokemon.name.capitalize()}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Image.network(
              widget.pokemon.sprites.frontDefault,
              height: 96,
              fit: BoxFit.fitHeight,
              // width: 288,
            ),
            const SizedBox(height: 10),
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
          ],
        ),
      ),
    );
  }
}
