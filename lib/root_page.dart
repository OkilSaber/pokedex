import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/infos.dart';
import 'package:pokedex/pokemons_list.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;
  final tabPages = <Widget>[
    const PokemonsList(),
    const Infos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: tabPages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(200, 100, 100, 100),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: _selectedIndex == 0
                            ? [
                                const BoxShadow(
                                  color: Color.fromARGB(50, 248, 89, 137),
                                  blurRadius: 6.0,
                                  spreadRadius: 6.0,
                                  offset: Offset(0.0, 3.0),
                                )
                              ]
                            : null),
                    child: const Icon(Icons.format_list_bulleted_rounded),
                  ),
                  label: 'Liste',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: _selectedIndex == 1
                            ? [
                                const BoxShadow(
                                  color: Color.fromARGB(50, 248, 89, 137),
                                  blurRadius: 6.0,
                                  spreadRadius: 6.0,
                                  offset: Offset(0.0, 3.0),
                                )
                              ]
                            : null),
                    child: const Icon(Icons.info_outline_rounded),
                  ),
                  label: 'Infos',
                ),
              ],
              currentIndex: _selectedIndex,
              unselectedItemColor: const Color.fromARGB(92, 255, 255, 255),
              selectedItemColor: const Color.fromARGB(120, 248, 89, 137),
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
          ),
        ),
      ),
    );
  }
}
