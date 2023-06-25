import 'package:pokedex/structs/sprites.dart';
import 'package:pokedex/structs/stat.dart';

class Pokemon {
  int id;
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int order;
  int weight;
  Sprites sprites;
  List<Stat> stats;
  // List<Abilitiy> abilities;
  // List<PokemonForm> forms;
  // List<GameIndice> game_indices;
  // List<Item> held_items;
  // String location_area_encounters;
  // List<Move> moves;
  // Specie species;
  List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.sprites,
    required this.types,
    required this.stats,
    // this.abilities,
    // this.forms,
    // this.game_indices,
    // this.held_items,
    // this.location_area_encounters,
    // this.moves,
    // this.species,
    // this.stats,
    // this.types,
  });

  // from json method
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    // print(json);
    List<String> types = [];
    json['types'].forEach((type) => types.add(type['type']['name']));
    return Pokemon(
      id: json['id'],
      name: json['name'],
      baseExperience: json["base_experience"] ?? 0,
      height: json['height'],
      isDefault: json['is_default'],
      order: json['order'],
      weight: json['weight'],
      sprites: Sprites.fromJson(json['sprites']),
      types: types,
      stats: json['stats'].map<Stat>((stat) => Stat.fromJson(stat)).toList(),
      // abilities: json['abilities'],
      // forms: json['forms'],
      // game_indices: json['game_indices'],
      // held_items: json['held_items'],
      // location_area_encounters: json['location_area_encounters'],
      // moves: json['moves'],
      // species: json['species'],
      // stats: json['stats'],
    );
  }
}
