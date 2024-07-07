import 'package:flutter/material.dart';
import 'package:ps_rental_app/data/cs_data.dart';
import 'package:ps_rental_app/models/chat_cs_model.dart';
import 'package:ps_rental_app/models/cs_group_model.dart';

class CsProvider extends ChangeNotifier {
  List<CsGroupModel> csGroupFirst = [];
  bool isLoading = false;
  TextEditingController etPesan = TextEditingController();
  List<ChatCsModel> csChatAll = [];

  void addAllGroup(List<CsGroupModel> firstGroup) {
    csGroupFirst = firstGroup;
  }

  Future<void> refreshGroup(int idUser) async {
    List<CsGroupModel> newGroupList = await CsData().getAllGroup(idUser);

    csGroupFirst = newGroupList;
    notifyListeners();
  }

  void initialChat(List<ChatCsModel> newChat) {
    csChatAll = newChat;
  }

  void newChat(ChatCsModel updateChat) {
    csChatAll.add(updateChat);
    notifyListeners();
  }

  void loading() {
    isLoading = true;
    notifyListeners();
  }

  void resetText() {
    etPesan.text = '';
    isLoading = false;
    notifyListeners();
  }
}
