part of 'bloc.dart';

@immutable
abstract class PokemonListEvent {
  const PokemonListEvent();
}

class PokemonListLoadEvent extends PokemonListEvent {
  const PokemonListLoadEvent();
}

class PokemonListReloadEvent extends PokemonListEvent {
  const PokemonListReloadEvent();
}
