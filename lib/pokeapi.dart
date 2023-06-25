import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/structs/pokemon.dart';

const baseUrl = 'https://pokeapi.co/api/v2';

Future<List<Future<Pokemon>>> fetchList(int page) async {
  int max = 0;
  http.Response response = await http.get(
    Uri.parse("$baseUrl/pokemon/?limit=1"),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    max = data["count"];
  } else {
    throw Exception('Failed to load pokemons');
  }
  response = await http.get(
    Uri.parse("$baseUrl/pokemon/?limit=$max"),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
  List<Future<Pokemon>> pokemons = [];
  for (var counter = 0; counter < max; counter += 200) {
    print("counter: $counter");
    response = await http.get(
      Uri.parse("$baseUrl/pokemon/?limit=50&offset=$counter"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      data["results"]
          .forEach((poke) async => pokemons.add(fetchPokemon(poke["url"])));
    } else {
      throw Exception('Failed to load pokemons');
    }
    await Future.delayed(const Duration(milliseconds: 500));
  }
  return pokemons;
}

Future<Pokemon> fetchPokemon(String url) async {
  return http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  }).then((http.Response response) {
    // print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      // print(data);
      return Pokemon.fromJson(data);
    } else {
      throw Exception('Failed to load pokemons');
    }
  });
}
