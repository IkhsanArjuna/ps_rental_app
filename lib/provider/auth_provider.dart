import 'package:flutter/material.dart';
import 'package:ps_rental_app/data/auth_data.dart';
import 'package:ps_rental_app/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController etEmailRegister = TextEditingController();
  TextEditingController etPasswordRegister = TextEditingController();
  TextEditingController etNameRegister = TextEditingController();

  TextEditingController etEmailLogin = TextEditingController();
  TextEditingController etPasswordLogin = TextEditingController();

  UserModel? userLoginNow;

  Future<bool> loginUser() async {
    await AuthData().loginUser(etEmailLogin.text, etPasswordLogin.text).then(
      (value) {
        if (value != null) {
          userLoginNow = value;
          return true;
        } else {
          return false;
        }
      },
    );
    return false;
  }

  Future<bool> registerUser() async {
    await AuthData()
        .registerUser(
            etEmailRegister.text, etNameRegister.text, etPasswordRegister.text)
        .then(
      (value) {
        if (value) {
          return true;
        } else {
          return false;
        }
      },
    );
    return false;
  }
}
