import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class AuthState extends Equatable {
  final bool isAuth;
  final String? tempuser;
  const AuthState({this.isAuth = false, this.tempuser});
  factory AuthState.initial() => const AuthState();
  AuthState copyWith({String? tempuser, bool? isAuth}) {
    return AuthState(
      tempuser: tempuser ?? this.tempuser,
      isAuth: isAuth ?? this.isAuth,
    );
  }

  Map<String, dynamic> toMap() => {'tempUserId': tempuser, 'isAuth': isAuth};

  factory AuthState.fromMap(Map<String, dynamic> map) =>
      AuthState(tempuser: map['tempuser'], isAuth: map['isAuth'] ?? false);

  @override
  List<Object?> get props => [tempuser, isAuth];
}
