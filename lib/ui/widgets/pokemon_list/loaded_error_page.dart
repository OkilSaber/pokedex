import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonListLoadErrorPage extends StatefulWidget {
  final String error;

  const PokemonListLoadErrorPage({Key? key, required this.error})
      : super(key: key);

  @override
  _PokemonListLoadErrorPageState createState() =>
      _PokemonListLoadErrorPageState();
}

class _PokemonListLoadErrorPageState extends State<PokemonListLoadErrorPage> {
  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
