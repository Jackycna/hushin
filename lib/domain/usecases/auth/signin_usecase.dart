import 'package:dartz/dartz.dart';
import 'package:hushin/core/usecase/usecase.dart';
import 'package:hushin/data/models/auth/signin_user_req.dart';
import 'package:hushin/domain/repository/auth/auth_repository.dart';
import 'package:hushin/service_locator.dart';

class SigninUsecase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
