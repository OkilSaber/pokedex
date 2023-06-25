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
  });

  // from json method
  factory Pokemon.fromJson(Map<String, dynamic> json) {
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
    );
  }
}
