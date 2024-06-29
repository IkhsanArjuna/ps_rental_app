import 'package:flutter/material.dart';
import 'package:ps_rental_app/data/auth_data.dart';
import 'package:ps_rental_app/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController etEmailRegister = TextEditingController();
  TextEditingController etPasswordRegister = TextEditingController();
  TextEditingController etNameRegister = TextEditingController();

  TextEditingController etEmailLogin = TextEditingController();
  TextEditingController etPasswordLogin = TextEditingController();
  bool registerIsLoading = false;
  bool loginIsLoading = false;
  UserModel? userLoginNow;

  Future<bool> loginUser() async {
    loginIsLoading = true;
    notifyListeners();
    UserModel? data =
        await AuthData().loginUser(etEmailLogin.text, etPasswordLogin.text);
    if (data != null) {
      userLoginNow = data;
      loginIsLoading = false;
      notifyListeners();
      return true;
    } else {
      loginIsLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> registerUser() async {
    registerIsLoading = true;
    notifyListeners();
    bool data = await AuthData().registerUser(
        etEmailRegister.text, etNameRegister.text, etPasswordRegister.text);
    if (data) {
      registerIsLoading = false;
      notifyListeners();
      return true;
    } else {
      registerIsLoading = false;
      notifyListeners();
      return false;
    }
  }
}
