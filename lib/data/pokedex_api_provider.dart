import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class PokedexApiProvider {
  final String baseUrl = "https://pokeapi.co/api/v2";
  final int successCode = 200;
  late String next;
  Future<List<Pokemon>> fetchFirst20Pokemons() async {
    final response = await http.get(Uri.parse("$baseUrl/pokemon"));
    return parseListResponse(response);
  }

  Future<List<Pokemon>> parseListResponse(http.Response response) async {
    if (response.statusCode == successCode) {
      final List<Pokemon> pokemons = [];
      final parsedList = json.decode(response.body);
      for (var element in parsedList["results"]) {
        pokemons.add(await getPokemonFromUrl(element["url"]));
      }
      return pokemons;
    } else {
      throw Exception('failed to load players');
    }
  }

  Future<Pokemon> getPokemonFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    return Pokemon.fromJson(json.decode(response.body));
  }
}
