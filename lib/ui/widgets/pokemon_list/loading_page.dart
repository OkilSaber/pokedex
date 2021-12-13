import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_list/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pokedex/bloc/pokemon_list/bloc.dart';

class PokemonListLoadingPage extends StatefulWidget {
  const PokemonListLoadingPage({Key? key}) : super(key: key);

  @override
  _PokemonListLoadingPageState createState() => _PokemonListLoadingPageState();
}

class _PokemonListLoadingPageState extends State<PokemonListLoadingPage> {
  @override
  Widget build(BuildContext context) {
    print("Loading");
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: CupertinoButton(
          child: const Text("Load data"),
          onPressed: () {
            BlocProvider.of<PokemonListBloc>(context)
                .add(const PokemonListLoadEvent());
          },
        ),
      ),
    );
  }
}
