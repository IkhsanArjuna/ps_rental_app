import 'dart:convert';

import 'package:ps_rental_app/data/global_data.dart';
import 'package:ps_rental_app/models/admin_model.dart';
import 'package:ps_rental_app/models/chat_cs_model.dart';
import 'package:ps_rental_app/models/cs_group_model.dart';
import 'package:http/http.dart' as http;

class CsData {
  Future<List<CsGroupModel>> getAllGroup(int idUser) async {
    List<CsGroupModel> groupNow = [];

    var response =
        await http.get(Uri.parse("${baseUrl}/service/group/${idUser}"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> listJsonMap = (jsonData as Map<String, dynamic>)['data'];
      for (var element in listJsonMap) {
        groupNow.add(CsGroupModel.getDataFromJSON(element));
      }
      return groupNow;
    } else {
      return groupNow;
    }
  }

  Future<bool> createGroupAndFirstMessage(
      String adminName, int idUserNow, int idReceiver) async {
    String pesanAwal =
        "Halo ${adminName} saya ingin berkonsultasi tentang suatu hal";

    var responsee = await http.post(
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "id_sender": idUserNow,
          "id_receiver": idReceiver,
          "message": pesanAwal
        }),
        Uri.parse("${baseUrl}/service/group"));
    if (responsee.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<AdminModel>> getAllAdmin() async {
    List<AdminModel> allAdmin = [];

    var response =
        await http.get(Uri.parse("${baseUrl}/person/1?filter=admin"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> jsonMapping = (jsonData as Map<String, dynamic>)['data'];
      for (var element in jsonMapping) {
        allAdmin.add(AdminModel.getDataFromJSON(element));
      }
      return allAdmin;
    } else {
      return allAdmin;
    }
  }

  Future<List<ChatCsModel>> getAllChat(int idCs) async {
    List<ChatCsModel> allChat = [];
    var response =
        await http.get(Uri.parse("${baseUrl}/service/group/messages/${idCs}"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> jsonMapping = (jsonData as Map<String, dynamic>)['data'];
      for (var element in jsonMapping) {
        allChat.add(ChatCsModel.getDataFromJSON(element));
      }
      return allChat;
    } else {
      return allChat;
    }
  }
}
