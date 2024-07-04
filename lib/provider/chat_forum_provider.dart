import 'package:flutter/material.dart';
import '../models/chat_forum_model.dart';

class ChatForumProvider extends ChangeNotifier {
  TextEditingController etMessage = TextEditingController();
  List<ChatForumModel> chatAwal = [];
  bool isLoading = false;

  void addChatAwal(List<ChatForumModel> newChat) {
    chatAwal = newChat;
  }

  void updateChatAwal(ChatForumModel newChat) {
    chatAwal.add(newChat);
    notifyListeners();
  }

  void loading() {
    isLoading = true;
    notifyListeners();
  }

  void resetText() {
    etMessage.text = '';
    isLoading = false;
    notifyListeners();
  }
}
