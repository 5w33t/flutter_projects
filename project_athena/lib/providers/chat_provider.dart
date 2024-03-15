import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_athena/models/chat_model.dart';

class ChatNotifier extends StateNotifier<List<ChatModel>> {
  ChatNotifier()
      : super([
          ChatModel(
            id: '0',
            message: 'Hello! I am Athena.\nHow may I assist you today?',
            isMe: false,
          )
        ]);
  void add(ChatModel chatModel) {
    state = [...state, chatModel];
  }

  void removeTyping() {
    state = state..removeWhere((chat) => chat.id == 'typing');
  }
}

final chatsProvider = StateNotifierProvider<ChatNotifier, List<ChatModel>>(
  (ref) => ChatNotifier(),
);
