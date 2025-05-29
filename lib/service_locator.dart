import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:hushin/application/bloc/call_bloc.dart';
import 'package:hushin/application/bloc/chat_bloc.dart';
import 'package:hushin/data/repository/auth/auth_repository_imple.dart';
import 'package:hushin/data/repository/call/call_repository_imple.dart';

import 'package:hushin/data/repository/chat/chat_repository_imple.dart';
import 'package:hushin/data/sources/auth/auth_firebase_service.dart';
import 'package:hushin/domain/repository/auth/auth_repository.dart';
import 'package:hushin/domain/repository/chat/chat_repository.dart';
import 'package:hushin/domain/usecases/auth/signin_usecase.dart';
import 'package:hushin/domain/usecases/auth/signup_usecase.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseImple());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImple());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<ChatRepository>(
    ChatRepositoryImple(firestore: FirebaseFirestore.instance),
  );
  sl.registerFactory(() => ChatBloc(sl()));
}
