import 'package:hushin/features/auth/pages/state/auth_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthState.initial());
  void createUser() {
    final tempId = const Uuid().v4();
    emit(state.copyWith(tempuser: tempId, isAuth: true));
  }

  void logout() {
    emit(AuthState.initial());
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toMap();
  }
}
