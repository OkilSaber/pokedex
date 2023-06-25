import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokeapi.dart';

class Infos extends StatefulWidget {
  const Infos({super.key});

  @override
  State<Infos> createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton(
        child: const Text("Test"),
        onPressed: () {
          print("test");
        },
      ),
    );
  }
}
