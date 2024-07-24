import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ps_rental_app/data/item_data.dart';
import 'package:ps_rental_app/models/rent_model.dart';
import 'package:ps_rental_app/models/review_pick_item_model.dart';

class RentDetailReviewProvider extends ChangeNotifier {
  ReviewPickItemModel? pickedItem;
  List<ReviewPickItemModel> items = [];
  TextEditingController etReview = TextEditingController();
  bool isLoading = false;

  List<bool> stars = [false, false, false, false, false];
  int point = 0;

  void initialItems(RentModel rent) {
    pickedItem = null;
    point = 0;
    for (var i = 0; i < stars.length; i++) {
      stars[i] = false;
    }
    items.clear();
    for (var element in rent.itemRents) {
      items.add(ReviewPickItemModel(
          idBarang: element.idBarang,
          quantity: element.quantity,
          image: element.image,
          isPicked: false,
          name: element.name,
          price: rent.harga,
          tanggalKembali: rent.tanggalKembali));
    }
  }

  void pickedItemFunct(int index) {
    if (!items[index].isPicked) {
      for (var i = 0; i < items.length; i++) {
        items[i].isPicked = false;
      }
      items[index].isPicked = true;
      pickedItem = items[index];
      notifyListeners();
    } else {
      items[index].isPicked = false;
      pickedItem = null;
      notifyListeners();
    }
  }

  bool validatePickedItem() {
    if (pickedItem == null) {
      return false;
    } else {
      return true;
    }
  }

  void starsChange(int index) {
    point = 0;
    for (var i = 0; i < stars.length; i++) {
      stars[i] = false;
    }
    for (var i = 0; i < index + 1; i++) {
      stars[i] = true;
      point += 1;
    }
    log(point.toString());
    notifyListeners();
  }

  Future<bool> createReview(int idUser) async {
    if (etReview.text.trim() == '' || point == 0) {
      return false;
    } else {
      isLoading = true;
      notifyListeners();
      try {
        if (await ItemData()
            .createReview(idUser, pickedItem!.idBarang, point, etReview.text)) {
          isLoading = false;
          notifyListeners();
          return true;
        } else {
          isLoading = false;
          notifyListeners();
          return false;
        }
      } catch (e) {
        log(e.toString());
        isLoading = false;
          notifyListeners();
        return false;
      }
    }
  }
}
