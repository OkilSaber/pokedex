import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/ui/widgets/components/pokemon_card.dart';

class PokemonListLoadedSuccessPage extends StatefulWidget {
  final List<Pokemon> pokemons;
  const PokemonListLoadedSuccessPage({Key? key, required this.pokemons})
      : super(key: key);

  @override
  _PokemonListLoadedSuccessPageState createState() =>
      _PokemonListLoadedSuccessPageState();
}

class _PokemonListLoadedSuccessPageState
    extends State<PokemonListLoadedSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: widget.pokemons.map<Widget>((pokemon) {
              return GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 500.0,
                  child: PokemonCard(pokemon: pokemon),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
