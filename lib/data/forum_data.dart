import 'dart:convert';

import 'package:ps_rental_app/data/global_data.dart';
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
}
