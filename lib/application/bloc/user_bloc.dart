import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/application/state/user__state.dart';
import 'package:hushin/domain/entities/home/home_user_entities.dart';
import 'package:hushin/domain/repository/home/user_repository.dart';

class UserBloc extends Cubit<UserState> {
  final UserRepository repository;
  List<HomeUserEntities> allUser = [];
  UserBloc(this.repository) : super(UserInitialState());
  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final users = await repository.getUsers();
      allUser = users;
      emit(UserLoaddedState(users));
    } catch (e) {
      emit(UserErrorState("fsiled to fetch data"));
    }
  }

  void searchUser(String query) {
    if (query.isEmpty) {
      emit(UserLoaddedState(allUser));
      return;
    }
    final filter =
        allUser.where((user) {
          final name = user.name?.toLowerCase() ?? '';
          return name.toLowerCase().contains(query.toLowerCase());
        }).toList();
    emit(UserLoaddedState(filter));
  }
}
