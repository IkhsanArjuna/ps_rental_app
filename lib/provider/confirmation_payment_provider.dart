import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ps_rental_app/data/payment_data.dart';
import 'package:ps_rental_app/models/cart_item_model.dart';
import 'package:ps_rental_app/models/duration_model.dart';
import 'package:ps_rental_app/models/payment_model.dart';
import 'package:ps_rental_app/models/payment_succes_model.dart';

class ConfirmationPaymentProvider extends ChangeNotifier {
  PaymentSuccesModel? paymentSuccesModel;
  List<ItemPaymentModel> itemsPayment = [];
  bool isLoading = false;
  bool updateLoading = false;
  String message = '';

  Future<bool> payOrder(int idUser, DurationModel durasi) async {
    PaymentModel paymentModel = PaymentModel(
        dataItem: itemsPayment,
        idUser: idUser,
        tanggalKembali: pickDuration(durasi),
        tanggalSewa: pickDuration(
            DurationModel(durasi: '1D', value: 0, isPicked: true)));
    try {
      await PaymentData().createPaymentItem(paymentModel).then(
        (value) {
          if (value != null) {
            paymentSuccesModel = value;
          }
          notifyListeners();
          return true;
        },
      );
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> updateRent() async {
    updateLoading = true;
    notifyListeners();
    try {
      await PaymentData().updateRent(paymentSuccesModel!.orderId).then(
        (value) {
          message = value;
           updateLoading = false;
           notifyListeners();
          return true;
        },
      );
    } catch (e) {
      message = 'Error';
       updateLoading = false;
       notifyListeners();
      return false;
    }
     updateLoading = false;
    notifyListeners();
    return true;
  }

  void initialItemPayment(List<CartItemModel> cart) {
    itemsPayment.clear();
    for (var element in cart) {
      if (!element.isHeader) {
        itemsPayment.add(ItemPaymentModel(
            idItem: element.idItem, quantity: element.quantity));
      }
    }
  }

  String pickDuration(DurationModel durasi) {
    DateTime dateTime = DateTime.now().add(Duration(days: durasi.value));
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String dateFormatTime = dateFormat.format(dateTime);
    return dateFormatTime;
  }
}
