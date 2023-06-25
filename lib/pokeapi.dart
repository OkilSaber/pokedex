import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/structs/pokemon.dart';

const baseUrl = 'https://pokeapi.co/api/v2';
const limit = 20;
Future<List<Pokemon>> fetchList(int page) async {
  final http.Response response = await http.get(
      Uri.parse("$baseUrl/pokemon/?limit=$limit&offset=${page * limit}"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<Future<Pokemon>> pokemons = [];
    data["results"]
        .forEach((poke) async => pokemons.add(fetchPokemon(poke["url"])));
    return await Future.wait(pokemons);
  } else {
    throw Exception('Failed to load pokemons');
  }
}

Future<Pokemon> fetchPokemon(String url) async {
  return http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  }).then((http.Response response) {
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return Pokemon.fromJson(data);
    } else {
      throw Exception('Failed to load pokemons');
    }
  });
}
