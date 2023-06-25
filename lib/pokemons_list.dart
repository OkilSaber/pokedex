import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pokedex/pokeapi.dart' as poke_dex;
import 'package:pokedex/pokemon_card.dart';
import 'package:pokedex/structs/pokemon.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({super.key});

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  Future<List<Future<Pokemon>>> _pokemons = Future.value([]);
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
      _pokemons = poke_dex.fetchList(page);
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
        preferredSize: Size(MediaQuery.of(context).size.width, 60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: const Color.fromARGB(200, 100, 100, 100),
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
        child: FutureBuilder<List<Future<Pokemon>>>(
          future: _pokemons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return FutureBuilder<Pokemon>(
                    future: snapshot.data![index],
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PokemonCard(
                          pokemon: snapshot.data!,
                        );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Icon(
                            Icons.error_outline_rounded,
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text("Error");
            }
            return const Text("Loading...");
          },
        ),
      ),
    );
  }
}
