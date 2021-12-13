class Pokemon {
  int id;
  String name;
  int baseExperience;
  int height;
  int order;
  int weight;
  String locationAreaEncounters;

  Pokemon({
    required this.id,
    required this.baseExperience,
    required this.height,
    required this.locationAreaEncounters,
    required this.name,
    required this.order,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> parsedJson) {
    return Pokemon(
      id: parsedJson["id"],
      baseExperience: parsedJson["base_experience"],
      height: parsedJson["height"],
      locationAreaEncounters: parsedJson["location_area_encounters"].toString(),
      name: parsedJson["name"].toString(),
      order: parsedJson["order"],
      weight: parsedJson["weight"],
    );
  }
}
