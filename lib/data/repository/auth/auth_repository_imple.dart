import 'package:dartz/dartz.dart';
import 'package:hushin/data/models/auth/create_user_req.dart';
import 'package:hushin/data/models/auth/signin_user_req.dart';
import 'package:hushin/data/sources/auth/auth_firebase_service.dart';
import 'package:hushin/domain/repository/auth/auth_repository.dart';
import 'package:hushin/service_locator.dart';

class AuthRepositoryImple extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinuserreq) async {
    return await sl<AuthFirebaseService>().signin(signinuserreq);
  }

  @override
  Future<Either> signup(CreateUserReq createuserreq) async {
    return await sl<AuthFirebaseService>().signup(createuserreq);
  }
}
