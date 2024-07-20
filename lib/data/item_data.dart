import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ps_rental_app/data/global_data.dart';
import 'package:ps_rental_app/models/detail_item-model.dart';
import 'package:ps_rental_app/models/item_model.dart';

class ItemData {
  Future<List<ItemModel>> getAllItemFilter(String filter) async {
    List<ItemModel> listItem = [];
    var response =
        await http.get(Uri.parse("${baseUrl}/item/1?filter=$filter"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> jsonDatas = (jsonData as Map<String, dynamic>)['data'];
      for (var element in jsonDatas) {
        listItem.add(ItemModel.getDataFromJSON(element));
      }
      return listItem;
    } else {
      return listItem;
    }
  }

  Future<List<ItemModel>> getAllItemSearch(String searchString) async {
    List<ItemModel> listItem = [];

    var response = await http
        .get(Uri.parse("${baseUrl}/item/search?item_name=${searchString}"));
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      List<dynamic> jsonMapping = (jsonObject as Map<String, dynamic>)['data'];
      for (var element in jsonMapping) {
        listItem.add(ItemModel.getDataFromJSON(element));
      }
      return listItem;
    } else {
      return listItem;
    }
  }

  Future<DetailItemModel?> getSingleItem(int IdItem) async {
    var response =
        await http.get(Uri.parse("${baseUrl}/item/single/${IdItem}"));
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      dynamic jsonMap = (jsonObject as Map<String, dynamic>)['data'];
      DetailItemModel detailItemModel = DetailItemModel.etDataFROMJSON(jsonMap);
      return detailItemModel;
    } else {
      return null;
    }
  }
}
