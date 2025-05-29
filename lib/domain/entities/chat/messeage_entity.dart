class MesseageEntity {
  final String senderId;
  final String messeage;
  final String recieverId;
  final DateTime timestamp;
  MesseageEntity({
    required this.senderId,
    required this.messeage,
    required this.recieverId,
    required this.timestamp,
  });
}
