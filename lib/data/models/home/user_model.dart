import 'package:hushin/domain/entities/home/home_user_entities.dart';

class UserModel extends HomeUserEntities {
  UserModel({required super.email, required super.name, required super.uid});
  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      uid: uid,
    );
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email};
  }
}
