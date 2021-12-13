import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_list/bloc.dart';

class PokemonListLoadingPage extends StatefulWidget {
  const PokemonListLoadingPage({Key? key}) : super(key: key);

  @override
  _PokemonListLoadingPageState createState() => _PokemonListLoadingPageState();
}

class _PokemonListLoadingPageState extends State<PokemonListLoadingPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PokemonListBloc>(context).add(const PokemonListLoadEvent());
    return const Center(child: CupertinoActivityIndicator());
  }
}
