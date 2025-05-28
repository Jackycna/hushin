import 'package:hushin/domain/entities/home/home_user_entities.dart';

abstract class UserRepository {
  Future<List<HomeUserEntities>> getUsers();
}
