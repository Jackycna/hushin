import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/application/bloc/call_bloc.dart';
import 'package:hushin/application/bloc/chat_bloc.dart';
import 'package:hushin/core/colors/app_colors.dart';
import 'package:hushin/domain/entities/call/call_entities.dart';
import 'package:hushin/domain/entities/chat/messeage_entity.dart';
import 'package:hushin/features/permission/audio_permission.dart';
import 'package:hushin/pages/callspage/calls_page.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId;
  final String otherUserId;
  final String otherUserName;
  const ChatScreen({
    super.key,
    required this.currentUserId,
    required this.otherUserId,
    required this.otherUserName,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final TextEditingController controller;
  late final String chatId;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    chatId = generateChatId(widget.currentUserId, widget.otherUserId);
    context.read<ChatBloc>().loadMessages(chatId);
  }

  String generateChatId(String id1, String id2) {
    final ids = [id1, id2]..sort();
    return ids.join();
  }

  void sendmeseage() {
    if (controller.text.trim().isEmpty) return;
    final messeage = MesseageEntity(
      senderId: widget.currentUserId,
      messeage: controller.text.trim(),
      recieverId: widget.otherUserId,
      timestamp: DateTime.now(),
    );
    context.read<ChatBloc>().send(chatId, messeage);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.otherUserName),
        actions: [
          IconButton(
            onPressed: () async {
              final haspermission = await checkAudio();

              if (!haspermission) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('MicroPhone Permission denied')),
                );
                return;
              }
              final call = CallEntities(
                appId: '861223376f2f47a8af16c28911fd2462',
                token:
                    '007eJxTYFA7Ybh2ov9+u1t9bYH28epK3ttd7OxbCzmyzPL9jmqLlSswWJgZGhkZG5ubpRmlmZgnWiSmGZolG1lYGhqmpRiZmBkd/Gie0RDIyLD74gIGRigE8TkYkjMSS+INjYwZGADAPR1z',
                channelName: 'chat_123',
              );

              context.read<CallBloc>().startcall(call);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CallsPage()),
              );
            },
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: Icon(Icons.call, size: 40),
            ),
          ),
        ],
        backgroundColor: AppColors.primarycolor,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, List<MesseageEntity>>(
              builder: (context, messeage) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: messeage.length,
                  itemBuilder: (context, index) {
                    final msg = messeage[index];
                    final isme = msg.senderId == widget.currentUserId;
                    return Align(
                      alignment:
                          isme ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primarycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(msg.messeage),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      fillColor: AppColors.primarycolor,
                      hintText: 'Type here',
                      contentPadding: EdgeInsets.all(30),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendmeseage();
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
