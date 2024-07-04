import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/chat_forum_model.dart';

class ChatForumProvider extends ChangeNotifier {
  TextEditingController etMessage = TextEditingController();
  TextEditingController etGambar = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  List<ChatForumModel> chatAwal = [];
  bool isLoading = false;
  XFile? file;
  File? fileImage;

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
    etGambar.text = '';
    isLoading = false;
    notifyListeners();
  }

  Future<bool> getImagePath() async {
    try {
      XFile? fileImageTemp =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (fileImageTemp != null) {
        file = fileImageTemp;
        fileImage = File(file!.path);
        log(fileImage!.path);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
