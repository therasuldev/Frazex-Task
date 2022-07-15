part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchEmpty extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoaded extends SearchState {
  final List<Map<String,dynamic>> news;

  SearchLoaded({required this.news});
  @override
  List<Object?> get props => [news];
}

class SearchError extends SearchState {
  @override
  List<Object?> get props => [];
}
