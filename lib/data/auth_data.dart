import 'dart:convert';

import 'package:ps_rental_app/data/global_data.dart';
import 'package:ps_rental_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthData {
  Future<UserModel?> loginUser(String email, String password) async {
    UserModel? usermodel;

    var response = await http.post(Uri.parse("${baseUrl}/person/login"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({"email": email, "password": password}));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      usermodel = UserModel.getDataFromJSON(jsonData);
      return usermodel;
    } else {
      return usermodel;
    }
  }

  Future<bool> registerUser(
      String email, String name, String password) async {

    var response = await http.post(Uri.parse("${baseUrl}/person/register"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({"email": email,"name": name, "password": password}));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }
}
