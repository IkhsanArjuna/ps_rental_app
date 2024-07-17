import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ps_rental_app/data/auth_data.dart';
import 'package:ps_rental_app/models/user_model.dart';

class EditProfileProvider extends ChangeNotifier {
  UserModel? userModel;

  bool isLoading = false;
  TextEditingController etName = TextEditingController();
  final imagePicker = ImagePicker();
  XFile? file;
  File? fileImage;

  void saveInformationUser(UserModel userLoginNow) {
    userModel = userLoginNow;
  }

  void initialText(String name) {
    etName.text = name;
  }

  Future<bool> editProfileName() async {
    isLoading = true;
    notifyListeners();
    try {
      await AuthData().updateUser(userModel!.idUser, etName.text, '').then(
        (value) async {
          if (value) {
            await AuthData().getSingleUser(userModel!.idUser).then(
              (value) {
                if (value != null) {
                  saveInformationUser(value);
                  isLoading = false;
                  notifyListeners();
                  return true;
                } else {
                  isLoading = false;
                  notifyListeners();
                  return false;
                }
              },
            );
          } else {
            isLoading = false;
            notifyListeners();
            return false;
          }
        },
      );
    } catch (e) {
      log(e.toString());
      isLoading = false;
      notifyListeners();
      return false;
    }
    return true;
  }

  Future<bool> editProfileImage()async {
     isLoading = true;
    notifyListeners();
    try {
      await AuthData().updateUser(userModel!.idUser, userModel!.name, fileImage!.path).then(
        (value) async {
          if (value) {
            await AuthData().getSingleUser(userModel!.idUser).then(
              (value) {
                if (value != null) {
                  saveInformationUser(value);
                  isLoading = false;
                  notifyListeners();
                  return true;
                } else {
                  isLoading = false;
                  notifyListeners();
                  return false;
                }
              },
            );
          } else {
            isLoading = false;
            notifyListeners();
            return false;
          }
        },
      );
    } catch (e) {
      log(e.toString());
      isLoading = false;
      notifyListeners();
      return false;
    }
    return true;
  }

  void loadingImage(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<bool> getImagePath(bool isCamera) async {
    try {
      XFile? xfileTemp = await imagePicker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);
      if (xfileTemp != null) {
        file = xfileTemp;
        fileImage = File(file!.path);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

}
