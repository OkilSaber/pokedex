import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_list/bloc.dart';
import 'package:pokedex/ui/widgets/pokemon_list/loaded_error_page.dart';
import 'package:pokedex/ui/widgets/pokemon_list/loaded_success_page.dart';
import 'package:pokedex/ui/widgets/pokemon_list/loading_page.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<PokemonListBloc, PokemonListState>(
        listener: (context, state) async {},
        child: BlocBuilder<PokemonListBloc, PokemonListState>(
            buildWhen: (PokemonListState previous, PokemonListState current) {
          return (true);
        }, builder: (context, state) {
          if (state is PokemonListLoadingState) {
            return (const PokemonListLoadingPage());
          } else if (state is PokemonListLoadedSuccessState) {
            return (const PokemonListLoadedSuccessPage());
          } else if (state is PokemonListLoadErrorState) {
            return (PokemonListLoadErrorPage(error: state.cause));
          } else {
            return (Container());
          }
        }),
      ),
    );
  }
}
