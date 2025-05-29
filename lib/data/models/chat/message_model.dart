import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hushin/domain/entities/chat/messeage_entity.dart';

class MessageModel extends MesseageEntity {
  MessageModel({
    required super.senderId,
    required super.messeage,
    required super.recieverId,
    required super.timestamp,
  });
  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'],
      messeage: map['messeage'],
      recieverId: map['recieverId'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'messeage': messeage,
      'recieverId': recieverId,
      'timestamp': timestamp,
    };
  }
}
