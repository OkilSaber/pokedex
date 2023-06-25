class Sprites {
  String backDefault;
  String backFemale;
  String backShiny;
  String backShinyFemale;
  String frontDefault;
  String frontFemale;
  String frontShiny;
  String frontShinyFemale;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  // create a from json method
  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      backDefault: json['back_default'] ?? "",
      backFemale: json['back_female'] ?? "",
      backShiny: json['back_shiny'] ?? "",
      backShinyFemale: json['back_shiny_female'] ?? "",
      frontDefault: json['front_default'] ?? "",
      frontFemale: json['front_female'] ?? "",
      frontShiny: json['front_shiny'] ?? "",
      frontShinyFemale: json['front_shiny_female'] ?? "",
    );
  }
}
