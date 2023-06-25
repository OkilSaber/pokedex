import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Infos extends StatefulWidget {
  const Infos({super.key});

  @override
  State<Infos> createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: CupertinoListSection.insetGrouped(
            backgroundColor: Colors.black,
            header: const Text(
              'Pokedex',
              style: TextStyle(color: Colors.white),
            ),
            children: <CupertinoListTile>[
              const CupertinoListTile.notched(
                backgroundColor: Color.fromARGB(255, 28, 28, 30),
                title: Text(
                  'Developped by Okil Saber Lakhdari',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const CupertinoListTile.notched(
                backgroundColor: Color.fromARGB(255, 28, 28, 30),
                title: Text(
                  'Flutter 3.10.5',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              CupertinoListTile.notched(
                backgroundColor: const Color.fromARGB(255, 28, 28, 30),
                title: const Text(
                  'PokeAPI v2',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  launchUrl(
                    Uri.parse("https://pokeapi.co/"),
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
              CupertinoListTile.notched(
                backgroundColor: const Color.fromARGB(255, 28, 28, 30),
                title: const Text(
                  'Github Repository',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const CupertinoListTileChevron(),
                onTap: () {
                  launchUrl(
                    Uri.parse("https://github.com/OkilSaber/pokedex"),
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
