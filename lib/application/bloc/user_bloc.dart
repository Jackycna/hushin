import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/application/state/user__state.dart';
import 'package:hushin/domain/repository/home/user_repository.dart';

class UserBloc extends Cubit<UserState> {
  final UserRepository repository;
  UserBloc(this.repository) : super(UserInitialState());
  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final users = await repository.getUsers();
      emit(UserLoaddedState(users));
    } catch (e) {
      emit(UserErrorState("fsiled to fetch data"));
    }
  }
}
