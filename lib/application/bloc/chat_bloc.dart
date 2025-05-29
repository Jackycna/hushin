import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/domain/entities/chat/messeage_entity.dart';
import 'package:hushin/domain/repository/chat/chat_repository.dart';

class ChatBloc extends Cubit<List<MesseageEntity>> {
  final ChatRepository repository;
  ChatBloc(this.repository) : super([]);
  void loadMessages(String chatId) {
    repository.getmessages(chatId).listen((messeages) {
      emit(messeages);
    });
  }

  Future<void> send(String chatId, MesseageEntity messeage) async {
    await repository.sendMessage(chatId, messeage);
  }
}
