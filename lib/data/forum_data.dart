import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ps_rental_app/data/global_data.dart';
import 'package:ps_rental_app/models/chat_forum_model.dart';
import 'package:ps_rental_app/models/forum_model.dart';
import 'package:http/http.dart' as http;

class ForumData {
  Future<List<ForumModel>> getALlForum() async {
    List<ForumModel> forumData = [];

    var response = await http.get(Uri.parse("${baseUrl}/forum/1"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> jsonMapp = (jsonData as Map<String, dynamic>)['data'];
      for (var element in jsonMapp) {
        forumData.add(ForumModel.getDataFromJSON(element));
      }
      return forumData;
    } else {
      return forumData;
    }
  }

  Future<List<ChatForumModel>> getAllMessageForum(int idForum) async {
    List<ChatForumModel> forumChat = [];

    var response =
        await http.get(Uri.parse("${baseUrl}/forum/single/chat/${idForum}"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> jsonMapping =
          (jsonData as Map<String, dynamic>)['data']['chats'];
      for (var element in jsonMapping) {
        forumChat.add(ChatForumModel.getDataFromJSON(element));
      }
      return forumChat;
    } else {
      return forumChat;
    }
  }

  Future<String> uploadImage(File fileImage) async {
    Dio dio = Dio();
    String imageURL = '';
    try {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(fileImage.path,
            filename: fileImage.path.split('/').last)
      });
      var response = await dio.post(
        "${baseUrl}/other/upload",
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
        onSendProgress: (count, total) {
          log('${count},${total}');
        },
      );
      if (response.statusCode == 200) {
        imageURL = response.data['data']['url'];
        return imageURL;
      } else {
        return imageURL;
      }
    } catch (e) {
      log('Error: $e');
      return imageURL;
    }
  }
}
