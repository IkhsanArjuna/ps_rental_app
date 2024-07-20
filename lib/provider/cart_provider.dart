import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ps_rental_app/models/cart_item_model.dart';
import 'package:ps_rental_app/models/duration_model.dart';
import 'package:ps_rental_app/models/item_model.dart';
import 'package:ps_rental_app/models/payment_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> cartList = [];
  int totalPrice = 0;
  bool isAll = false;
  List<CartItemModel> pickedCart = [];

  List<DurationModel> durasi = [
    DurationModel(durasi: "1D", value: 1, isPicked: true),
    DurationModel(durasi: "3D", value: 3, isPicked: false),
    DurationModel(durasi: "5D", value: 5, isPicked: false),
    DurationModel(durasi: "1W", value: 7, isPicked: false)
  ];

  DurationModel pickedDuration =
      DurationModel(durasi: "1D", value: 1, isPicked: true);

  void changeDuration(int index) {
    pickedDuration = durasi[index];
    DateTime dateTime =
        DateTime.now().add(Duration(days: pickedDuration.value));

    for (var element in durasi) {
      element.isPicked = false;
    }
    durasi[index].isPicked = true;
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String dateFormatTime = dateFormat.format(dateTime);
    notifyListeners();
  }

  String pickDuration(DurationModel durasi) {
    DateTime dateTime = DateTime.now().add(Duration(days: durasi.value));
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String dateFormatTime = dateFormat.format(dateTime);
    return dateFormatTime;
  }

  int pickedItemLenght() {
    int lenghts = 0;
    for (var element in pickedCart) {
      if (!element.isHeader) {
        lenghts += 1;
      }
    }
    return lenghts;
  }

  void addToCart(ItemModel newItem) {
    if (cartList.isEmpty) {
      cartList.add(CartItemModel(
          isHeader: false,
          deskripsi: newItem.deskripsi,
          idItem: newItem.idItem,
          image: newItem.image,
          isPicked: false,
          name: newItem.name,
          price: newItem.price,
          rating: newItem.rating,
          stock: newItem.stock,
          quantity: 1,
          type: newItem.type));
    } else {
      for (var i = 0; i < cartList.length; i++) {
        if (newItem.idItem == cartList[i].idItem) {
          cartList[i].quantity += 1;
          break;
        } else if (i + 1 >= cartList.length) {
          cartList.add(CartItemModel(
              isHeader: false,
              deskripsi: newItem.deskripsi,
              idItem: newItem.idItem,
              image: newItem.image,
              isPicked: false,
              name: newItem.name,
              price: newItem.price,
              rating: newItem.rating,
              stock: newItem.stock,
              quantity: 1,
              type: newItem.type));
          break;
        }
      }
    }
    Fluttertoast.showToast(msg: "Item Add To Cart");
    notifyListeners();
  }

  void clearCartList() {
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i].isHeader) {
        cartList.removeAt(i);
      }
    }
  }

  void sortingCart() {
    cartList.sort(
      (a, b) => a.type.compareTo(b.type),
    );
    List<CartItemModel> listTemp = [];
    String temp = '';
    for (var element in cartList) {
      log(element.type);
      if (temp == '') {
        listTemp.add(CartItemModel(
            deskripsi: '',
            idItem: 0,
            isHeader: true,
            image: '',
            quantity: 0,
            isPicked: false,
            name: element.type,
            price: 0,
            rating: 0,
            stock: 0,
            type: ''));
        temp = element.type;
      }
      if (element.type == temp) {
        listTemp.add(element);
      } else {
        listTemp.add(CartItemModel(
            deskripsi: '',
            idItem: 0,
            isHeader: true,
            image: '',
            quantity: 0,
            isPicked: false,
            name: element.type,
            price: 0,
            rating: 0,
            stock: 0,
            type: ''));
        temp = element.type;
        listTemp.add(element);
      }
    }
    cartList = listTemp;
  }

  void incrementQuantity(int index) {
    if (cartList[index].quantity >= cartList[index].stock) {
      Fluttertoast.showToast(msg: "Stock Tidak Mencukupi");
    } else {
      cartList[index].quantity += 1;
      calculatedPrice();
    }
    notifyListeners();
  }

  void changePicked(bool newValue, int index) {
    cartList[index].isPicked = newValue;
    calculatedPrice();
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (cartList[index].quantity <= 1) {
      Fluttertoast.showToast(msg: "Quantity Tidak Boleh 0");
    } else {
      cartList[index].quantity -= 1;
      calculatedPrice();
      notifyListeners();
    }
  }

  void deleteItem(int index) {
    cartList.removeAt(index);
    calculatedPrice();
    notifyListeners();
  }

  void checkAllItem(bool newValue) {
    if (newValue) {
      isAll = newValue;
      for (var element in cartList) {
        if (element.isPicked == false) {
          pickedCart.add(element);
          element.isPicked = true;
          totalPrice += (element.price * element.quantity);
        }
      }
    } else {
      isAll = newValue;
      pickedCart = [];
      totalPrice = 0;
      for (var element in cartList) {
        element.isPicked = false;
      }
    }

    notifyListeners();
  }

  void bannerCheckup(String name, int index, bool newValue) {
    if (newValue) {
      cartList[index].isPicked = newValue;
      for (var element in cartList) {
        if (element.type == name) {
          element.isPicked = true;
        }
      }
    } else {
      cartList[index].isPicked = newValue;
      for (var element in cartList) {
        if (element.type == name) {
          element.isPicked = false;
        }
      }
    }

    calculatedPrice();
    notifyListeners();
  }

  void calculatedPrice() {
    pickedCart = [];
    totalPrice = 0;
    for (var element in cartList) {
      if (element.isPicked) {
        pickedCart.add(element);
        totalPrice += (element.price * element.quantity);
      }
    }
  }

  List<CartItemModel> toPaymentDetail(int idUser) {
    List<CartItemModel> fixItem = [];
    for (var element in pickedCart) {
      if (!element.isHeader) {
        fixItem.add(element);
      }
    }
    return fixItem;
  }
}
