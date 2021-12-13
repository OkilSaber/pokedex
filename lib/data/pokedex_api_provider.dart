import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_type.dart';

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
    final jsonResponse = json.decode(response.body);
    final List<PokemonType> types =
        await getPokemonTypes(jsonResponse["types"]);
    return Pokemon.fromJson(jsonResponse, types);
  }

  Future<List<PokemonType>> getPokemonTypes(List<dynamic> parsedJson) async {
    final List<PokemonType> types = [];
    for (var element in parsedJson) {
      final response =
          await http.get(Uri.parse(element["type"]["url"].toString()));
      final decodedResp = json.decode(response.body);
      types.add(PokemonType(
          id: decodedResp["id"],
          slot: element["slot"],
          name: element["type"]["name"]));
    }
    return types;
  }
}
