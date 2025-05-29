import 'package:hushin/domain/entities/chat/messeage_entity.dart';

abstract class ChatRepository {
  Stream<List<MesseageEntity>> getmessages(String chatId);
  Future<void> sendMessage(String chatId, MesseageEntity messeage);
}
