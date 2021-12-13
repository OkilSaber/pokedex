class PokemonSprites {
  String frontDefault;
  String frontShiny;
  String frontFemale;
  String frontShinyFemale;
  String backDefault;
  String backShiny;
  String backFemale;
  String backShinyFemale;

  PokemonSprites({
    required this.frontDefault,
    required this.frontShiny,
    required this.frontFemale,
    required this.frontShinyFemale,
    required this.backDefault,
    required this.backShiny,
    required this.backFemale,
    required this.backShinyFemale,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonSprites(
      frontDefault: parsedJson["front_default"].toString(),
      frontShiny: parsedJson["front_shiny"].toString(),
      frontFemale: parsedJson["front_female"].toString(),
      frontShinyFemale: parsedJson["front_shiny_female"].toString(),
      backDefault: parsedJson["back_default"].toString(),
      backShiny: parsedJson["back_shiny"].toString(),
      backFemale: parsedJson["back_female"].toString(),
      backShinyFemale: parsedJson["back_shiny_female"].toString(),
    );
  }
}
