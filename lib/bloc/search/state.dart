part of 'bloc.dart';

abstract class SearchState {
  const SearchState();
}

class SearchLoadedSuccessState extends SearchState {
  const SearchLoadedSuccessState();
}

class SearchLoadingState extends SearchState {
  const SearchLoadingState();
}

class SearchLoadErrorState extends SearchState {
  final String cause;
  const SearchLoadErrorState(this.cause);
}
