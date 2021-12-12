import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'event.dart';
part 'state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonListState initialState;
  PokemonListBloc([this.initialState = const PokemonListLoadingState()])
      : super(initialState) {
    on<PokemonListLoadEvent>(
        (event, emit) => emit(const PokemonListLoadedSuccessState()));
    on<PokemonListReloadEvent>(
        (event, emit) => emit(const PokemonListLoadingState()));
  }
}
