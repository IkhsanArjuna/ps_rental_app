import 'dart:convert';

import 'package:ps_rental_app/data/global_data.dart';
import 'package:ps_rental_app/models/game_model.dart';
import 'package:http/http.dart' as http;

class GameData {
  Future<List<GameModel>> getAllGameBydItem(int idItem) async {
    List<GameModel> gameDatas = [];

    var response = await http
        .get(Uri.parse("${baseUrl}/item/game/filter?id_barang=${idItem}"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> jsonMapping =
          (jsonData as Map<String, dynamic>)['data']['games'];

      for (var element in jsonMapping) {
        gameDatas.add(GameModel.getDataFromJSON(element));
      }
      return gameDatas;
    } else {
      return gameDatas;
    }
  }
}
