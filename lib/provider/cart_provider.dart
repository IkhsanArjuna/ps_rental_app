import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ps_rental_app/models/cart_item_model.dart';
import 'package:ps_rental_app/models/item_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> cartList = [];
  int totalPrice = 0;
  List<CartItemModel> pickedCart = [];
  List<ItemModel> itemDummy = [
    ItemModel(
        deskripsi: "Test Dummy",
        idItem: 1,
        image: '',
        name: "Dummy Ps 1",
        price: 5000,
        rating: 3,
        stock: 10,
        type: 'PS4'),
    ItemModel(
        deskripsi: "Test Dummy",
        idItem: 2,
        image: '',
        name: "Dummy Ps 2",
        price: 6000,
        rating: 4.5,
        stock: 15,
        type: 'PS4'),
    ItemModel(
        deskripsi: "Test Dummy",
        idItem: 3,
        image: '',
        name: "Dummy Ps 3",
        price: 7000,
        rating: 3,
        stock: 5,
        type: 'PS4'),
    ItemModel(
        deskripsi: "Test Dummy",
        idItem: 4,
        image: '',
        name: "Dummy Ps 4",
        price: 8000,
        rating: 3,
        stock: 7,
        type: 'PS4'),
    ItemModel(
        deskripsi: "Test Dummy",
        idItem: 5,
        image: '',
        name: "Dummy Ps 5",
        price: 9000,
        rating: 3,
        stock: 9,
        type: 'PS4'),
  ];

  void addToCart(ItemModel newItem) {
    if (cartList.isEmpty) {
      cartList.add(CartItemModel(
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
          log(cartList[i].idItem.toString());
          log(newItem.idItem.toString());
          cartList[i].quantity += 1;
          break;
        } else if (i + 1 >= cartList.length) {
          cartList.add(CartItemModel(
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

  void calculatedPrice() {
    pickedCart = [];
    totalPrice = 0;
    for (var element in cartList) {
      if (element.isPicked) {
        pickedCart.add(element);
        totalPrice += element.price;
      }
    }
  }
}
