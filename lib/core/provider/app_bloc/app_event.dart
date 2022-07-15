part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {}

class GetPageEvent extends AppEvent {
  final String category;

  GetPageEvent({required this.category});
  @override
  List<Object?> get props => [category];
}


