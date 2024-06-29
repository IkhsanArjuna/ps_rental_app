import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ps_rental_app/data/global_data.dart';
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
        return listItem;
      }
    } else {
      return listItem;
    }
    return listItem;
  }
  
}
