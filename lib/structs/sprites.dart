class Sprites {
  String frontDefault;
  String backDefault;
  String frontFemale;
  String backFemale;
  String frontShiny;
  String backShiny;
  String backShinyFemale;
  String frontShinyFemale;

  Sprites({
    required this.frontDefault,
    required this.backDefault,
    required this.frontFemale,
    required this.backFemale,
    required this.frontShiny,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontShinyFemale,
  });

  // create a from json method
  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      frontDefault: json['front_default'] ?? "",
      backDefault: json['back_default'] ?? "",
      frontFemale: json['front_female'] ?? "",
      backFemale: json['back_female'] ?? "",
      frontShiny: json['front_shiny'] ?? "",
      backShiny: json['back_shiny'] ?? "",
      frontShinyFemale: json['front_shiny_female'] ?? "",
      backShinyFemale: json['back_shiny_female'] ?? "",
    );
  }

  Map<String, String> toMap() {
    return {
      'frontDefault': frontDefault,
      'backDefault': backDefault,
      'frontFemale': frontFemale,
      'backFemale': backFemale,
      'frontShiny': frontShiny,
      'backShiny': backShiny,
      'frontShinyFemale': frontShinyFemale,
      'backShinyFemale': backShinyFemale,
    };
  }
}
