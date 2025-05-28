import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hushin/data/models/auth/create_user_req.dart';
import 'package:hushin/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createuserreq);
  Future<Either> signin(SigninUserReq signinuserreq);
}

class AuthFirebaseImple extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinuserreq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinuserreq.email,
        password: signinuserreq.password,
      );
      return Right('SignIn was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'The email is invalid';
      } else if (e.code == 'invalis-credential') {
        message = 'Wrong password provided';
      }
      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createuserreq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createuserreq.email,
        password: createuserreq.password,
      );
      return Right('SignUp was Successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password Provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'Email acount already used';
      }
      return left(message);
    }
  }
}
