part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {}

class Search extends SearchEvent {
  final String query;
  final String category;

  Search({required this.query,required this.category});

  @override
  List<Object?> get props => [query,category];
}
