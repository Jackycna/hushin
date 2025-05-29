import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hushin/data/models/chat/message_model.dart';
import 'package:hushin/domain/entities/chat/messeage_entity.dart';
import 'package:hushin/domain/repository/chat/chat_repository.dart';

class ChatRepositoryImple implements ChatRepository {
  final FirebaseFirestore firestore;
  ChatRepositoryImple({required this.firestore});

  @override
  Stream<List<MesseageEntity>> getmessages(String chatId) {
    return firestore
        .collection('chats/$chatId/messages')
        .orderBy('timestamp')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => MessageModel.fromMap(doc.data()))
                  .toList(),
        );
  }

  @override
  Future<void> sendMessage(String chatId, MesseageEntity messeage) async {
    await firestore
        .collection('chats/$chatId/messages')
        .add(
          MessageModel(
            senderId: messeage.senderId,
            messeage: messeage.messeage,
            recieverId: messeage.recieverId,
            timestamp: messeage.timestamp,
          ).toMap(),
        );
  }
}
