import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pokedex/pokeapi.dart' as PokeDex;
import 'package:pokedex/pokemon_card.dart';
import 'package:pokedex/structs/pokemon.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({super.key});

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  final List<Pokemon> _pokemons = [];
  int page = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      loadPokemonsPages(page);
      setState(() => page++);
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        loadPokemonsPages(page);
        setState(() => page++);
      }
    });
  }

  void loadPokemonsPages(int page) {
    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          PokeDex.fetchList(page).then((value) {
            setState(() => _pokemons.addAll(value));
            Navigator.of(context).pop();
          });

          return const Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
    } on Exception catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                backgroundColor: Colors.transparent,
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          controller: _scrollController,
          itemCount: _pokemons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return PokemonCard(pokemon: _pokemons[index]);
          },
        ),
      ),
    );
  }
}
