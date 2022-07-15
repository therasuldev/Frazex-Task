// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable {}

class Empty extends AppState {
  @override
  List<Object?> get props => [];
}

class Loading extends AppState {
  @override
  List<Object?> get props => [];
}

class Success extends AppState {
 final List<NewsModel> model;
  Success({required this.model});
  @override
  List<Object?> get props => [model];
}

class Error extends AppState {
  final String message;

  Error({required this.message});
  @override
  List<Object?> get props => [message];
}
