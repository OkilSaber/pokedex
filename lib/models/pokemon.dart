import 'package:pokedex/models/pokemon_type.dart';
import 'package:pokedex/models/sprites.dart';

class Pokemon {
  int id;
  String name;
  int baseExperience;
  int height;
  int order;
  int weight;
  String locationAreaEncounters;
  Sprites sprites;
  List<PokemonType> types;

  Pokemon({
    required this.id,
    required this.baseExperience,
    required this.height,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.weight,
    required this.sprites,
    required this.types,
  });

  factory Pokemon.fromJson(
      Map<String, dynamic> parsedJson, List<PokemonType> types) {
    return Pokemon(
      id: parsedJson["id"],
      baseExperience: parsedJson["base_experience"],
      height: parsedJson["height"],
      locationAreaEncounters: parsedJson["location_area_encounters"].toString(),
      name: parsedJson["name"].toString(),
      order: parsedJson["order"],
      weight: parsedJson["weight"],
      sprites: Sprites.fromJson(parsedJson["sprites"]),
      types: types,
    );
  }
}
