import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'event.dart';
part 'state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchState initialState;
  SearchBloc([this.initialState = const SearchLoadingState()])
      : super(initialState) {
    on<SearchLoadEvent>(
        (event, emit) => emit(const SearchLoadedSuccessState()));
    on<SearchReloadEvent>((event, emit) => emit(const SearchLoadingState()));
  }
}
