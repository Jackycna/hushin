import 'package:dartz/dartz.dart';
import 'package:hushin/data/models/auth/create_user_req.dart';
import 'package:hushin/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createuserreq);
  Future<Either> signin(SigninUserReq signinuserreq);
}
