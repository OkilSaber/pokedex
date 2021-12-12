part of 'bloc.dart';

abstract class PokemonListState {
  const PokemonListState();
}

class PokemonListLoadedSuccessState extends PokemonListState {
  const PokemonListLoadedSuccessState();
}

class PokemonListLoadingState extends PokemonListState {
  const PokemonListLoadingState();
}

class PokemonListLoadErrorState extends PokemonListState {
  final String cause;
  const PokemonListLoadErrorState(this.cause);
}
