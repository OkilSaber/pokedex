import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 450,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: const Border(
            top: BorderSide(
              color: Colors.grey,
              width: 2,
              style: BorderStyle.solid,
            ),
            left: BorderSide(
              color: Colors.grey,
              width: 2,
              style: BorderStyle.solid,
            ),
            bottom: BorderSide(
              color: Colors.grey,
              width: 2,
              style: BorderStyle.solid,
            ),
            right: BorderSide(
              color: Colors.grey,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
        child: Column(
          children: [
            Text(pokemon.name),
            Image.network(pokemon.sprites.frontDefault)
          ],
        ),
      ),
    );
  }
}
