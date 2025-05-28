import 'package:dartz/dartz.dart';
import 'package:hushin/core/usecase/usecase.dart';
import 'package:hushin/data/models/auth/create_user_req.dart';
import 'package:hushin/domain/repository/auth/auth_repository.dart';
import 'package:hushin/service_locator.dart';

class SignupUsecase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
