import 'package:pokedex/data/pokedex_api_provider.dart';
import 'package:pokedex/models/pokemon.dart';

class PokedexApiRepository {
  final PokedexApiProvider _pokedexApiProvider = PokedexApiProvider();

  Future<List<Pokemon>> fetchFirst20Pokemons() =>
      _pokedexApiProvider.fetchFirst20Pokemons();
}
