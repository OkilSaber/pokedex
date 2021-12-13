part of 'bloc.dart';

abstract class PokemonListState {
  const PokemonListState();
}

class PokemonListLoadedSuccessState extends PokemonListState {
  final List<Pokemon> pokemons;
  const PokemonListLoadedSuccessState(this.pokemons);
}

class PokemonListLoadingState extends PokemonListState {
  const PokemonListLoadingState();
}

class PokemonListLoadErrorState extends PokemonListState {
  final String cause;
  const PokemonListLoadErrorState(this.cause);
}
