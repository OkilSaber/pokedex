part of 'bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class SearchLoadEvent extends SearchEvent {
  const SearchLoadEvent();
}

class SearchReloadEvent extends SearchEvent {
  const SearchReloadEvent();
}
