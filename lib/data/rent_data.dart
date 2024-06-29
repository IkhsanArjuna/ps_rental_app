import 'dart:convert';

import 'package:ps_rental_app/data/global_data.dart';
import 'package:ps_rental_app/models/rent_model.dart';
import 'package:http/http.dart' as http;

class RentData {
  Future<List<RentModel>> getAllRentById(int idUser) async {
    List<RentModel> allRent = [];
    var response =
        await http.get(Uri.parse("${baseUrl}/person/rent/${idUser}"));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> jsonMapData = (jsonData as Map<String, dynamic>)['data'];
      for (var element in jsonMapData) {
        allRent.add(RentModel.getDataFromJSON(element));
      }
      return allRent;
    } else {
      return allRent;
    }
  }
}
