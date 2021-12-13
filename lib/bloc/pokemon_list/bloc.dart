import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/repository.dart';
import 'package:pokedex/models/pokemon.dart';
part 'event.dart';
part 'state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokedexApiRepository pokedexApiRepository = PokedexApiRepository();
  final PokemonListState initialState;
  PokemonListBloc([this.initialState = const PokemonListLoadingState()])
      : super(initialState) {
    on<PokemonListLoadEvent>(
        (event, emit) async => emit(await _loadRequest(event)));
    on<PokemonListReloadEvent>(
        (event, emit) => emit(const PokemonListLoadingState()));
  }

  Future<PokemonListState> _loadRequest(PokemonListLoadEvent event) async {
    final List<Pokemon> resp =
        await pokedexApiRepository.fetchFirst20Pokemons();
    return PokemonListLoadedSuccessState(resp);
  }
}
