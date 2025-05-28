import 'package:hushin/domain/entities/home/home_user_entities.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoaddedState extends UserState {
  final List<HomeUserEntities> users;
  UserLoaddedState(this.users);
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message);
}
