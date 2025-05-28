import 'package:hushin/data/models/home/user_model.dart';
import 'package:hushin/domain/entities/home/home_user_entities.dart';
import 'package:hushin/domain/repository/home/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImple implements UserRepository {
  final FirebaseFirestore firestore;
  UserRepositoryImple({required this.firestore});
  @override
  Future<List<HomeUserEntities>> getUsers() async {
    final snapshot = await firestore.collection('users').get();
    return snapshot.docs.map((doc) {
      return UserModel.fromMap(doc.data(), doc.id);
    }).toList();
  }
}
