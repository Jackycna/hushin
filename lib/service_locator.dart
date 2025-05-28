import 'package:get_it/get_it.dart';
import 'package:hushin/data/repository/auth/auth_repository_imple.dart';
import 'package:hushin/data/sources/auth/auth_firebase_service.dart';
import 'package:hushin/domain/repository/auth/auth_repository.dart';
import 'package:hushin/domain/usecases/auth/signin_usecase.dart';
import 'package:hushin/domain/usecases/auth/signup_usecase.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseImple());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImple());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}
