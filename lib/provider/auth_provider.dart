import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  Future<bool> saveUserNow(int idUser) async {
    UserModel? userModel = await AuthData().getSingleUser(idUser);
    if (userModel != null) {
      userLoginNow = userModel;
      return true;
    } else {
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
